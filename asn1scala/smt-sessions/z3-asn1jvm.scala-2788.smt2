; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67298 () Bool)

(assert start!67298)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18307 0))(
  ( (array!18308 (arr!9032 (Array (_ BitVec 32) (_ BitVec 8))) (size!7949 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18307)

(declare-fun a2!948 () array!18307)

(assert (=> start!67298 (and (bvsle (size!7949 a1!948) (size!7949 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258) (let ((bdg!18226 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7949 a1!948))))) (and (bvsle toBit!258 bdg!18226) (not (= ((_ sign_extend 32) (size!7949 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18226 ((_ sign_extend 32) (size!7949 a1!948))))))))))

(declare-fun array_inv!7561 (array!18307) Bool)

(assert (=> start!67298 (array_inv!7561 a1!948)))

(assert (=> start!67298 (array_inv!7561 a2!948)))

(assert (=> start!67298 true))

(declare-fun bs!26074 () Bool)

(assert (= bs!26074 start!67298))

(declare-fun m!441091 () Bool)

(assert (=> bs!26074 m!441091))

(declare-fun m!441093 () Bool)

(assert (=> bs!26074 m!441093))

(check-sat (not start!67298))
(check-sat)
