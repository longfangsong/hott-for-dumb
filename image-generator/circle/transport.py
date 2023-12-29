from manim import *


class Transport(ThreeDScene):
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

        R1 = VGroup(loop_circle_true, line_true_to_false, true_lifted)
        R2 = VGroup(loop_circle_false, line_false_to_true, false_lifted)
        self.add(R1, R2, true_label, false_label)
        lift_dot = true_lifted.copy()
        lift_dot.color = RED
        proj_dot = dot.copy()
        proj_dot.color = PINK
        self.play(MoveAlongPath(proj_dot, t1), MoveAlongPath(
            lift_dot, loop_circle_true), run_time=0.9*3)
        self.play(MoveAlongPath(proj_dot, t2), MoveAlongPath(
            lift_dot, line_true_to_false), run_time=0.2*3)
        self.wait()


if __name__ == '__main__':
    config.frame_rate = 30
    config.format = "gif"
    config.pixel_width, config.pixel_height = 2500, 2000
    config.frame_width = 5
    config.frame_height = 4
    config.output_file = "./transport.gif"
    scene = Transport()
    scene.render()
