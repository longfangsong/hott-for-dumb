from manim import *


class Basic(ThreeDScene):
    def construct(self):
        self.set_camera_orientation(phi=60 * DEGREES, distance=5)
        circle = Circle(2)
        dot = Dot(circle.point_from_proportion(0), color=YELLOW).rotate(
            angle=60 * DEGREES, axis=RIGHT).set_z_index(1)
        label_dot = Text("base", font_size=24).next_to(
            dot, DOWN).rotate(angle=60 * DEGREES, axis=RIGHT).set_z_index(1)
        self.play(Create(dot), Create(label_dot))
        self.play(Create(circle))

        loop = Dot(circle.point_from_proportion(0.3), color=BLUE).rotate(
            angle=60 * DEGREES, axis=RIGHT)
        label_loop = Text("loop i", font_size=24).next_to(
            loop, DOWN).rotate(angle=60 * DEGREES, axis=RIGHT)
        self.play(Create(loop), Create(label_loop))
        self.wait()


if __name__ == '__main__':
    config.frame_rate = 30
    config.format = "gif"
    config.pixel_width, config.pixel_height = 3000, 2000
    config.frame_width = 6
    config.frame_height = 4
    config.output_file = "./basic.gif"
    scene = Basic()
    scene.render()
