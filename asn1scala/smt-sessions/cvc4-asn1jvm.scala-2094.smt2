; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53124 () Bool)

(assert start!53124)

(declare-fun b!246661 () Bool)

(declare-fun e!170891 () Bool)

(declare-fun e!170889 () Bool)

(assert (=> b!246661 (= e!170891 e!170889)))

(declare-fun res!206370 () Bool)

(assert (=> b!246661 (=> res!206370 e!170889)))

(declare-datatypes ((array!13452 0))(
  ( (array!13453 (arr!6885 (Array (_ BitVec 32) (_ BitVec 8))) (size!5898 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10718 0))(
  ( (BitStream!10719 (buf!6379 array!13452) (currentByte!11775 (_ BitVec 32)) (currentBit!11770 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10718)

(declare-datatypes ((Unit!17908 0))(
  ( (Unit!17909) )
))
(declare-datatypes ((tuple2!21168 0))(
  ( (tuple2!21169 (_1!11506 Unit!17908) (_2!11506 BitStream!10718)) )
))
(declare-fun lt!384769 () tuple2!21168)

(assert (=> b!246661 (= res!206370 (not (= (size!5898 (buf!6379 thiss!1005)) (size!5898 (buf!6379 (_2!11506 lt!384769))))))))

(declare-datatypes ((tuple2!21170 0))(
  ( (tuple2!21171 (_1!11507 BitStream!10718) (_2!11507 Bool)) )
))
(declare-fun lt!384767 () tuple2!21170)

(declare-fun lt!384753 () tuple2!21170)

(declare-datatypes ((tuple2!21172 0))(
  ( (tuple2!21173 (_1!11508 BitStream!10718) (_2!11508 BitStream!10718)) )
))
(declare-fun lt!384768 () tuple2!21172)

(assert (=> b!246661 (and (= (_2!11507 lt!384767) (_2!11507 lt!384753)) (= (_1!11507 lt!384767) (_2!11508 lt!384768)))))

(declare-fun b!246662 () Bool)

(declare-fun e!170896 () Bool)

(declare-fun e!170886 () Bool)

(assert (=> b!246662 (= e!170896 e!170886)))

(declare-fun res!206376 () Bool)

(assert (=> b!246662 (=> (not res!206376) (not e!170886))))

(declare-fun lt!384754 () tuple2!21168)

(declare-fun lt!384763 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246662 (= res!206376 (= (bitIndex!0 (size!5898 (buf!6379 (_2!11506 lt!384769))) (currentByte!11775 (_2!11506 lt!384769)) (currentBit!11770 (_2!11506 lt!384769))) (bvadd (bitIndex!0 (size!5898 (buf!6379 (_2!11506 lt!384754))) (currentByte!11775 (_2!11506 lt!384754)) (currentBit!11770 (_2!11506 lt!384754))) lt!384763)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!246662 (= lt!384763 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246663 () Bool)

(declare-fun e!170897 () Bool)

(declare-fun lt!384770 () tuple2!21170)

(declare-fun lt!384773 () tuple2!21170)

(assert (=> b!246663 (= e!170897 (= (_2!11507 lt!384770) (_2!11507 lt!384773)))))

(declare-fun b!246665 () Bool)

(declare-fun res!206375 () Bool)

(assert (=> b!246665 (=> (not res!206375) (not e!170886))))

(declare-fun isPrefixOf!0 (BitStream!10718 BitStream!10718) Bool)

(assert (=> b!246665 (= res!206375 (isPrefixOf!0 (_2!11506 lt!384754) (_2!11506 lt!384769)))))

(declare-fun b!246666 () Bool)

(declare-fun e!170893 () Bool)

(declare-fun lt!384765 () tuple2!21170)

(declare-fun lt!384751 () (_ BitVec 64))

(assert (=> b!246666 (= e!170893 (= (bitIndex!0 (size!5898 (buf!6379 (_1!11507 lt!384765))) (currentByte!11775 (_1!11507 lt!384765)) (currentBit!11770 (_1!11507 lt!384765))) lt!384751))))

(declare-fun b!246667 () Bool)

(declare-fun res!206373 () Bool)

(declare-fun e!170887 () Bool)

(assert (=> b!246667 (=> (not res!206373) (not e!170887))))

(assert (=> b!246667 (= res!206373 (bvslt from!289 nBits!297))))

(declare-fun b!246668 () Bool)

(assert (=> b!246668 (= e!170887 (not e!170891))))

(declare-fun res!206374 () Bool)

(assert (=> b!246668 (=> res!206374 e!170891)))

(declare-fun lt!384759 () tuple2!21172)

(assert (=> b!246668 (= res!206374 (not (= (_1!11507 lt!384753) (_2!11508 lt!384759))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10718 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21170)

(assert (=> b!246668 (= lt!384753 (checkBitsLoopPure!0 (_1!11508 lt!384759) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384758 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246668 (validate_offset_bits!1 ((_ sign_extend 32) (size!5898 (buf!6379 (_2!11506 lt!384769)))) ((_ sign_extend 32) (currentByte!11775 (_2!11506 lt!384754))) ((_ sign_extend 32) (currentBit!11770 (_2!11506 lt!384754))) lt!384758)))

(declare-fun lt!384755 () Unit!17908)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10718 array!13452 (_ BitVec 64)) Unit!17908)

(assert (=> b!246668 (= lt!384755 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11506 lt!384754) (buf!6379 (_2!11506 lt!384769)) lt!384758))))

(assert (=> b!246668 (= lt!384767 (checkBitsLoopPure!0 (_1!11508 lt!384768) nBits!297 bit!26 from!289))))

(assert (=> b!246668 (validate_offset_bits!1 ((_ sign_extend 32) (size!5898 (buf!6379 (_2!11506 lt!384769)))) ((_ sign_extend 32) (currentByte!11775 thiss!1005)) ((_ sign_extend 32) (currentBit!11770 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384760 () Unit!17908)

(assert (=> b!246668 (= lt!384760 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6379 (_2!11506 lt!384769)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10718) tuple2!21170)

(assert (=> b!246668 (= (_2!11507 (readBitPure!0 (_1!11508 lt!384768))) bit!26)))

(declare-fun reader!0 (BitStream!10718 BitStream!10718) tuple2!21172)

(assert (=> b!246668 (= lt!384759 (reader!0 (_2!11506 lt!384754) (_2!11506 lt!384769)))))

(assert (=> b!246668 (= lt!384768 (reader!0 thiss!1005 (_2!11506 lt!384769)))))

(assert (=> b!246668 e!170897))

(declare-fun res!206369 () Bool)

(assert (=> b!246668 (=> (not res!206369) (not e!170897))))

(assert (=> b!246668 (= res!206369 (= (bitIndex!0 (size!5898 (buf!6379 (_1!11507 lt!384770))) (currentByte!11775 (_1!11507 lt!384770)) (currentBit!11770 (_1!11507 lt!384770))) (bitIndex!0 (size!5898 (buf!6379 (_1!11507 lt!384773))) (currentByte!11775 (_1!11507 lt!384773)) (currentBit!11770 (_1!11507 lt!384773)))))))

(declare-fun lt!384756 () Unit!17908)

(declare-fun lt!384757 () BitStream!10718)

(declare-fun readBitPrefixLemma!0 (BitStream!10718 BitStream!10718) Unit!17908)

(assert (=> b!246668 (= lt!384756 (readBitPrefixLemma!0 lt!384757 (_2!11506 lt!384769)))))

(assert (=> b!246668 (= lt!384773 (readBitPure!0 (BitStream!10719 (buf!6379 (_2!11506 lt!384769)) (currentByte!11775 thiss!1005) (currentBit!11770 thiss!1005))))))

(assert (=> b!246668 (= lt!384770 (readBitPure!0 lt!384757))))

(assert (=> b!246668 (= lt!384757 (BitStream!10719 (buf!6379 (_2!11506 lt!384754)) (currentByte!11775 thiss!1005) (currentBit!11770 thiss!1005)))))

(declare-fun e!170890 () Bool)

(assert (=> b!246668 e!170890))

(declare-fun res!206372 () Bool)

(assert (=> b!246668 (=> (not res!206372) (not e!170890))))

(assert (=> b!246668 (= res!206372 (isPrefixOf!0 thiss!1005 (_2!11506 lt!384769)))))

(declare-fun lt!384772 () Unit!17908)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10718 BitStream!10718 BitStream!10718) Unit!17908)

(assert (=> b!246668 (= lt!384772 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11506 lt!384754) (_2!11506 lt!384769)))))

(assert (=> b!246668 e!170896))

(declare-fun res!206377 () Bool)

(assert (=> b!246668 (=> (not res!206377) (not e!170896))))

(assert (=> b!246668 (= res!206377 (= (size!5898 (buf!6379 (_2!11506 lt!384754))) (size!5898 (buf!6379 (_2!11506 lt!384769)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10718 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21168)

(assert (=> b!246668 (= lt!384769 (appendNBitsLoop!0 (_2!11506 lt!384754) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246668 (validate_offset_bits!1 ((_ sign_extend 32) (size!5898 (buf!6379 (_2!11506 lt!384754)))) ((_ sign_extend 32) (currentByte!11775 (_2!11506 lt!384754))) ((_ sign_extend 32) (currentBit!11770 (_2!11506 lt!384754))) lt!384758)))

(assert (=> b!246668 (= lt!384758 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384752 () Unit!17908)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10718 BitStream!10718 (_ BitVec 64) (_ BitVec 64)) Unit!17908)

(assert (=> b!246668 (= lt!384752 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11506 lt!384754) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170892 () Bool)

(assert (=> b!246668 e!170892))

(declare-fun res!206366 () Bool)

(assert (=> b!246668 (=> (not res!206366) (not e!170892))))

(assert (=> b!246668 (= res!206366 (= (size!5898 (buf!6379 thiss!1005)) (size!5898 (buf!6379 (_2!11506 lt!384754)))))))

(declare-fun appendBit!0 (BitStream!10718 Bool) tuple2!21168)

(assert (=> b!246668 (= lt!384754 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246669 () Bool)

(declare-fun res!206364 () Bool)

(assert (=> b!246669 (=> res!206364 e!170891)))

(declare-fun withMovedBitIndex!0 (BitStream!10718 (_ BitVec 64)) BitStream!10718)

(assert (=> b!246669 (= res!206364 (not (= (_1!11508 lt!384759) (withMovedBitIndex!0 (_1!11508 lt!384768) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246670 () Bool)

(declare-fun lt!384771 () tuple2!21170)

(declare-fun lt!384762 () tuple2!21172)

(assert (=> b!246670 (= e!170886 (not (or (not (_2!11507 lt!384771)) (not (= (_1!11507 lt!384771) (_2!11508 lt!384762))))))))

(assert (=> b!246670 (= lt!384771 (checkBitsLoopPure!0 (_1!11508 lt!384762) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246670 (validate_offset_bits!1 ((_ sign_extend 32) (size!5898 (buf!6379 (_2!11506 lt!384769)))) ((_ sign_extend 32) (currentByte!11775 (_2!11506 lt!384754))) ((_ sign_extend 32) (currentBit!11770 (_2!11506 lt!384754))) lt!384763)))

(declare-fun lt!384761 () Unit!17908)

(assert (=> b!246670 (= lt!384761 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11506 lt!384754) (buf!6379 (_2!11506 lt!384769)) lt!384763))))

(assert (=> b!246670 (= lt!384762 (reader!0 (_2!11506 lt!384754) (_2!11506 lt!384769)))))

(declare-fun b!246671 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246671 (= e!170890 (invariant!0 (currentBit!11770 thiss!1005) (currentByte!11775 thiss!1005) (size!5898 (buf!6379 (_2!11506 lt!384769)))))))

(declare-fun b!246672 () Bool)

(declare-fun e!170894 () Bool)

(assert (=> b!246672 (= e!170894 e!170893)))

(declare-fun res!206371 () Bool)

(assert (=> b!246672 (=> (not res!206371) (not e!170893))))

(assert (=> b!246672 (= res!206371 (and (= (_2!11507 lt!384765) bit!26) (= (_1!11507 lt!384765) (_2!11506 lt!384754))))))

(declare-fun readerFrom!0 (BitStream!10718 (_ BitVec 32) (_ BitVec 32)) BitStream!10718)

(assert (=> b!246672 (= lt!384765 (readBitPure!0 (readerFrom!0 (_2!11506 lt!384754) (currentBit!11770 thiss!1005) (currentByte!11775 thiss!1005))))))

(declare-fun res!206367 () Bool)

(assert (=> start!53124 (=> (not res!206367) (not e!170887))))

(assert (=> start!53124 (= res!206367 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53124 e!170887))

(assert (=> start!53124 true))

(declare-fun e!170888 () Bool)

(declare-fun inv!12 (BitStream!10718) Bool)

(assert (=> start!53124 (and (inv!12 thiss!1005) e!170888)))

(declare-fun b!246664 () Bool)

(declare-fun array_inv!5639 (array!13452) Bool)

(assert (=> b!246664 (= e!170888 (array_inv!5639 (buf!6379 thiss!1005)))))

(declare-fun b!246673 () Bool)

(declare-fun res!206368 () Bool)

(assert (=> b!246673 (=> (not res!206368) (not e!170887))))

(assert (=> b!246673 (= res!206368 (validate_offset_bits!1 ((_ sign_extend 32) (size!5898 (buf!6379 thiss!1005))) ((_ sign_extend 32) (currentByte!11775 thiss!1005)) ((_ sign_extend 32) (currentBit!11770 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246674 () Bool)

(declare-fun res!206378 () Bool)

(assert (=> b!246674 (=> (not res!206378) (not e!170894))))

(assert (=> b!246674 (= res!206378 (isPrefixOf!0 thiss!1005 (_2!11506 lt!384754)))))

(declare-fun b!246675 () Bool)

(assert (=> b!246675 (= e!170889 true)))

(declare-fun lt!384766 () (_ BitVec 64))

(assert (=> b!246675 (= lt!384766 (bitIndex!0 (size!5898 (buf!6379 (_2!11506 lt!384769))) (currentByte!11775 (_2!11506 lt!384769)) (currentBit!11770 (_2!11506 lt!384769))))))

(declare-fun lt!384764 () (_ BitVec 64))

(assert (=> b!246675 (= lt!384764 (bitIndex!0 (size!5898 (buf!6379 thiss!1005)) (currentByte!11775 thiss!1005) (currentBit!11770 thiss!1005)))))

(declare-fun b!246676 () Bool)

(declare-fun res!206365 () Bool)

(assert (=> b!246676 (=> (not res!206365) (not e!170890))))

(assert (=> b!246676 (= res!206365 (invariant!0 (currentBit!11770 thiss!1005) (currentByte!11775 thiss!1005) (size!5898 (buf!6379 (_2!11506 lt!384754)))))))

(declare-fun b!246677 () Bool)

(assert (=> b!246677 (= e!170892 e!170894)))

(declare-fun res!206379 () Bool)

(assert (=> b!246677 (=> (not res!206379) (not e!170894))))

(declare-fun lt!384774 () (_ BitVec 64))

(assert (=> b!246677 (= res!206379 (= lt!384751 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384774)))))

(assert (=> b!246677 (= lt!384751 (bitIndex!0 (size!5898 (buf!6379 (_2!11506 lt!384754))) (currentByte!11775 (_2!11506 lt!384754)) (currentBit!11770 (_2!11506 lt!384754))))))

(assert (=> b!246677 (= lt!384774 (bitIndex!0 (size!5898 (buf!6379 thiss!1005)) (currentByte!11775 thiss!1005) (currentBit!11770 thiss!1005)))))

(assert (= (and start!53124 res!206367) b!246673))

(assert (= (and b!246673 res!206368) b!246667))

(assert (= (and b!246667 res!206373) b!246668))

(assert (= (and b!246668 res!206366) b!246677))

(assert (= (and b!246677 res!206379) b!246674))

(assert (= (and b!246674 res!206378) b!246672))

(assert (= (and b!246672 res!206371) b!246666))

(assert (= (and b!246668 res!206377) b!246662))

(assert (= (and b!246662 res!206376) b!246665))

(assert (= (and b!246665 res!206375) b!246670))

(assert (= (and b!246668 res!206372) b!246676))

(assert (= (and b!246676 res!206365) b!246671))

(assert (= (and b!246668 res!206369) b!246663))

(assert (= (and b!246668 (not res!206374)) b!246669))

(assert (= (and b!246669 (not res!206364)) b!246661))

(assert (= (and b!246661 (not res!206370)) b!246675))

(assert (= start!53124 b!246664))

(declare-fun m!371997 () Bool)

(assert (=> b!246669 m!371997))

(declare-fun m!371999 () Bool)

(assert (=> b!246662 m!371999))

(declare-fun m!372001 () Bool)

(assert (=> b!246662 m!372001))

(declare-fun m!372003 () Bool)

(assert (=> b!246665 m!372003))

(assert (=> b!246677 m!372001))

(declare-fun m!372005 () Bool)

(assert (=> b!246677 m!372005))

(declare-fun m!372007 () Bool)

(assert (=> b!246664 m!372007))

(declare-fun m!372009 () Bool)

(assert (=> b!246666 m!372009))

(declare-fun m!372011 () Bool)

(assert (=> b!246673 m!372011))

(declare-fun m!372013 () Bool)

(assert (=> b!246671 m!372013))

(declare-fun m!372015 () Bool)

(assert (=> b!246668 m!372015))

(declare-fun m!372017 () Bool)

(assert (=> b!246668 m!372017))

(declare-fun m!372019 () Bool)

(assert (=> b!246668 m!372019))

(declare-fun m!372021 () Bool)

(assert (=> b!246668 m!372021))

(declare-fun m!372023 () Bool)

(assert (=> b!246668 m!372023))

(declare-fun m!372025 () Bool)

(assert (=> b!246668 m!372025))

(declare-fun m!372027 () Bool)

(assert (=> b!246668 m!372027))

(declare-fun m!372029 () Bool)

(assert (=> b!246668 m!372029))

(declare-fun m!372031 () Bool)

(assert (=> b!246668 m!372031))

(declare-fun m!372033 () Bool)

(assert (=> b!246668 m!372033))

(declare-fun m!372035 () Bool)

(assert (=> b!246668 m!372035))

(declare-fun m!372037 () Bool)

(assert (=> b!246668 m!372037))

(declare-fun m!372039 () Bool)

(assert (=> b!246668 m!372039))

(declare-fun m!372041 () Bool)

(assert (=> b!246668 m!372041))

(declare-fun m!372043 () Bool)

(assert (=> b!246668 m!372043))

(declare-fun m!372045 () Bool)

(assert (=> b!246668 m!372045))

(declare-fun m!372047 () Bool)

(assert (=> b!246668 m!372047))

(declare-fun m!372049 () Bool)

(assert (=> b!246668 m!372049))

(declare-fun m!372051 () Bool)

(assert (=> b!246668 m!372051))

(declare-fun m!372053 () Bool)

(assert (=> b!246668 m!372053))

(declare-fun m!372055 () Bool)

(assert (=> b!246672 m!372055))

(assert (=> b!246672 m!372055))

(declare-fun m!372057 () Bool)

(assert (=> b!246672 m!372057))

(declare-fun m!372059 () Bool)

(assert (=> b!246670 m!372059))

(declare-fun m!372061 () Bool)

(assert (=> b!246670 m!372061))

(declare-fun m!372063 () Bool)

(assert (=> b!246670 m!372063))

(assert (=> b!246670 m!372037))

(declare-fun m!372065 () Bool)

(assert (=> b!246674 m!372065))

(declare-fun m!372067 () Bool)

(assert (=> b!246676 m!372067))

(declare-fun m!372069 () Bool)

(assert (=> start!53124 m!372069))

(assert (=> b!246675 m!371999))

(assert (=> b!246675 m!372005))

(push 1)

(assert (not b!246666))

(assert (not start!53124))

(assert (not b!246668))

(assert (not b!246671))

(assert (not b!246669))

(assert (not b!246670))

(assert (not b!246662))

(assert (not b!246674))

(assert (not b!246665))

(assert (not b!246672))

(assert (not b!246673))

(assert (not b!246664))

(assert (not b!246676))

(assert (not b!246675))

(assert (not b!246677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

