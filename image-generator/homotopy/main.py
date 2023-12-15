from manim import *


class Homotopy(Scene):
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

        arc_fa = CurvedDoubleArrow(
            start_point=dot_a.get_center(),
            end_point=dot_fa.get_center(),
            radius=4,
            arc_center=[0, 0, 0],
            stroke_color=YELLOW
        )
        arc_fb = CurvedArrow(
            start_point=dot_b.get_center(),
            end_point=dot_fb.get_center(),
            radius=4,
            arc_center=[0, 0.4, 0],
            stroke_color=YELLOW)

        dot_ga = Dot(point=[2, -0.4, 0], color=BLUE)
        dot_ga_text = Tex("g(a)", color=GREEN,
                          font_size=28).next_to(dot_ga, UP)
        dot_gb = Dot(point=[1.5, 1, 0], color=BLUE)
        dot_gb_text = Tex("g(b)", color=GREEN,
                          font_size=28).next_to(dot_gb, UP)

        arc_ga = CurvedArrow(
            start_point=dot_a.get_center(),
            end_point=dot_ga.get_center(),
            arc_center=[0, -1, 0],
            radius=-4, stroke_color=GREEN)
        arc_gb = CurvedArrow(
            start_point=dot_b.get_center(),
            end_point=dot_gb.get_center(),
            arc_center=[0, -1.4, 0],
            radius=-4,
            stroke_color=GREEN)

        self.add(type_space_A, type_space_B)
        self.add(dot_a, dot_a_text)
        self.add(dot_b, dot_b_text)
        self.play(Create(arc_fa), Create(arc_fb), run_time=2)
        self.play(Create(dot_fa), Create(dot_fb), run_time=0.3)
        self.wait(0.1)
        self.play(Create(dot_fa_text), Create(dot_fb_text), run_time=0.1)
        self.wait(1)
        self.play(Create(arc_ga), Create(arc_gb), run_time=2)
        self.play(Create(dot_ga), Create(dot_gb), run_time=0.3)
        self.wait(0.1)
        self.play(Create(dot_ga_text), Create(dot_gb_text), run_time=0.1)
        self.wait(1)
        arc_ga.generate_target()
        arc_ga.target.become(arc_fa)
        arc_gb.generate_target()
        arc_gb.target.become(arc_fb)
        self.play(MoveToTarget(arc_ga),
                  MoveToTarget(arc_gb), run_time=2)
        self.wait(2)


if __name__ == '__main__':
    config.frame_rate = 30
    config.format = "gif"
    config.pixel_width, config.pixel_height = 4000, 2400
    config.frame_width = 10
    config.frame_height = 6
    config.output_file = "./homotopy.gif"
    scene = Homotopy()
    scene.render()
