; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49680 () Bool)

(assert start!49680)

(declare-fun res!196002 () Bool)

(declare-fun e!162011 () Bool)

(assert (=> start!49680 (=> (not res!196002) (not e!162011))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!49680 (= res!196002 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49680 e!162011))

(assert (=> start!49680 true))

(declare-datatypes ((array!12276 0))(
  ( (array!12277 (arr!6381 (Array (_ BitVec 32) (_ BitVec 8))) (size!5394 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9752 0))(
  ( (BitStream!9753 (buf!5869 array!12276) (currentByte!10924 (_ BitVec 32)) (currentBit!10919 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9752)

(declare-fun e!162010 () Bool)

(declare-fun inv!12 (BitStream!9752) Bool)

(assert (=> start!49680 (and (inv!12 bs!63) e!162010)))

(declare-fun b!234351 () Bool)

(declare-fun res!196001 () Bool)

(assert (=> b!234351 (=> (not res!196001) (not e!162011))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234351 (= res!196001 (validate_offset_bits!1 ((_ sign_extend 32) (size!5394 (buf!5869 bs!63))) ((_ sign_extend 32) (currentByte!10924 bs!63)) ((_ sign_extend 32) (currentBit!10919 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234352 () Bool)

(assert (=> b!234352 (= e!162011 (or (bvsgt #b00000000000000000000000000000000 (bvsub nBits!274 i!546)) (bvsgt (bvsub nBits!274 i!546) #b00000000000000000000000001000000)))))

(declare-fun b!234353 () Bool)

(declare-fun array_inv!5135 (array!12276) Bool)

(assert (=> b!234353 (= e!162010 (array_inv!5135 (buf!5869 bs!63)))))

(assert (= (and start!49680 res!196002) b!234351))

(assert (= (and b!234351 res!196001) b!234352))

(assert (= start!49680 b!234353))

(declare-fun m!356983 () Bool)

(assert (=> start!49680 m!356983))

(declare-fun m!356985 () Bool)

(assert (=> b!234351 m!356985))

(declare-fun m!356987 () Bool)

(assert (=> b!234353 m!356987))

(push 1)

(assert (not b!234351))

(assert (not start!49680))

(assert (not b!234353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

