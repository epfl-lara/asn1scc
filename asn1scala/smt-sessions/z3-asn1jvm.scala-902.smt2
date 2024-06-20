; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25488 () Bool)

(assert start!25488)

(declare-fun b!129001 () Bool)

(declare-fun res!106796 () Bool)

(declare-fun e!85509 () Bool)

(assert (=> b!129001 (=> (not res!106796) (not e!85509))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!129001 (= res!106796 (bvslt from!447 to!404))))

(declare-fun b!129002 () Bool)

(declare-datatypes ((array!5973 0))(
  ( (array!5974 (arr!3319 (Array (_ BitVec 32) (_ BitVec 8))) (size!2702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4668 0))(
  ( (BitStream!4669 (buf!3060 array!5973) (currentByte!5821 (_ BitVec 32)) (currentBit!5816 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10978 0))(
  ( (tuple2!10979 (_1!5786 BitStream!4668) (_2!5786 (_ BitVec 8))) )
))
(declare-fun lt!199687 () tuple2!10978)

(declare-fun arr!237 () array!5973)

(declare-datatypes ((tuple2!10980 0))(
  ( (tuple2!10981 (_1!5787 BitStream!4668) (_2!5787 BitStream!4668)) )
))
(declare-fun lt!199686 () tuple2!10980)

(declare-fun e!85511 () Bool)

(assert (=> b!129002 (= e!85511 (and (= (_2!5786 lt!199687) (select (arr!3319 arr!237) from!447)) (= (_1!5786 lt!199687) (_2!5787 lt!199686))))))

(declare-fun readBytePure!0 (BitStream!4668) tuple2!10978)

(assert (=> b!129002 (= lt!199687 (readBytePure!0 (_1!5787 lt!199686)))))

(declare-fun thiss!1634 () BitStream!4668)

(declare-datatypes ((Unit!8009 0))(
  ( (Unit!8010) )
))
(declare-datatypes ((tuple2!10982 0))(
  ( (tuple2!10983 (_1!5788 Unit!8009) (_2!5788 BitStream!4668)) )
))
(declare-fun lt!199685 () tuple2!10982)

(declare-fun reader!0 (BitStream!4668 BitStream!4668) tuple2!10980)

(assert (=> b!129002 (= lt!199686 (reader!0 thiss!1634 (_2!5788 lt!199685)))))

(declare-fun b!129003 () Bool)

(declare-fun res!106794 () Bool)

(assert (=> b!129003 (=> (not res!106794) (not e!85511))))

(declare-fun isPrefixOf!0 (BitStream!4668 BitStream!4668) Bool)

(assert (=> b!129003 (= res!106794 (isPrefixOf!0 thiss!1634 (_2!5788 lt!199685)))))

(declare-fun res!106793 () Bool)

(assert (=> start!25488 (=> (not res!106793) (not e!85509))))

(assert (=> start!25488 (= res!106793 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2702 arr!237))))))

(assert (=> start!25488 e!85509))

(assert (=> start!25488 true))

(declare-fun array_inv!2491 (array!5973) Bool)

(assert (=> start!25488 (array_inv!2491 arr!237)))

(declare-fun e!85510 () Bool)

(declare-fun inv!12 (BitStream!4668) Bool)

(assert (=> start!25488 (and (inv!12 thiss!1634) e!85510)))

(declare-fun b!129004 () Bool)

(declare-fun res!106795 () Bool)

(assert (=> b!129004 (=> (not res!106795) (not e!85509))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129004 (= res!106795 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2702 (buf!3060 thiss!1634))) ((_ sign_extend 32) (currentByte!5821 thiss!1634)) ((_ sign_extend 32) (currentBit!5816 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129005 () Bool)

(assert (=> b!129005 (= e!85510 (array_inv!2491 (buf!3060 thiss!1634)))))

(declare-fun b!129006 () Bool)

(assert (=> b!129006 (= e!85509 (not true))))

(assert (=> b!129006 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2702 (buf!3060 (_2!5788 lt!199685)))) ((_ sign_extend 32) (currentByte!5821 (_2!5788 lt!199685))) ((_ sign_extend 32) (currentBit!5816 (_2!5788 lt!199685))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199688 () Unit!8009)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4668 BitStream!4668 (_ BitVec 64) (_ BitVec 32)) Unit!8009)

(assert (=> b!129006 (= lt!199688 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5788 lt!199685) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129006 e!85511))

(declare-fun res!106792 () Bool)

(assert (=> b!129006 (=> (not res!106792) (not e!85511))))

(assert (=> b!129006 (= res!106792 (= (size!2702 (buf!3060 thiss!1634)) (size!2702 (buf!3060 (_2!5788 lt!199685)))))))

(declare-fun appendByte!0 (BitStream!4668 (_ BitVec 8)) tuple2!10982)

(assert (=> b!129006 (= lt!199685 (appendByte!0 thiss!1634 (select (arr!3319 arr!237) from!447)))))

(declare-fun b!129007 () Bool)

(declare-fun res!106797 () Bool)

(assert (=> b!129007 (=> (not res!106797) (not e!85509))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129007 (= res!106797 (invariant!0 (currentBit!5816 thiss!1634) (currentByte!5821 thiss!1634) (size!2702 (buf!3060 thiss!1634))))))

(declare-fun b!129008 () Bool)

(declare-fun res!106798 () Bool)

(assert (=> b!129008 (=> (not res!106798) (not e!85511))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129008 (= res!106798 (= (bitIndex!0 (size!2702 (buf!3060 (_2!5788 lt!199685))) (currentByte!5821 (_2!5788 lt!199685)) (currentBit!5816 (_2!5788 lt!199685))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2702 (buf!3060 thiss!1634)) (currentByte!5821 thiss!1634) (currentBit!5816 thiss!1634)))))))

(assert (= (and start!25488 res!106793) b!129004))

(assert (= (and b!129004 res!106795) b!129001))

(assert (= (and b!129001 res!106796) b!129007))

(assert (= (and b!129007 res!106797) b!129006))

(assert (= (and b!129006 res!106792) b!129008))

(assert (= (and b!129008 res!106798) b!129003))

(assert (= (and b!129003 res!106794) b!129002))

(assert (= start!25488 b!129005))

(declare-fun m!194765 () Bool)

(assert (=> start!25488 m!194765))

(declare-fun m!194767 () Bool)

(assert (=> start!25488 m!194767))

(declare-fun m!194769 () Bool)

(assert (=> b!129007 m!194769))

(declare-fun m!194771 () Bool)

(assert (=> b!129004 m!194771))

(declare-fun m!194773 () Bool)

(assert (=> b!129002 m!194773))

(declare-fun m!194775 () Bool)

(assert (=> b!129002 m!194775))

(declare-fun m!194777 () Bool)

(assert (=> b!129002 m!194777))

(declare-fun m!194779 () Bool)

(assert (=> b!129005 m!194779))

(declare-fun m!194781 () Bool)

(assert (=> b!129008 m!194781))

(declare-fun m!194783 () Bool)

(assert (=> b!129008 m!194783))

(declare-fun m!194785 () Bool)

(assert (=> b!129006 m!194785))

(declare-fun m!194787 () Bool)

(assert (=> b!129006 m!194787))

(assert (=> b!129006 m!194773))

(assert (=> b!129006 m!194773))

(declare-fun m!194789 () Bool)

(assert (=> b!129006 m!194789))

(declare-fun m!194791 () Bool)

(assert (=> b!129003 m!194791))

(check-sat (not start!25488) (not b!129007) (not b!129003) (not b!129008) (not b!129004) (not b!129006) (not b!129005) (not b!129002))
