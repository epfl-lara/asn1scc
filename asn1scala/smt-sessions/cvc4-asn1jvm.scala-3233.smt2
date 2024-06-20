; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73760 () Bool)

(assert start!73760)

(declare-datatypes ((array!21197 0))(
  ( (array!21198 (arr!10293 (Array (_ BitVec 32) (_ BitVec 8))) (size!9201 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21197)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21197)

(assert (=> start!73760 (and (bvsle (size!9201 a1!688) (size!9201 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (not (= ((_ sign_extend 32) (size!9201 a1!688)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9201 a1!688))) ((_ sign_extend 32) (size!9201 a1!688))))))))

(declare-fun array_inv!8753 (array!21197) Bool)

(assert (=> start!73760 (array_inv!8753 a1!688)))

(assert (=> start!73760 (array_inv!8753 a2!688)))

(assert (=> start!73760 true))

(declare-fun bs!28393 () Bool)

(assert (= bs!28393 start!73760))

(declare-fun m!464221 () Bool)

(assert (=> bs!28393 m!464221))

(declare-fun m!464223 () Bool)

(assert (=> bs!28393 m!464223))

(push 1)

(assert (not start!73760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

