; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56084 () Bool)

(assert start!56084)

(declare-datatypes ((array!14251 0))(
  ( (array!14252 (arr!7224 (Array (_ BitVec 32) (_ BitVec 8))) (size!6237 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11396 0))(
  ( (BitStream!11397 (buf!6759 array!14251) (currentByte!12433 (_ BitVec 32)) (currentBit!12428 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11396)

(declare-fun buf!79 () array!14251)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56084 (and (= (size!6237 (buf!6759 b1!100)) (size!6237 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!6237 (buf!6759 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12433 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12428 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6237 (buf!6759 b1!100))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12433 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12428 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!180728 () Bool)

(declare-fun inv!12 (BitStream!11396) Bool)

(assert (=> start!56084 (and (inv!12 b1!100) e!180728)))

(declare-fun array_inv!5978 (array!14251) Bool)

(assert (=> start!56084 (array_inv!5978 buf!79)))

(assert (=> start!56084 true))

(declare-fun b!260332 () Bool)

(assert (=> b!260332 (= e!180728 (array_inv!5978 (buf!6759 b1!100)))))

(assert (= start!56084 b!260332))

(declare-fun m!389585 () Bool)

(assert (=> start!56084 m!389585))

(declare-fun m!389587 () Bool)

(assert (=> start!56084 m!389587))

(declare-fun m!389589 () Bool)

(assert (=> b!260332 m!389589))

(push 1)

(assert (not b!260332))

(assert (not start!56084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

