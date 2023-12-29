from manim import *


class ToBool(ThreeDScene):
    def construct(self):
        self.move_camera(frame_center=[0, 0.5, 0])
        self.set_camera_orientation(phi=60 * DEGREES, distance=5)
        t1 = Arc(radius=2, start_angle=0,
                 angle=9*TAU/10, color=WHITE)
        t2 = Arc(radius=2, start_angle=9*TAU/10, angle=TAU/10, color=WHITE)
        base_position = t1.point_from_proportion(0)
        dot = Dot(base_position, color=YELLOW).rotate(
            angle=60 * DEGREES, axis=RIGHT).set_z_index(1)
        R0 = VGroup(t1, t2, dot)
        label_dot = Text("base", font_size=24).next_to(
            dot, DOWN).rotate(angle=60 * DEGREES, axis=RIGHT).set_z_index(1)
        loop = Dot(t1.point_from_proportion(0.3), color=BLUE).rotate(
            angle=60 * DEGREES, axis=RIGHT).set_z_index(1)
        label_loop = Text("loop i", font_size=24).next_to(
            loop, DOWN).rotate(angle=60 * DEGREES, axis=RIGHT).set_z_index(1)
        self.add(R0, label_dot, loop, label_loop)
        true_position = base_position.copy()
        true_position[1] += 2
        true_lifted = Dot(true_position, color=GREEN).rotate(
            angle=60 * DEGREES, axis=RIGHT).set_z_index(2)
        true_label = Text("true", font_size=24).next_to(
            true_lifted, DOWN).rotate(angle=60 * DEGREES, axis=RIGHT).set_z_index(2)
        false_position = base_position.copy()
        false_position[1] += 3
        false_lifted = Dot(false_position, color=GREEN).rotate(
            angle=60 * DEGREES, axis=RIGHT).set_z_index(2)
        false_label = Text("false", font_size=24).next_to(
            false_lifted, DOWN).rotate(angle=60 * DEGREES, axis=RIGHT).set_z_index(2)
        self.play(Create(true_lifted), Create(false_lifted),
                  Create(true_label), Create(false_label))
        loop_circle_true = Arc(radius=2, start_angle=0,
                               angle=9*TAU/10, color=PURPLE)
        loop_circle_true.move_to([0, 2, 0])
        loop_circle_false = Arc(radius=2, start_angle=0,
                                angle=9*TAU/10, color=PURPLE)
        loop_circle_false.move_to([0, 3, 0])
        line_true_to_false = Line(loop_circle_true.point_from_proportion(1),
                                  false_position, color=PURPLE)
        line_false_to_true = Line(loop_circle_false.point_from_proportion(1),
                                  true_position, color=PURPLE)

        self.play(Create(loop_circle_true))
        self.play(Create(line_true_to_false))

        R1 = VGroup(loop_circle_true, line_true_to_false, true_lifted)
        origin_R1 = R1.copy()
        R1.generate_target()
        R1.target.become(R0)
        self.play(MoveToTarget(R1))
        R1.target.become(origin_R1)
        self.play(MoveToTarget(R1))

        self.play(Create(loop_circle_false))
        self.play(Create(line_false_to_true))

        R2 = VGroup(loop_circle_false, line_false_to_true, false_lifted)
        origin_R2 = R2.copy()
        R2.generate_target()
        R2.target.become(R0)
        self.play(MoveToTarget(R2))
        R2.target.become(origin_R2)
        self.play(MoveToTarget(R2))

        self.wait()


if __name__ == '__main__':
    config.frame_rate = 30
    config.format = "gif"
    config.pixel_width, config.pixel_height = 2500, 2000
    config.frame_width = 5
    config.frame_height = 4
    config.output_file = "./toBool.gif"
    scene = ToBool()
    scene.render()
