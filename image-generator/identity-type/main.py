from manim import *


class Path(Scene):
    def construct(self):
        type_space = Polygon(
            [-2, -2, 0], [-2, 1, 0],
            [-1,  2, 0], [1, 1, 0],
            [2, 2, 0], [2, -1, 0],
            [1, -2, 0], [-1, -1, 0], color=BLUE, fill_opacity=1)
        dot_a = Dot(point=[-1, 0, 0], color=RED)
        dot_a_text = Tex("a", color=RED).next_to(dot_a, DOWN)
        dot_b = Dot(point=[1, 0, 0], color=GREEN_E)
        dot_b_text = Tex("b", color=GREEN_E).next_to(dot_b, DOWN)
        type_space.round_corners(0.3)
        arc1 = ArcBetweenPoints(
            start=[-0.9, -0.05, 0], end=[0.9, -0.05, 0], radius=4, stroke_color=BLACK)
        arc2 = ArcBetweenPoints(
            start=[-0.9, 0.05, 0], end=[0.9, 0.05, 0], radius=4, stroke_color=BLACK)
        self.add(type_space)
        self.add(dot_a, dot_a_text, dot_b, dot_b_text)
        self.play(Create(arc1), Create(arc2), run_time=2)


if __name__ == '__main__':
    config.frame_rate = 30
    config.format = "gif"
    config.pixel_width, config.pixel_height = 3200, 2400
    config.frame_width = 8
    config.frame_height = 6
    config.output_file = "./path.gif"
    scene = Path()
    scene.render()
