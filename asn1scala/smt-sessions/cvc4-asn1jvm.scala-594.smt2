; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17048 () Bool)

(assert start!17048)

(declare-fun b!83361 () Bool)

(declare-fun e!55401 () Bool)

(declare-datatypes ((array!3825 0))(
  ( (array!3826 (arr!2378 (Array (_ BitVec 32) (_ BitVec 8))) (size!1741 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3044 0))(
  ( (BitStream!3045 (buf!2131 array!3825) (currentByte!4225 (_ BitVec 32)) (currentBit!4220 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3044)

(declare-fun array_inv!1587 (array!3825) Bool)

(assert (=> b!83361 (= e!55401 (array_inv!1587 (buf!2131 b2!98)))))

(declare-fun b!83362 () Bool)

(declare-fun e!55399 () Bool)

(declare-fun b1!98 () BitStream!3044)

(assert (=> b!83362 (= e!55399 (array_inv!1587 (buf!2131 b1!98)))))

(declare-fun res!68578 () Bool)

(declare-fun e!55403 () Bool)

(assert (=> start!17048 (=> (not res!68578) (not e!55403))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!17048 (= res!68578 (and (= (size!1741 (buf!2131 b1!98)) (size!1741 (buf!2131 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17048 e!55403))

(declare-fun inv!12 (BitStream!3044) Bool)

(assert (=> start!17048 (and (inv!12 b1!98) e!55399)))

(assert (=> start!17048 (and (inv!12 b2!98) e!55401)))

(assert (=> start!17048 true))

(declare-fun b!83363 () Bool)

(declare-fun res!68576 () Bool)

(assert (=> b!83363 (=> (not res!68576) (not e!55403))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83363 (= res!68576 (validate_offset_bits!1 ((_ sign_extend 32) (size!1741 (buf!2131 b1!98))) ((_ sign_extend 32) (currentByte!4225 b1!98)) ((_ sign_extend 32) (currentBit!4220 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83364 () Bool)

(declare-fun e!55404 () Bool)

(assert (=> b!83364 (= e!55403 e!55404)))

(declare-fun res!68577 () Bool)

(assert (=> b!83364 (=> (not res!68577) (not e!55404))))

(declare-fun lt!132881 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83364 (= res!68577 (= (bvadd lt!132881 b1b2Diff!1) (bitIndex!0 (size!1741 (buf!2131 b2!98)) (currentByte!4225 b2!98) (currentBit!4220 b2!98))))))

(assert (=> b!83364 (= lt!132881 (bitIndex!0 (size!1741 (buf!2131 b1!98)) (currentByte!4225 b1!98) (currentBit!4220 b1!98)))))

(declare-fun b!83365 () Bool)

(declare-fun lt!132880 () (_ BitVec 64))

(assert (=> b!83365 (= e!55404 (not (or (= ((_ sign_extend 32) (size!1741 (buf!2131 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!132880 ((_ sign_extend 32) (size!1741 (buf!2131 b1!98))))))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83365 (= (remainingBits!0 ((_ sign_extend 32) (size!1741 (buf!2131 b1!98))) ((_ sign_extend 32) (currentByte!4225 b1!98)) ((_ sign_extend 32) (currentBit!4220 b1!98))) (bvsub lt!132880 lt!132881))))

(assert (=> b!83365 (= lt!132880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1741 (buf!2131 b1!98)))))))

(declare-datatypes ((Unit!5585 0))(
  ( (Unit!5586) )
))
(declare-fun lt!132882 () Unit!5585)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3044) Unit!5585)

(assert (=> b!83365 (= lt!132882 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!17048 res!68578) b!83363))

(assert (= (and b!83363 res!68576) b!83364))

(assert (= (and b!83364 res!68577) b!83365))

(assert (= start!17048 b!83362))

(assert (= start!17048 b!83361))

(declare-fun m!129933 () Bool)

(assert (=> b!83363 m!129933))

(declare-fun m!129935 () Bool)

(assert (=> b!83361 m!129935))

(declare-fun m!129937 () Bool)

(assert (=> b!83365 m!129937))

(declare-fun m!129939 () Bool)

(assert (=> b!83365 m!129939))

(declare-fun m!129941 () Bool)

(assert (=> start!17048 m!129941))

(declare-fun m!129943 () Bool)

(assert (=> start!17048 m!129943))

(declare-fun m!129945 () Bool)

(assert (=> b!83362 m!129945))

(declare-fun m!129947 () Bool)

(assert (=> b!83364 m!129947))

(declare-fun m!129949 () Bool)

(assert (=> b!83364 m!129949))

(push 1)

(assert (not b!83364))

(assert (not b!83365))

(assert (not start!17048))

(assert (not b!83361))

(assert (not b!83363))

(assert (not b!83362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

