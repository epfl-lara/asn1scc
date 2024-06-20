; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17748 () Bool)

(assert start!17748)

(declare-fun b!85742 () Bool)

(declare-fun res!70390 () Bool)

(declare-fun e!57084 () Bool)

(assert (=> b!85742 (=> (not res!70390) (not e!57084))))

(declare-datatypes ((array!4073 0))(
  ( (array!4074 (arr!2476 (Array (_ BitVec 32) (_ BitVec 8))) (size!1839 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3240 0))(
  ( (BitStream!3241 (buf!2229 array!4073) (currentByte!4435 (_ BitVec 32)) (currentBit!4430 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3240)

(declare-fun thiss!1151 () BitStream!3240)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85742 (= res!70390 (and (bvsle i!576 nBits!336) (= (size!1839 (buf!2229 thiss!1152)) (size!1839 (buf!2229 thiss!1151)))))))

(declare-fun b!85743 () Bool)

(declare-fun e!57086 () Bool)

(declare-fun e!57089 () Bool)

(assert (=> b!85743 (= e!57086 e!57089)))

(declare-fun res!70391 () Bool)

(assert (=> b!85743 (=> (not res!70391) (not e!57089))))

(declare-fun lt!134876 () (_ BitVec 64))

(declare-fun lt!134877 () (_ BitVec 64))

(assert (=> b!85743 (= res!70391 (= lt!134876 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134877)))))

(declare-datatypes ((Unit!5694 0))(
  ( (Unit!5695) )
))
(declare-datatypes ((tuple2!7286 0))(
  ( (tuple2!7287 (_1!3858 Unit!5694) (_2!3858 BitStream!3240)) )
))
(declare-fun lt!134880 () tuple2!7286)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85743 (= lt!134876 (bitIndex!0 (size!1839 (buf!2229 (_2!3858 lt!134880))) (currentByte!4435 (_2!3858 lt!134880)) (currentBit!4430 (_2!3858 lt!134880))))))

(declare-fun b!85744 () Bool)

(declare-fun e!57082 () Bool)

(assert (=> b!85744 (= e!57089 e!57082)))

(declare-fun res!70387 () Bool)

(assert (=> b!85744 (=> (not res!70387) (not e!57082))))

(declare-fun lt!134879 () Bool)

(declare-datatypes ((tuple2!7288 0))(
  ( (tuple2!7289 (_1!3859 BitStream!3240) (_2!3859 Bool)) )
))
(declare-fun lt!134875 () tuple2!7288)

(assert (=> b!85744 (= res!70387 (and (= (_2!3859 lt!134875) lt!134879) (= (_1!3859 lt!134875) (_2!3858 lt!134880))))))

(declare-fun readBitPure!0 (BitStream!3240) tuple2!7288)

(declare-fun readerFrom!0 (BitStream!3240 (_ BitVec 32) (_ BitVec 32)) BitStream!3240)

(assert (=> b!85744 (= lt!134875 (readBitPure!0 (readerFrom!0 (_2!3858 lt!134880) (currentBit!4430 thiss!1152) (currentByte!4435 thiss!1152))))))

(declare-fun b!85745 () Bool)

(declare-fun res!70385 () Bool)

(assert (=> b!85745 (=> (not res!70385) (not e!57084))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85745 (= res!70385 (invariant!0 (currentBit!4430 thiss!1151) (currentByte!4435 thiss!1151) (size!1839 (buf!2229 thiss!1151))))))

(declare-fun b!85746 () Bool)

(declare-fun res!70388 () Bool)

(assert (=> b!85746 (=> (not res!70388) (not e!57089))))

(declare-fun isPrefixOf!0 (BitStream!3240 BitStream!3240) Bool)

(assert (=> b!85746 (= res!70388 (isPrefixOf!0 thiss!1152 (_2!3858 lt!134880)))))

(declare-fun b!85747 () Bool)

(declare-fun e!57088 () Bool)

(declare-fun array_inv!1685 (array!4073) Bool)

(assert (=> b!85747 (= e!57088 (array_inv!1685 (buf!2229 thiss!1151)))))

(declare-fun res!70384 () Bool)

(assert (=> start!17748 (=> (not res!70384) (not e!57084))))

(assert (=> start!17748 (= res!70384 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17748 e!57084))

(declare-fun e!57083 () Bool)

(declare-fun inv!12 (BitStream!3240) Bool)

(assert (=> start!17748 (and (inv!12 thiss!1152) e!57083)))

(assert (=> start!17748 (and (inv!12 thiss!1151) e!57088)))

(assert (=> start!17748 true))

(declare-fun b!85748 () Bool)

(declare-fun res!70386 () Bool)

(declare-fun e!57090 () Bool)

(assert (=> b!85748 (=> (not res!70386) (not e!57090))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85748 (= res!70386 (validate_offset_bits!1 ((_ sign_extend 32) (size!1839 (buf!2229 thiss!1152))) ((_ sign_extend 32) (currentByte!4435 thiss!1152)) ((_ sign_extend 32) (currentBit!4430 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85749 () Bool)

(declare-fun res!70393 () Bool)

(assert (=> b!85749 (=> (not res!70393) (not e!57084))))

(assert (=> b!85749 (= res!70393 (validate_offset_bits!1 ((_ sign_extend 32) (size!1839 (buf!2229 thiss!1151))) ((_ sign_extend 32) (currentByte!4435 thiss!1151)) ((_ sign_extend 32) (currentBit!4430 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85750 () Bool)

(declare-fun res!70392 () Bool)

(assert (=> b!85750 (=> (not res!70392) (not e!57084))))

(assert (=> b!85750 (= res!70392 (invariant!0 (currentBit!4430 thiss!1152) (currentByte!4435 thiss!1152) (size!1839 (buf!2229 thiss!1152))))))

(declare-fun b!85751 () Bool)

(assert (=> b!85751 (= e!57084 e!57090)))

(declare-fun res!70382 () Bool)

(assert (=> b!85751 (=> (not res!70382) (not e!57090))))

(declare-fun lt!134878 () (_ BitVec 64))

(assert (=> b!85751 (= res!70382 (= lt!134877 (bvadd lt!134878 ((_ sign_extend 32) i!576))))))

(assert (=> b!85751 (= lt!134877 (bitIndex!0 (size!1839 (buf!2229 thiss!1152)) (currentByte!4435 thiss!1152) (currentBit!4430 thiss!1152)))))

(assert (=> b!85751 (= lt!134878 (bitIndex!0 (size!1839 (buf!2229 thiss!1151)) (currentByte!4435 thiss!1151) (currentBit!4430 thiss!1151)))))

(declare-fun b!85752 () Bool)

(assert (=> b!85752 (= e!57082 (= (bitIndex!0 (size!1839 (buf!2229 (_1!3859 lt!134875))) (currentByte!4435 (_1!3859 lt!134875)) (currentBit!4430 (_1!3859 lt!134875))) lt!134876))))

(declare-fun b!85753 () Bool)

(assert (=> b!85753 (= e!57090 (not true))))

(assert (=> b!85753 e!57086))

(declare-fun res!70381 () Bool)

(assert (=> b!85753 (=> (not res!70381) (not e!57086))))

(assert (=> b!85753 (= res!70381 (= (size!1839 (buf!2229 thiss!1152)) (size!1839 (buf!2229 (_2!3858 lt!134880)))))))

(declare-fun appendBit!0 (BitStream!3240 Bool) tuple2!7286)

(assert (=> b!85753 (= lt!134880 (appendBit!0 thiss!1152 lt!134879))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85753 (= lt!134879 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85754 () Bool)

(assert (=> b!85754 (= e!57083 (array_inv!1685 (buf!2229 thiss!1152)))))

(declare-fun b!85755 () Bool)

(declare-fun res!70389 () Bool)

(assert (=> b!85755 (=> (not res!70389) (not e!57084))))

(assert (=> b!85755 (= res!70389 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85756 () Bool)

(declare-fun res!70383 () Bool)

(assert (=> b!85756 (=> (not res!70383) (not e!57090))))

(assert (=> b!85756 (= res!70383 (bvslt i!576 nBits!336))))

(assert (= (and start!17748 res!70384) b!85749))

(assert (= (and b!85749 res!70393) b!85745))

(assert (= (and b!85745 res!70385) b!85755))

(assert (= (and b!85755 res!70389) b!85750))

(assert (= (and b!85750 res!70392) b!85742))

(assert (= (and b!85742 res!70390) b!85751))

(assert (= (and b!85751 res!70382) b!85748))

(assert (= (and b!85748 res!70386) b!85756))

(assert (= (and b!85756 res!70383) b!85753))

(assert (= (and b!85753 res!70381) b!85743))

(assert (= (and b!85743 res!70391) b!85746))

(assert (= (and b!85746 res!70388) b!85744))

(assert (= (and b!85744 res!70387) b!85752))

(assert (= start!17748 b!85754))

(assert (= start!17748 b!85747))

(declare-fun m!131809 () Bool)

(assert (=> b!85743 m!131809))

(declare-fun m!131811 () Bool)

(assert (=> b!85753 m!131811))

(declare-fun m!131813 () Bool)

(assert (=> b!85745 m!131813))

(declare-fun m!131815 () Bool)

(assert (=> b!85747 m!131815))

(declare-fun m!131817 () Bool)

(assert (=> b!85746 m!131817))

(declare-fun m!131819 () Bool)

(assert (=> b!85748 m!131819))

(declare-fun m!131821 () Bool)

(assert (=> b!85750 m!131821))

(declare-fun m!131823 () Bool)

(assert (=> b!85754 m!131823))

(declare-fun m!131825 () Bool)

(assert (=> b!85752 m!131825))

(declare-fun m!131827 () Bool)

(assert (=> start!17748 m!131827))

(declare-fun m!131829 () Bool)

(assert (=> start!17748 m!131829))

(declare-fun m!131831 () Bool)

(assert (=> b!85744 m!131831))

(assert (=> b!85744 m!131831))

(declare-fun m!131833 () Bool)

(assert (=> b!85744 m!131833))

(declare-fun m!131835 () Bool)

(assert (=> b!85751 m!131835))

(declare-fun m!131837 () Bool)

(assert (=> b!85751 m!131837))

(declare-fun m!131839 () Bool)

(assert (=> b!85749 m!131839))

(check-sat (not b!85747) (not b!85743) (not b!85751) (not start!17748) (not b!85748) (not b!85749) (not b!85745) (not b!85750) (not b!85752) (not b!85753) (not b!85746) (not b!85754) (not b!85744))
