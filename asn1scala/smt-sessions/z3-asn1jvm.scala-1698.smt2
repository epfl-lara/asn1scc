; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47098 () Bool)

(assert start!47098)

(declare-fun res!189009 () Bool)

(declare-fun e!153668 () Bool)

(assert (=> start!47098 (=> (not res!189009) (not e!153668))))

(declare-datatypes ((array!11170 0))(
  ( (array!11171 (arr!5858 (Array (_ BitVec 32) (_ BitVec 8))) (size!4901 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11170)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47098 (= res!189009 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4901 arr!308))))))

(assert (=> start!47098 e!153668))

(assert (=> start!47098 true))

(declare-fun array_inv!4642 (array!11170) Bool)

(assert (=> start!47098 (array_inv!4642 arr!308)))

(declare-datatypes ((BitStream!8904 0))(
  ( (BitStream!8905 (buf!5445 array!11170) (currentByte!10211 (_ BitVec 32)) (currentBit!10206 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8904)

(declare-fun e!153667 () Bool)

(declare-fun inv!12 (BitStream!8904) Bool)

(assert (=> start!47098 (and (inv!12 thiss!1870) e!153667)))

(declare-fun b!225224 () Bool)

(declare-fun res!189008 () Bool)

(assert (=> b!225224 (=> (not res!189008) (not e!153668))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225224 (= res!189008 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4901 (buf!5445 thiss!1870))) ((_ sign_extend 32) (currentByte!10211 thiss!1870)) ((_ sign_extend 32) (currentBit!10206 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225225 () Bool)

(declare-fun res!189007 () Bool)

(assert (=> b!225225 (=> (not res!189007) (not e!153668))))

(assert (=> b!225225 (= res!189007 (bvsge i!761 to!496))))

(declare-fun b!225227 () Bool)

(assert (=> b!225227 (= e!153667 (array_inv!4642 (buf!5445 thiss!1870)))))

(declare-fun b!225226 () Bool)

(assert (=> b!225226 (= e!153668 (not true))))

(declare-fun arrayRangesEq!791 (array!11170 array!11170 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225226 (arrayRangesEq!791 arr!308 arr!308 #b00000000000000000000000000000000 (size!4901 arr!308))))

(declare-datatypes ((Unit!16547 0))(
  ( (Unit!16548) )
))
(declare-fun lt!358376 () Unit!16547)

(declare-fun arrayRangesEqReflexiveLemma!95 (array!11170) Unit!16547)

(assert (=> b!225226 (= lt!358376 (arrayRangesEqReflexiveLemma!95 arr!308))))

(declare-fun lt!358377 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225226 (= lt!358377 (bitIndex!0 (size!4901 (buf!5445 thiss!1870)) (currentByte!10211 thiss!1870) (currentBit!10206 thiss!1870)))))

(assert (= (and start!47098 res!189009) b!225224))

(assert (= (and b!225224 res!189008) b!225225))

(assert (= (and b!225225 res!189007) b!225226))

(assert (= start!47098 b!225227))

(declare-fun m!346151 () Bool)

(assert (=> start!47098 m!346151))

(declare-fun m!346153 () Bool)

(assert (=> start!47098 m!346153))

(declare-fun m!346155 () Bool)

(assert (=> b!225224 m!346155))

(declare-fun m!346157 () Bool)

(assert (=> b!225227 m!346157))

(declare-fun m!346159 () Bool)

(assert (=> b!225226 m!346159))

(declare-fun m!346161 () Bool)

(assert (=> b!225226 m!346161))

(declare-fun m!346163 () Bool)

(assert (=> b!225226 m!346163))

(check-sat (not b!225224) (not start!47098) (not b!225226) (not b!225227))
