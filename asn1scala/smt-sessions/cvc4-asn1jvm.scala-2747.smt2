; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66788 () Bool)

(assert start!66788)

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18042 0))(
  ( (array!18043 (arr!8910 (Array (_ BitVec 32) (_ BitVec 8))) (size!7827 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18042)

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> start!66788 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (let ((bdg!17868 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7827 a!434))))) (and (bvslt at!286 bdg!17868) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286) (bvsgt at!286 bdg!17868))))))

(assert (=> start!66788 true))

(declare-fun array_inv!7439 (array!18042) Bool)

(assert (=> start!66788 (array_inv!7439 a!434)))

(declare-fun bs!25844 () Bool)

(assert (= bs!25844 start!66788))

(declare-fun m!437663 () Bool)

(assert (=> bs!25844 m!437663))

(push 1)

(assert (not start!66788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

