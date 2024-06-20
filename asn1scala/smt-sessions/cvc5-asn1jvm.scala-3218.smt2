; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73600 () Bool)

(assert start!73600)

(declare-fun i!1031 () (_ BitVec 64))

(declare-datatypes ((array!21092 0))(
  ( (array!21093 (arr!10246 (Array (_ BitVec 32) (_ BitVec 8))) (size!9154 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21092)

(assert (=> start!73600 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031) (let ((bdg!18918 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9154 a!445))))) (and (bvsle i!1031 bdg!18918) (not (= ((_ sign_extend 32) (size!9154 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18918 ((_ sign_extend 32) (size!9154 a!445))))))))))

(assert (=> start!73600 true))

(declare-fun array_inv!8706 (array!21092) Bool)

(assert (=> start!73600 (array_inv!8706 a!445)))

(declare-fun bs!28328 () Bool)

(assert (= bs!28328 start!73600))

(declare-fun m!463753 () Bool)

(assert (=> bs!28328 m!463753))

(push 1)

(assert (not start!73600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

