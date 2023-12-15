from manim import *


class Isomorphism(Scene):
    def construct(self):
        type_space_A = Polygon(
            [-4.5, -2, 0], [-4.5, 1, 0],
            [-2.5,  2, 0], [-1.5, 1, 0],
            [-0.5, 2, 0], [-0.5, -1, 0],
            [-1.5, -2, 0], [-3.5, -1, 0], color=BLUE, fill_opacity=1)
        type_space_B = Polygon(
            [0.5, -2, 0], [0.5, 1, 0],
            [1.5,  2, 0], [3.5, 1, 0],
            [4.5, 2, 0], [4.5, -1, 0],
            [3.5, -2, 0], [1.5, -1, 0], color=RED, fill_opacity=1)
        type_space_A.round_corners(0.3)
        type_space_B.round_corners(0.3)

        dot_a = Dot(point=[-2, -0.4, 0], color=RED)
        dot_a_text = Tex("a", color=RED,
                         font_size=28).next_to(dot_a, DOWN)
        dot_b = Dot(point=[-2.5, 1, 0], color=RED)
        dot_b_text = Tex("b", color=RED,
                         font_size=28).next_to(dot_b, DOWN)

        dot_fa = Dot(point=[2, -0.4, 0], color=BLUE)
        dot_fa_text = Tex("f(a)", color=YELLOW,
                          font_size=28).next_to(dot_fa, DOWN)
        dot_fb = Dot(point=[1.5, 1, 0], color=BLUE)
        dot_fb_text = Tex("f(b)", color=YELLOW,
                          font_size=28).next_to(dot_fb, DOWN)

        arc_a_fa = CurvedDoubleArrow(
            start_point=dot_a.get_center(),
            end_point=dot_fa.get_center(),
            radius=4,
            arc_center=[0, 0, 0],
            stroke_color=YELLOW
        )
        arc_b_fb = CurvedDoubleArrow(
            start_point=dot_b.get_center(),
            end_point=dot_fb.get_center(),
            radius=4,
            arc_center=[0, 0.4, 0],
            stroke_color=YELLOW)

        arc_a_to_fa = CurvedArrow(
            start_point=dot_a.get_center(),
            end_point=dot_fa.get_center(),
            radius=4,
            arc_center=[0, 0, 0],
            stroke_color=YELLOW
        )
        arc_fa_to_a = CurvedArrow(
            start_point=dot_fa.get_center(),
            end_point=dot_a.get_center(),
            radius=-4,
            arc_center=[0, 0, 0],
            stroke_color=YELLOW
        )
        arc_b_to_fb = CurvedArrow(
            start_point=dot_b.get_center(),
            end_point=dot_fb.get_center(),
            radius=4,
            arc_center=[0, 0.4, 0],
            stroke_color=YELLOW)
        arc_fb_to_b = CurvedArrow(
            start_point=dot_fb.get_center(),
            end_point=dot_b.get_center(),
            radius=-4,
            arc_center=[0, 0.4, 0],
            stroke_color=YELLOW)

        self.add(type_space_A, type_space_B)
        self.add(dot_a, dot_fa)
        self.add(dot_b, dot_fb)
        self.add(arc_a_fa, arc_b_fb)
        self.play(Create(arc_a_to_fa), Create(arc_b_fb), run_time=2)
        self.play(Create(arc_fa_to_a), Create(arc_fb_to_b), run_time=2)
        self.wait(1)


if __name__ == '__main__':
    config.frame_rate = 30
    config.format = "gif"
    config.pixel_width, config.pixel_height = 4000, 2400
    config.frame_width = 10
    config.frame_height = 6
    config.output_file = "./equiv-define.gif"
    scene = Isomorphism()
    scene.render()
