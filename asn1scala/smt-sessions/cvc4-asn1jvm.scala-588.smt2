; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16916 () Bool)

(assert start!16916)

(declare-fun b!83009 () Bool)

(declare-fun e!55036 () Bool)

(assert (=> b!83009 (= e!55036 true)))

(declare-datatypes ((array!3780 0))(
  ( (array!3781 (arr!2360 (Array (_ BitVec 32) (_ BitVec 8))) (size!1723 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3008 0))(
  ( (BitStream!3009 (buf!2113 array!3780) (currentByte!4183 (_ BitVec 32)) (currentBit!4178 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3008)

(declare-fun lt!132345 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83009 (= (remainingBits!0 ((_ sign_extend 32) (size!1723 (buf!2113 b2!98))) ((_ sign_extend 32) (currentByte!4183 b2!98)) ((_ sign_extend 32) (currentBit!4178 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1723 (buf!2113 b2!98)))) lt!132345))))

(declare-datatypes ((Unit!5555 0))(
  ( (Unit!5556) )
))
(declare-fun lt!132343 () Unit!5555)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3008) Unit!5555)

(assert (=> b!83009 (= lt!132343 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83010 () Bool)

(declare-fun e!55038 () Bool)

(declare-fun e!55033 () Bool)

(assert (=> b!83010 (= e!55038 e!55033)))

(declare-fun res!68339 () Bool)

(assert (=> b!83010 (=> (not res!68339) (not e!55033))))

(declare-fun lt!132344 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!83010 (= res!68339 (= (bvadd lt!132344 b1b2Diff!1) lt!132345))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83010 (= lt!132345 (bitIndex!0 (size!1723 (buf!2113 b2!98)) (currentByte!4183 b2!98) (currentBit!4178 b2!98)))))

(declare-fun b1!98 () BitStream!3008)

(assert (=> b!83010 (= lt!132344 (bitIndex!0 (size!1723 (buf!2113 b1!98)) (currentByte!4183 b1!98) (currentBit!4178 b1!98)))))

(declare-fun b!83011 () Bool)

(declare-fun e!55032 () Bool)

(declare-fun array_inv!1569 (array!3780) Bool)

(assert (=> b!83011 (= e!55032 (array_inv!1569 (buf!2113 b2!98)))))

(declare-fun b!83012 () Bool)

(assert (=> b!83012 (= e!55033 (not e!55036))))

(declare-fun res!68340 () Bool)

(assert (=> b!83012 (=> res!68340 e!55036)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!132342 () (_ BitVec 64))

(assert (=> b!83012 (= res!68340 (bvsgt lt!132344 (bvsub lt!132342 b1ValidateOffsetBits!11)))))

(assert (=> b!83012 (= (remainingBits!0 ((_ sign_extend 32) (size!1723 (buf!2113 b1!98))) ((_ sign_extend 32) (currentByte!4183 b1!98)) ((_ sign_extend 32) (currentBit!4178 b1!98))) (bvsub lt!132342 lt!132344))))

(assert (=> b!83012 (= lt!132342 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1723 (buf!2113 b1!98)))))))

(declare-fun lt!132341 () Unit!5555)

(assert (=> b!83012 (= lt!132341 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83013 () Bool)

(declare-fun e!55034 () Bool)

(assert (=> b!83013 (= e!55034 (array_inv!1569 (buf!2113 b1!98)))))

(declare-fun res!68338 () Bool)

(assert (=> start!16916 (=> (not res!68338) (not e!55038))))

(assert (=> start!16916 (= res!68338 (and (= (size!1723 (buf!2113 b1!98)) (size!1723 (buf!2113 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16916 e!55038))

(declare-fun inv!12 (BitStream!3008) Bool)

(assert (=> start!16916 (and (inv!12 b1!98) e!55034)))

(assert (=> start!16916 (and (inv!12 b2!98) e!55032)))

(assert (=> start!16916 true))

(declare-fun b!83014 () Bool)

(declare-fun res!68341 () Bool)

(assert (=> b!83014 (=> (not res!68341) (not e!55038))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83014 (= res!68341 (validate_offset_bits!1 ((_ sign_extend 32) (size!1723 (buf!2113 b1!98))) ((_ sign_extend 32) (currentByte!4183 b1!98)) ((_ sign_extend 32) (currentBit!4178 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16916 res!68338) b!83014))

(assert (= (and b!83014 res!68341) b!83010))

(assert (= (and b!83010 res!68339) b!83012))

(assert (= (and b!83012 (not res!68340)) b!83009))

(assert (= start!16916 b!83013))

(assert (= start!16916 b!83011))

(declare-fun m!129533 () Bool)

(assert (=> start!16916 m!129533))

(declare-fun m!129535 () Bool)

(assert (=> start!16916 m!129535))

(declare-fun m!129537 () Bool)

(assert (=> b!83013 m!129537))

(declare-fun m!129539 () Bool)

(assert (=> b!83010 m!129539))

(declare-fun m!129541 () Bool)

(assert (=> b!83010 m!129541))

(declare-fun m!129543 () Bool)

(assert (=> b!83014 m!129543))

(declare-fun m!129545 () Bool)

(assert (=> b!83009 m!129545))

(declare-fun m!129547 () Bool)

(assert (=> b!83009 m!129547))

(declare-fun m!129549 () Bool)

(assert (=> b!83012 m!129549))

(declare-fun m!129551 () Bool)

(assert (=> b!83012 m!129551))

(declare-fun m!129553 () Bool)

(assert (=> b!83011 m!129553))

(push 1)

(assert (not b!83009))

(assert (not b!83012))

(assert (not b!83014))

(assert (not b!83013))

(assert (not b!83010))

(assert (not b!83011))

(assert (not start!16916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

