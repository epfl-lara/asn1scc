; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16912 () Bool)

(assert start!16912)

(declare-fun b!82973 () Bool)

(declare-fun res!68314 () Bool)

(declare-fun e!54991 () Bool)

(assert (=> b!82973 (=> (not res!68314) (not e!54991))))

(declare-datatypes ((array!3776 0))(
  ( (array!3777 (arr!2358 (Array (_ BitVec 32) (_ BitVec 8))) (size!1721 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3004 0))(
  ( (BitStream!3005 (buf!2111 array!3776) (currentByte!4181 (_ BitVec 32)) (currentBit!4176 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3004)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82973 (= res!68314 (validate_offset_bits!1 ((_ sign_extend 32) (size!1721 (buf!2111 b1!98))) ((_ sign_extend 32) (currentByte!4181 b1!98)) ((_ sign_extend 32) (currentBit!4176 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82974 () Bool)

(declare-fun e!54995 () Bool)

(declare-fun e!54990 () Bool)

(assert (=> b!82974 (= e!54995 (not e!54990))))

(declare-fun res!68316 () Bool)

(assert (=> b!82974 (=> res!68316 e!54990)))

(declare-fun lt!132311 () (_ BitVec 64))

(declare-fun lt!132315 () (_ BitVec 64))

(assert (=> b!82974 (= res!68316 (bvsgt lt!132311 (bvsub lt!132315 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82974 (= (remainingBits!0 ((_ sign_extend 32) (size!1721 (buf!2111 b1!98))) ((_ sign_extend 32) (currentByte!4181 b1!98)) ((_ sign_extend 32) (currentBit!4176 b1!98))) (bvsub lt!132315 lt!132311))))

(assert (=> b!82974 (= lt!132315 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1721 (buf!2111 b1!98)))))))

(declare-datatypes ((Unit!5551 0))(
  ( (Unit!5552) )
))
(declare-fun lt!132314 () Unit!5551)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3004) Unit!5551)

(assert (=> b!82974 (= lt!132314 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82975 () Bool)

(assert (=> b!82975 (= e!54990 true)))

(declare-fun b2!98 () BitStream!3004)

(declare-fun lt!132313 () (_ BitVec 64))

(assert (=> b!82975 (= (remainingBits!0 ((_ sign_extend 32) (size!1721 (buf!2111 b2!98))) ((_ sign_extend 32) (currentByte!4181 b2!98)) ((_ sign_extend 32) (currentBit!4176 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1721 (buf!2111 b2!98)))) lt!132313))))

(declare-fun lt!132312 () Unit!5551)

(assert (=> b!82975 (= lt!132312 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68317 () Bool)

(assert (=> start!16912 (=> (not res!68317) (not e!54991))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16912 (= res!68317 (and (= (size!1721 (buf!2111 b1!98)) (size!1721 (buf!2111 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16912 e!54991))

(declare-fun e!54993 () Bool)

(declare-fun inv!12 (BitStream!3004) Bool)

(assert (=> start!16912 (and (inv!12 b1!98) e!54993)))

(declare-fun e!54996 () Bool)

(assert (=> start!16912 (and (inv!12 b2!98) e!54996)))

(assert (=> start!16912 true))

(declare-fun b!82976 () Bool)

(declare-fun array_inv!1567 (array!3776) Bool)

(assert (=> b!82976 (= e!54993 (array_inv!1567 (buf!2111 b1!98)))))

(declare-fun b!82977 () Bool)

(assert (=> b!82977 (= e!54996 (array_inv!1567 (buf!2111 b2!98)))))

(declare-fun b!82978 () Bool)

(assert (=> b!82978 (= e!54991 e!54995)))

(declare-fun res!68315 () Bool)

(assert (=> b!82978 (=> (not res!68315) (not e!54995))))

(assert (=> b!82978 (= res!68315 (= (bvadd lt!132311 b1b2Diff!1) lt!132313))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82978 (= lt!132313 (bitIndex!0 (size!1721 (buf!2111 b2!98)) (currentByte!4181 b2!98) (currentBit!4176 b2!98)))))

(assert (=> b!82978 (= lt!132311 (bitIndex!0 (size!1721 (buf!2111 b1!98)) (currentByte!4181 b1!98) (currentBit!4176 b1!98)))))

(assert (= (and start!16912 res!68317) b!82973))

(assert (= (and b!82973 res!68314) b!82978))

(assert (= (and b!82978 res!68315) b!82974))

(assert (= (and b!82974 (not res!68316)) b!82975))

(assert (= start!16912 b!82976))

(assert (= start!16912 b!82977))

(declare-fun m!129489 () Bool)

(assert (=> b!82978 m!129489))

(declare-fun m!129491 () Bool)

(assert (=> b!82978 m!129491))

(declare-fun m!129493 () Bool)

(assert (=> b!82975 m!129493))

(declare-fun m!129495 () Bool)

(assert (=> b!82975 m!129495))

(declare-fun m!129497 () Bool)

(assert (=> b!82974 m!129497))

(declare-fun m!129499 () Bool)

(assert (=> b!82974 m!129499))

(declare-fun m!129501 () Bool)

(assert (=> b!82976 m!129501))

(declare-fun m!129503 () Bool)

(assert (=> b!82973 m!129503))

(declare-fun m!129505 () Bool)

(assert (=> start!16912 m!129505))

(declare-fun m!129507 () Bool)

(assert (=> start!16912 m!129507))

(declare-fun m!129509 () Bool)

(assert (=> b!82977 m!129509))

(push 1)

(assert (not b!82974))

(assert (not b!82973))

(assert (not b!82978))

(assert (not b!82977))

(assert (not b!82975))

(assert (not b!82976))

(assert (not start!16912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

