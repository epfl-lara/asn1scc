; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16714 () Bool)

(assert start!16714)

(declare-fun b!82539 () Bool)

(declare-fun e!54572 () Bool)

(declare-datatypes ((array!3730 0))(
  ( (array!3731 (arr!2341 (Array (_ BitVec 32) (_ BitVec 8))) (size!1704 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2970 0))(
  ( (BitStream!2971 (buf!2094 array!3730) (currentByte!4120 (_ BitVec 32)) (currentBit!4115 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2970)

(declare-fun array_inv!1550 (array!3730) Bool)

(assert (=> b!82539 (= e!54572 (array_inv!1550 (buf!2094 b2!98)))))

(declare-fun b!82540 () Bool)

(declare-fun e!54569 () Bool)

(declare-fun e!54568 () Bool)

(assert (=> b!82540 (= e!54569 e!54568)))

(declare-fun res!67999 () Bool)

(assert (=> b!82540 (=> (not res!67999) (not e!54568))))

(declare-fun lt!131384 () (_ BitVec 64))

(declare-fun lt!131387 () (_ BitVec 64))

(assert (=> b!82540 (= res!67999 (= lt!131384 lt!131387))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82540 (= lt!131387 (bitIndex!0 (size!1704 (buf!2094 b2!98)) (currentByte!4120 b2!98) (currentBit!4115 b2!98)))))

(declare-fun lt!131383 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82540 (= lt!131384 (bvadd lt!131383 b1b2Diff!1))))

(declare-fun b1!98 () BitStream!2970)

(assert (=> b!82540 (= lt!131383 (bitIndex!0 (size!1704 (buf!2094 b1!98)) (currentByte!4120 b1!98) (currentBit!4115 b1!98)))))

(declare-fun lt!131386 () (_ BitVec 64))

(declare-fun e!54570 () Bool)

(declare-fun b!82541 () Bool)

(declare-fun lt!131388 () (_ BitVec 64))

(assert (=> b!82541 (= e!54570 (or (not (= lt!131388 (bvsub lt!131386 lt!131384))) (and (bvsle ((_ sign_extend 32) (size!1704 (buf!2094 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4120 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4115 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(assert (=> b!82541 (= lt!131388 (bvsub lt!131386 lt!131387))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82541 (= lt!131388 (remainingBits!0 ((_ sign_extend 32) (size!1704 (buf!2094 b2!98))) ((_ sign_extend 32) (currentByte!4120 b2!98)) ((_ sign_extend 32) (currentBit!4115 b2!98))))))

(assert (=> b!82541 (= lt!131386 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1704 (buf!2094 b2!98)))))))

(declare-datatypes ((Unit!5517 0))(
  ( (Unit!5518) )
))
(declare-fun lt!131381 () Unit!5517)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2970) Unit!5517)

(assert (=> b!82541 (= lt!131381 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82543 () Bool)

(declare-fun e!54567 () Bool)

(assert (=> b!82543 (= e!54567 (array_inv!1550 (buf!2094 b1!98)))))

(declare-fun b!82544 () Bool)

(declare-fun res!67998 () Bool)

(assert (=> b!82544 (=> (not res!67998) (not e!54569))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82544 (= res!67998 (validate_offset_bits!1 ((_ sign_extend 32) (size!1704 (buf!2094 b1!98))) ((_ sign_extend 32) (currentByte!4120 b1!98)) ((_ sign_extend 32) (currentBit!4115 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82542 () Bool)

(assert (=> b!82542 (= e!54568 (not e!54570))))

(declare-fun res!67996 () Bool)

(assert (=> b!82542 (=> res!67996 e!54570)))

(declare-fun lt!131385 () (_ BitVec 64))

(assert (=> b!82542 (= res!67996 (bvsgt lt!131383 (bvsub lt!131385 b1ValidateOffsetBits!11)))))

(assert (=> b!82542 (= (remainingBits!0 ((_ sign_extend 32) (size!1704 (buf!2094 b1!98))) ((_ sign_extend 32) (currentByte!4120 b1!98)) ((_ sign_extend 32) (currentBit!4115 b1!98))) (bvsub lt!131385 lt!131383))))

(assert (=> b!82542 (= lt!131385 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1704 (buf!2094 b1!98)))))))

(declare-fun lt!131382 () Unit!5517)

(assert (=> b!82542 (= lt!131382 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!67997 () Bool)

(assert (=> start!16714 (=> (not res!67997) (not e!54569))))

(assert (=> start!16714 (= res!67997 (and (= (size!1704 (buf!2094 b1!98)) (size!1704 (buf!2094 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16714 e!54569))

(declare-fun inv!12 (BitStream!2970) Bool)

(assert (=> start!16714 (and (inv!12 b1!98) e!54567)))

(assert (=> start!16714 (and (inv!12 b2!98) e!54572)))

(assert (=> start!16714 true))

(assert (= (and start!16714 res!67997) b!82544))

(assert (= (and b!82544 res!67998) b!82540))

(assert (= (and b!82540 res!67999) b!82542))

(assert (= (and b!82542 (not res!67996)) b!82541))

(assert (= start!16714 b!82543))

(assert (= start!16714 b!82539))

(declare-fun m!129007 () Bool)

(assert (=> b!82543 m!129007))

(declare-fun m!129009 () Bool)

(assert (=> start!16714 m!129009))

(declare-fun m!129011 () Bool)

(assert (=> start!16714 m!129011))

(declare-fun m!129013 () Bool)

(assert (=> b!82539 m!129013))

(declare-fun m!129015 () Bool)

(assert (=> b!82544 m!129015))

(declare-fun m!129017 () Bool)

(assert (=> b!82541 m!129017))

(declare-fun m!129019 () Bool)

(assert (=> b!82541 m!129019))

(declare-fun m!129021 () Bool)

(assert (=> b!82542 m!129021))

(declare-fun m!129023 () Bool)

(assert (=> b!82542 m!129023))

(declare-fun m!129025 () Bool)

(assert (=> b!82540 m!129025))

(declare-fun m!129027 () Bool)

(assert (=> b!82540 m!129027))

(check-sat (not b!82542) (not b!82540) (not b!82539) (not start!16714) (not b!82543) (not b!82544) (not b!82541))
(check-sat)
