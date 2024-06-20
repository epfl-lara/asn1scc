; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56118 () Bool)

(assert start!56118)

(declare-fun res!218001 () Bool)

(declare-fun e!180801 () Bool)

(assert (=> start!56118 (=> (not res!218001) (not e!180801))))

(declare-datatypes ((array!14267 0))(
  ( (array!14268 (arr!7230 (Array (_ BitVec 32) (_ BitVec 8))) (size!6243 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14267)

(declare-datatypes ((BitStream!11408 0))(
  ( (BitStream!11409 (buf!6765 array!14267) (currentByte!12442 (_ BitVec 32)) (currentBit!12437 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11408)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56118 (= res!218001 (and (= (size!6243 (buf!6765 b1!100)) (size!6243 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56118 e!180801))

(declare-fun e!180800 () Bool)

(declare-fun inv!12 (BitStream!11408) Bool)

(assert (=> start!56118 (and (inv!12 b1!100) e!180800)))

(declare-fun array_inv!5984 (array!14267) Bool)

(assert (=> start!56118 (array_inv!5984 buf!79)))

(assert (=> start!56118 true))

(declare-fun b!260375 () Bool)

(declare-fun res!218002 () Bool)

(assert (=> b!260375 (=> (not res!218002) (not e!180801))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260375 (= res!218002 (validate_offset_bits!1 ((_ sign_extend 32) (size!6243 (buf!6765 b1!100))) ((_ sign_extend 32) (currentByte!12442 b1!100)) ((_ sign_extend 32) (currentBit!12437 b1!100)) bits!81))))

(declare-fun b!260376 () Bool)

(assert (=> b!260376 (= e!180801 (or (bvsgt ((_ sign_extend 32) (size!6243 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12442 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12437 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!260377 () Bool)

(assert (=> b!260377 (= e!180800 (array_inv!5984 (buf!6765 b1!100)))))

(assert (= (and start!56118 res!218001) b!260375))

(assert (= (and b!260375 res!218002) b!260376))

(assert (= start!56118 b!260377))

(declare-fun m!389637 () Bool)

(assert (=> start!56118 m!389637))

(declare-fun m!389639 () Bool)

(assert (=> start!56118 m!389639))

(declare-fun m!389641 () Bool)

(assert (=> b!260375 m!389641))

(declare-fun m!389643 () Bool)

(assert (=> b!260377 m!389643))

(push 1)

(assert (not b!260377))

(assert (not start!56118))

(assert (not b!260375))

(check-sat)

(pop 1)

