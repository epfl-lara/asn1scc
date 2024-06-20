; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25678 () Bool)

(assert start!25678)

(declare-fun b!131005 () Bool)

(declare-fun e!86842 () Bool)

(declare-fun e!86839 () Bool)

(assert (=> b!131005 (= e!86842 (not e!86839))))

(declare-fun res!108652 () Bool)

(assert (=> b!131005 (=> res!108652 e!86839)))

(declare-datatypes ((array!6058 0))(
  ( (array!6059 (arr!3366 (Array (_ BitVec 32) (_ BitVec 8))) (size!2743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4750 0))(
  ( (BitStream!4751 (buf!3104 array!6058) (currentByte!5877 (_ BitVec 32)) (currentBit!5872 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11308 0))(
  ( (tuple2!11309 (_1!5954 BitStream!4750) (_2!5954 BitStream!4750)) )
))
(declare-fun lt!202055 () tuple2!11308)

(declare-fun arr!237 () array!6058)

(declare-datatypes ((tuple2!11310 0))(
  ( (tuple2!11311 (_1!5955 BitStream!4750) (_2!5955 array!6058)) )
))
(declare-fun lt!202049 () tuple2!11310)

(assert (=> b!131005 (= res!108652 (or (not (= (size!2743 (_2!5955 lt!202049)) (size!2743 arr!237))) (not (= (_1!5955 lt!202049) (_2!5954 lt!202055)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4750 array!6058 (_ BitVec 32) (_ BitVec 32)) tuple2!11310)

(assert (=> b!131005 (= lt!202049 (readByteArrayLoopPure!0 (_1!5954 lt!202055) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8100 0))(
  ( (Unit!8101) )
))
(declare-datatypes ((tuple2!11312 0))(
  ( (tuple2!11313 (_1!5956 Unit!8100) (_2!5956 BitStream!4750)) )
))
(declare-fun lt!202054 () tuple2!11312)

(declare-fun lt!202052 () tuple2!11312)

(declare-fun lt!202060 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131005 (validate_offset_bits!1 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) lt!202060)))

(declare-fun lt!202053 () Unit!8100)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4750 array!6058 (_ BitVec 64)) Unit!8100)

(assert (=> b!131005 (= lt!202053 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5956 lt!202052) (buf!3104 (_2!5956 lt!202054)) lt!202060))))

(declare-fun reader!0 (BitStream!4750 BitStream!4750) tuple2!11308)

(assert (=> b!131005 (= lt!202055 (reader!0 (_2!5956 lt!202052) (_2!5956 lt!202054)))))

(declare-fun b!131006 () Bool)

(declare-fun res!108647 () Bool)

(declare-fun e!86836 () Bool)

(assert (=> b!131006 (=> (not res!108647) (not e!86836))))

(declare-fun thiss!1634 () BitStream!4750)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131006 (= res!108647 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 thiss!1634))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131007 () Bool)

(declare-fun res!108649 () Bool)

(assert (=> b!131007 (=> (not res!108649) (not e!86836))))

(assert (=> b!131007 (= res!108649 (bvslt from!447 to!404))))

(declare-fun b!131008 () Bool)

(declare-fun res!108654 () Bool)

(assert (=> b!131008 (=> (not res!108654) (not e!86836))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131008 (= res!108654 (invariant!0 (currentBit!5872 thiss!1634) (currentByte!5877 thiss!1634) (size!2743 (buf!3104 thiss!1634))))))

(declare-fun b!131009 () Bool)

(declare-fun e!86840 () Bool)

(assert (=> b!131009 (= e!86840 (invariant!0 (currentBit!5872 thiss!1634) (currentByte!5877 thiss!1634) (size!2743 (buf!3104 (_2!5956 lt!202052)))))))

(declare-fun b!131010 () Bool)

(declare-fun res!108644 () Bool)

(assert (=> b!131010 (=> (not res!108644) (not e!86842))))

(declare-fun isPrefixOf!0 (BitStream!4750 BitStream!4750) Bool)

(assert (=> b!131010 (= res!108644 (isPrefixOf!0 (_2!5956 lt!202052) (_2!5956 lt!202054)))))

(declare-fun b!131011 () Bool)

(declare-fun arrayRangesEq!146 (array!6058 array!6058 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131011 (= e!86839 (not (arrayRangesEq!146 arr!237 (_2!5955 lt!202049) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131013 () Bool)

(declare-fun res!108645 () Bool)

(declare-fun e!86837 () Bool)

(assert (=> b!131013 (=> (not res!108645) (not e!86837))))

(assert (=> b!131013 (= res!108645 (isPrefixOf!0 thiss!1634 (_2!5956 lt!202052)))))

(declare-fun lt!202058 () tuple2!11308)

(declare-fun b!131014 () Bool)

(declare-datatypes ((tuple2!11314 0))(
  ( (tuple2!11315 (_1!5957 BitStream!4750) (_2!5957 (_ BitVec 8))) )
))
(declare-fun lt!202064 () tuple2!11314)

(assert (=> b!131014 (= e!86837 (and (= (_2!5957 lt!202064) (select (arr!3366 arr!237) from!447)) (= (_1!5957 lt!202064) (_2!5954 lt!202058))))))

(declare-fun readBytePure!0 (BitStream!4750) tuple2!11314)

(assert (=> b!131014 (= lt!202064 (readBytePure!0 (_1!5954 lt!202058)))))

(assert (=> b!131014 (= lt!202058 (reader!0 thiss!1634 (_2!5956 lt!202052)))))

(declare-fun b!131015 () Bool)

(declare-fun e!86835 () Bool)

(declare-fun lt!202048 () tuple2!11314)

(declare-fun lt!202061 () tuple2!11314)

(assert (=> b!131015 (= e!86835 (= (_2!5957 lt!202048) (_2!5957 lt!202061)))))

(declare-fun b!131016 () Bool)

(declare-fun res!108643 () Bool)

(assert (=> b!131016 (=> (not res!108643) (not e!86837))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131016 (= res!108643 (= (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))))

(declare-fun b!131017 () Bool)

(declare-fun e!86843 () Bool)

(declare-fun array_inv!2532 (array!6058) Bool)

(assert (=> b!131017 (= e!86843 (array_inv!2532 (buf!3104 thiss!1634)))))

(declare-fun lt!202063 () tuple2!11308)

(declare-fun b!131018 () Bool)

(assert (=> b!131018 (= e!86836 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5954 lt!202063)))) ((_ sign_extend 32) (currentByte!5877 (_1!5954 lt!202063))) ((_ sign_extend 32) (currentBit!5872 (_1!5954 lt!202063))) (bvsub to!404 from!447))))))

(assert (=> b!131018 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!202051 () Unit!8100)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4750 array!6058 (_ BitVec 32)) Unit!8100)

(assert (=> b!131018 (= lt!202051 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3104 (_2!5956 lt!202054)) (bvsub to!404 from!447)))))

(assert (=> b!131018 (= (_2!5957 (readBytePure!0 (_1!5954 lt!202063))) (select (arr!3366 arr!237) from!447))))

(declare-fun lt!202057 () tuple2!11308)

(assert (=> b!131018 (= lt!202057 (reader!0 (_2!5956 lt!202052) (_2!5956 lt!202054)))))

(assert (=> b!131018 (= lt!202063 (reader!0 thiss!1634 (_2!5956 lt!202054)))))

(assert (=> b!131018 e!86835))

(declare-fun res!108650 () Bool)

(assert (=> b!131018 (=> (not res!108650) (not e!86835))))

(assert (=> b!131018 (= res!108650 (= (bitIndex!0 (size!2743 (buf!3104 (_1!5957 lt!202048))) (currentByte!5877 (_1!5957 lt!202048)) (currentBit!5872 (_1!5957 lt!202048))) (bitIndex!0 (size!2743 (buf!3104 (_1!5957 lt!202061))) (currentByte!5877 (_1!5957 lt!202061)) (currentBit!5872 (_1!5957 lt!202061)))))))

(declare-fun lt!202059 () Unit!8100)

(declare-fun lt!202062 () BitStream!4750)

(declare-fun readBytePrefixLemma!0 (BitStream!4750 BitStream!4750) Unit!8100)

(assert (=> b!131018 (= lt!202059 (readBytePrefixLemma!0 lt!202062 (_2!5956 lt!202054)))))

(assert (=> b!131018 (= lt!202061 (readBytePure!0 (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634))))))

(assert (=> b!131018 (= lt!202048 (readBytePure!0 lt!202062))))

(assert (=> b!131018 (= lt!202062 (BitStream!4751 (buf!3104 (_2!5956 lt!202052)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(assert (=> b!131018 e!86840))

(declare-fun res!108655 () Bool)

(assert (=> b!131018 (=> (not res!108655) (not e!86840))))

(assert (=> b!131018 (= res!108655 (isPrefixOf!0 thiss!1634 (_2!5956 lt!202054)))))

(declare-fun lt!202056 () Unit!8100)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4750 BitStream!4750 BitStream!4750) Unit!8100)

(assert (=> b!131018 (= lt!202056 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5956 lt!202052) (_2!5956 lt!202054)))))

(declare-fun e!86834 () Bool)

(assert (=> b!131018 e!86834))

(declare-fun res!108646 () Bool)

(assert (=> b!131018 (=> (not res!108646) (not e!86834))))

(assert (=> b!131018 (= res!108646 (= (size!2743 (buf!3104 (_2!5956 lt!202052))) (size!2743 (buf!3104 (_2!5956 lt!202054)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4750 array!6058 (_ BitVec 32) (_ BitVec 32)) tuple2!11312)

(assert (=> b!131018 (= lt!202054 (appendByteArrayLoop!0 (_2!5956 lt!202052) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131018 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!202050 () Unit!8100)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4750 BitStream!4750 (_ BitVec 64) (_ BitVec 32)) Unit!8100)

(assert (=> b!131018 (= lt!202050 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5956 lt!202052) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131018 e!86837))

(declare-fun res!108648 () Bool)

(assert (=> b!131018 (=> (not res!108648) (not e!86837))))

(assert (=> b!131018 (= res!108648 (= (size!2743 (buf!3104 thiss!1634)) (size!2743 (buf!3104 (_2!5956 lt!202052)))))))

(declare-fun appendByte!0 (BitStream!4750 (_ BitVec 8)) tuple2!11312)

(assert (=> b!131018 (= lt!202052 (appendByte!0 thiss!1634 (select (arr!3366 arr!237) from!447)))))

(declare-fun res!108651 () Bool)

(assert (=> start!25678 (=> (not res!108651) (not e!86836))))

(assert (=> start!25678 (= res!108651 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2743 arr!237))))))

(assert (=> start!25678 e!86836))

(assert (=> start!25678 true))

(assert (=> start!25678 (array_inv!2532 arr!237)))

(declare-fun inv!12 (BitStream!4750) Bool)

(assert (=> start!25678 (and (inv!12 thiss!1634) e!86843)))

(declare-fun b!131012 () Bool)

(assert (=> b!131012 (= e!86834 e!86842)))

(declare-fun res!108653 () Bool)

(assert (=> b!131012 (=> (not res!108653) (not e!86842))))

(assert (=> b!131012 (= res!108653 (= (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202054))) (currentByte!5877 (_2!5956 lt!202054)) (currentBit!5872 (_2!5956 lt!202054))) (bvadd (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!202060))))))

(assert (=> b!131012 (= lt!202060 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!25678 res!108651) b!131006))

(assert (= (and b!131006 res!108647) b!131007))

(assert (= (and b!131007 res!108649) b!131008))

(assert (= (and b!131008 res!108654) b!131018))

(assert (= (and b!131018 res!108648) b!131016))

(assert (= (and b!131016 res!108643) b!131013))

(assert (= (and b!131013 res!108645) b!131014))

(assert (= (and b!131018 res!108646) b!131012))

(assert (= (and b!131012 res!108653) b!131010))

(assert (= (and b!131010 res!108644) b!131005))

(assert (= (and b!131005 (not res!108652)) b!131011))

(assert (= (and b!131018 res!108655) b!131009))

(assert (= (and b!131018 res!108650) b!131015))

(assert (= start!25678 b!131017))

(declare-fun m!197617 () Bool)

(assert (=> b!131013 m!197617))

(declare-fun m!197619 () Bool)

(assert (=> start!25678 m!197619))

(declare-fun m!197621 () Bool)

(assert (=> start!25678 m!197621))

(declare-fun m!197623 () Bool)

(assert (=> b!131009 m!197623))

(declare-fun m!197625 () Bool)

(assert (=> b!131018 m!197625))

(declare-fun m!197627 () Bool)

(assert (=> b!131018 m!197627))

(declare-fun m!197629 () Bool)

(assert (=> b!131018 m!197629))

(declare-fun m!197631 () Bool)

(assert (=> b!131018 m!197631))

(declare-fun m!197633 () Bool)

(assert (=> b!131018 m!197633))

(declare-fun m!197635 () Bool)

(assert (=> b!131018 m!197635))

(declare-fun m!197637 () Bool)

(assert (=> b!131018 m!197637))

(declare-fun m!197639 () Bool)

(assert (=> b!131018 m!197639))

(declare-fun m!197641 () Bool)

(assert (=> b!131018 m!197641))

(declare-fun m!197643 () Bool)

(assert (=> b!131018 m!197643))

(declare-fun m!197645 () Bool)

(assert (=> b!131018 m!197645))

(declare-fun m!197647 () Bool)

(assert (=> b!131018 m!197647))

(declare-fun m!197649 () Bool)

(assert (=> b!131018 m!197649))

(declare-fun m!197651 () Bool)

(assert (=> b!131018 m!197651))

(assert (=> b!131018 m!197647))

(declare-fun m!197653 () Bool)

(assert (=> b!131018 m!197653))

(declare-fun m!197655 () Bool)

(assert (=> b!131018 m!197655))

(declare-fun m!197657 () Bool)

(assert (=> b!131018 m!197657))

(declare-fun m!197659 () Bool)

(assert (=> b!131018 m!197659))

(declare-fun m!197661 () Bool)

(assert (=> b!131006 m!197661))

(declare-fun m!197663 () Bool)

(assert (=> b!131012 m!197663))

(declare-fun m!197665 () Bool)

(assert (=> b!131012 m!197665))

(declare-fun m!197667 () Bool)

(assert (=> b!131010 m!197667))

(assert (=> b!131014 m!197647))

(declare-fun m!197669 () Bool)

(assert (=> b!131014 m!197669))

(declare-fun m!197671 () Bool)

(assert (=> b!131014 m!197671))

(declare-fun m!197673 () Bool)

(assert (=> b!131008 m!197673))

(declare-fun m!197675 () Bool)

(assert (=> b!131005 m!197675))

(declare-fun m!197677 () Bool)

(assert (=> b!131005 m!197677))

(declare-fun m!197679 () Bool)

(assert (=> b!131005 m!197679))

(assert (=> b!131005 m!197633))

(declare-fun m!197681 () Bool)

(assert (=> b!131017 m!197681))

(assert (=> b!131016 m!197665))

(declare-fun m!197683 () Bool)

(assert (=> b!131016 m!197683))

(declare-fun m!197685 () Bool)

(assert (=> b!131011 m!197685))

(push 1)

(assert (not b!131006))

(assert (not b!131005))

(assert (not b!131008))

(assert (not b!131011))

(assert (not b!131016))

(assert (not b!131012))

(assert (not start!25678))

(assert (not b!131017))

(assert (not b!131010))

(assert (not b!131014))

(assert (not b!131009))

(assert (not b!131018))

(assert (not b!131013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41719 () Bool)

(declare-fun res!108741 () Bool)

(declare-fun e!86909 () Bool)

(assert (=> d!41719 (=> (not res!108741) (not e!86909))))

(assert (=> d!41719 (= res!108741 (= (size!2743 (buf!3104 (_2!5956 lt!202052))) (size!2743 (buf!3104 (_2!5956 lt!202054)))))))

(assert (=> d!41719 (= (isPrefixOf!0 (_2!5956 lt!202052) (_2!5956 lt!202054)) e!86909)))

(declare-fun b!131109 () Bool)

(declare-fun res!108740 () Bool)

(assert (=> b!131109 (=> (not res!108740) (not e!86909))))

(assert (=> b!131109 (= res!108740 (bvsle (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))) (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202054))) (currentByte!5877 (_2!5956 lt!202054)) (currentBit!5872 (_2!5956 lt!202054)))))))

(declare-fun b!131110 () Bool)

(declare-fun e!86908 () Bool)

(assert (=> b!131110 (= e!86909 e!86908)))

(declare-fun res!108742 () Bool)

(assert (=> b!131110 (=> res!108742 e!86908)))

(assert (=> b!131110 (= res!108742 (= (size!2743 (buf!3104 (_2!5956 lt!202052))) #b00000000000000000000000000000000))))

(declare-fun b!131111 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6058 array!6058 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131111 (= e!86908 (arrayBitRangesEq!0 (buf!3104 (_2!5956 lt!202052)) (buf!3104 (_2!5956 lt!202054)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052)))))))

(assert (= (and d!41719 res!108741) b!131109))

(assert (= (and b!131109 res!108740) b!131110))

(assert (= (and b!131110 (not res!108742)) b!131111))

(assert (=> b!131109 m!197665))

(assert (=> b!131109 m!197663))

(assert (=> b!131111 m!197665))

(assert (=> b!131111 m!197665))

(declare-fun m!197831 () Bool)

(assert (=> b!131111 m!197831))

(assert (=> b!131010 d!41719))

(declare-fun d!41725 () Bool)

(assert (=> d!41725 (= (invariant!0 (currentBit!5872 thiss!1634) (currentByte!5877 thiss!1634) (size!2743 (buf!3104 thiss!1634))) (and (bvsge (currentBit!5872 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5872 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5877 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5877 thiss!1634) (size!2743 (buf!3104 thiss!1634))) (and (= (currentBit!5872 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5877 thiss!1634) (size!2743 (buf!3104 thiss!1634)))))))))

(assert (=> b!131008 d!41725))

(declare-fun d!41727 () Bool)

(assert (=> d!41727 (= (invariant!0 (currentBit!5872 thiss!1634) (currentByte!5877 thiss!1634) (size!2743 (buf!3104 (_2!5956 lt!202052)))) (and (bvsge (currentBit!5872 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5872 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5877 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5877 thiss!1634) (size!2743 (buf!3104 (_2!5956 lt!202052)))) (and (= (currentBit!5872 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5877 thiss!1634) (size!2743 (buf!3104 (_2!5956 lt!202052))))))))))

(assert (=> b!131009 d!41727))

(declare-fun d!41729 () Bool)

(assert (=> d!41729 (isPrefixOf!0 thiss!1634 (_2!5956 lt!202054))))

(declare-fun lt!202175 () Unit!8100)

(declare-fun choose!30 (BitStream!4750 BitStream!4750 BitStream!4750) Unit!8100)

(assert (=> d!41729 (= lt!202175 (choose!30 thiss!1634 (_2!5956 lt!202052) (_2!5956 lt!202054)))))

(assert (=> d!41729 (isPrefixOf!0 thiss!1634 (_2!5956 lt!202052))))

(assert (=> d!41729 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5956 lt!202052) (_2!5956 lt!202054)) lt!202175)))

(declare-fun bs!10191 () Bool)

(assert (= bs!10191 d!41729))

(assert (=> bs!10191 m!197651))

(declare-fun m!197835 () Bool)

(assert (=> bs!10191 m!197835))

(assert (=> bs!10191 m!197617))

(assert (=> b!131018 d!41729))

(declare-fun d!41733 () Bool)

(declare-fun res!108744 () Bool)

(declare-fun e!86911 () Bool)

(assert (=> d!41733 (=> (not res!108744) (not e!86911))))

(assert (=> d!41733 (= res!108744 (= (size!2743 (buf!3104 thiss!1634)) (size!2743 (buf!3104 (_2!5956 lt!202054)))))))

(assert (=> d!41733 (= (isPrefixOf!0 thiss!1634 (_2!5956 lt!202054)) e!86911)))

(declare-fun b!131112 () Bool)

(declare-fun res!108743 () Bool)

(assert (=> b!131112 (=> (not res!108743) (not e!86911))))

(assert (=> b!131112 (= res!108743 (bvsle (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)) (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202054))) (currentByte!5877 (_2!5956 lt!202054)) (currentBit!5872 (_2!5956 lt!202054)))))))

(declare-fun b!131113 () Bool)

(declare-fun e!86910 () Bool)

(assert (=> b!131113 (= e!86911 e!86910)))

(declare-fun res!108745 () Bool)

(assert (=> b!131113 (=> res!108745 e!86910)))

(assert (=> b!131113 (= res!108745 (= (size!2743 (buf!3104 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!131114 () Bool)

(assert (=> b!131114 (= e!86910 (arrayBitRangesEq!0 (buf!3104 thiss!1634) (buf!3104 (_2!5956 lt!202054)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634))))))

(assert (= (and d!41733 res!108744) b!131112))

(assert (= (and b!131112 res!108743) b!131113))

(assert (= (and b!131113 (not res!108745)) b!131114))

(assert (=> b!131112 m!197683))

(assert (=> b!131112 m!197663))

(assert (=> b!131114 m!197683))

(assert (=> b!131114 m!197683))

(declare-fun m!197837 () Bool)

(assert (=> b!131114 m!197837))

(assert (=> b!131018 d!41733))

(declare-fun d!41735 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41735 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10192 () Bool)

(assert (= bs!10192 d!41735))

(declare-fun m!197839 () Bool)

(assert (=> bs!10192 m!197839))

(assert (=> b!131018 d!41735))

(declare-fun d!41737 () Bool)

(declare-datatypes ((tuple2!11332 0))(
  ( (tuple2!11333 (_1!5967 (_ BitVec 8)) (_2!5967 BitStream!4750)) )
))
(declare-fun lt!202178 () tuple2!11332)

(declare-fun readByte!0 (BitStream!4750) tuple2!11332)

(assert (=> d!41737 (= lt!202178 (readByte!0 (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634))))))

(assert (=> d!41737 (= (readBytePure!0 (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634))) (tuple2!11315 (_2!5967 lt!202178) (_1!5967 lt!202178)))))

(declare-fun bs!10193 () Bool)

(assert (= bs!10193 d!41737))

(declare-fun m!197841 () Bool)

(assert (=> bs!10193 m!197841))

(assert (=> b!131018 d!41737))

(declare-fun b!131170 () Bool)

(declare-fun e!86944 () Bool)

(declare-fun lt!202311 () (_ BitVec 64))

(assert (=> b!131170 (= e!86944 (validate_offset_bits!1 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) lt!202311))))

(declare-fun b!131171 () Bool)

(declare-fun res!108795 () Bool)

(declare-fun e!86943 () Bool)

(assert (=> b!131171 (=> (not res!108795) (not e!86943))))

(declare-fun lt!202316 () tuple2!11312)

(assert (=> b!131171 (= res!108795 (isPrefixOf!0 (_2!5956 lt!202052) (_2!5956 lt!202316)))))

(declare-fun b!131172 () Bool)

(declare-fun e!86945 () Bool)

(assert (=> b!131172 (= e!86943 e!86945)))

(declare-fun res!108793 () Bool)

(assert (=> b!131172 (=> (not res!108793) (not e!86945))))

(declare-fun lt!202310 () tuple2!11310)

(declare-fun lt!202317 () tuple2!11308)

(assert (=> b!131172 (= res!108793 (and (= (size!2743 (_2!5955 lt!202310)) (size!2743 arr!237)) (= (_1!5955 lt!202310) (_2!5954 lt!202317))))))

(assert (=> b!131172 (= lt!202310 (readByteArrayLoopPure!0 (_1!5954 lt!202317) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!202315 () Unit!8100)

(declare-fun lt!202312 () Unit!8100)

(assert (=> b!131172 (= lt!202315 lt!202312)))

(assert (=> b!131172 (validate_offset_bits!1 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202316)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) lt!202311)))

(assert (=> b!131172 (= lt!202312 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5956 lt!202052) (buf!3104 (_2!5956 lt!202316)) lt!202311))))

(assert (=> b!131172 e!86944))

(declare-fun res!108796 () Bool)

(assert (=> b!131172 (=> (not res!108796) (not e!86944))))

(assert (=> b!131172 (= res!108796 (and (= (size!2743 (buf!3104 (_2!5956 lt!202052))) (size!2743 (buf!3104 (_2!5956 lt!202316)))) (bvsge lt!202311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131172 (= lt!202311 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!131172 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!131172 (= lt!202317 (reader!0 (_2!5956 lt!202052) (_2!5956 lt!202316)))))

(declare-fun d!41739 () Bool)

(assert (=> d!41739 e!86943))

(declare-fun res!108794 () Bool)

(assert (=> d!41739 (=> (not res!108794) (not e!86943))))

(assert (=> d!41739 (= res!108794 (= (size!2743 (buf!3104 (_2!5956 lt!202052))) (size!2743 (buf!3104 (_2!5956 lt!202316)))))))

(declare-fun choose!64 (BitStream!4750 array!6058 (_ BitVec 32) (_ BitVec 32)) tuple2!11312)

(assert (=> d!41739 (= lt!202316 (choose!64 (_2!5956 lt!202052) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41739 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2743 arr!237)))))

(assert (=> d!41739 (= (appendByteArrayLoop!0 (_2!5956 lt!202052) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!202316)))

(declare-fun b!131173 () Bool)

(assert (=> b!131173 (= e!86945 (arrayRangesEq!146 arr!237 (_2!5955 lt!202310) #b00000000000000000000000000000000 to!404))))

(declare-fun b!131174 () Bool)

(declare-fun res!108797 () Bool)

(assert (=> b!131174 (=> (not res!108797) (not e!86943))))

(declare-fun lt!202318 () (_ BitVec 64))

(declare-fun lt!202313 () (_ BitVec 64))

(assert (=> b!131174 (= res!108797 (= (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202316))) (currentByte!5877 (_2!5956 lt!202316)) (currentBit!5872 (_2!5956 lt!202316))) (bvadd lt!202313 lt!202318)))))

(assert (=> b!131174 (or (not (= (bvand lt!202313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202318 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!202313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!202313 lt!202318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!202314 () (_ BitVec 64))

(assert (=> b!131174 (= lt!202318 (bvmul lt!202314 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!131174 (or (= lt!202314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202314)))))

(assert (=> b!131174 (= lt!202314 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!131174 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!131174 (= lt!202313 (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))))))

(assert (= (and d!41739 res!108794) b!131174))

(assert (= (and b!131174 res!108797) b!131171))

(assert (= (and b!131171 res!108795) b!131172))

(assert (= (and b!131172 res!108796) b!131170))

(assert (= (and b!131172 res!108793) b!131173))

(declare-fun m!197919 () Bool)

(assert (=> b!131173 m!197919))

(declare-fun m!197921 () Bool)

(assert (=> b!131172 m!197921))

(declare-fun m!197925 () Bool)

(assert (=> b!131172 m!197925))

(declare-fun m!197927 () Bool)

(assert (=> b!131172 m!197927))

(declare-fun m!197929 () Bool)

(assert (=> b!131172 m!197929))

(declare-fun m!197931 () Bool)

(assert (=> b!131170 m!197931))

(declare-fun m!197933 () Bool)

(assert (=> d!41739 m!197933))

(declare-fun m!197935 () Bool)

(assert (=> b!131171 m!197935))

(declare-fun m!197937 () Bool)

(assert (=> b!131174 m!197937))

(assert (=> b!131174 m!197665))

(assert (=> b!131018 d!41739))

(declare-fun d!41767 () Bool)

(declare-fun e!86952 () Bool)

(assert (=> d!41767 e!86952))

(declare-fun res!108807 () Bool)

(assert (=> d!41767 (=> (not res!108807) (not e!86952))))

(declare-fun lt!202365 () tuple2!11314)

(declare-fun lt!202364 () tuple2!11314)

(assert (=> d!41767 (= res!108807 (= (bitIndex!0 (size!2743 (buf!3104 (_1!5957 lt!202365))) (currentByte!5877 (_1!5957 lt!202365)) (currentBit!5872 (_1!5957 lt!202365))) (bitIndex!0 (size!2743 (buf!3104 (_1!5957 lt!202364))) (currentByte!5877 (_1!5957 lt!202364)) (currentBit!5872 (_1!5957 lt!202364)))))))

(declare-fun lt!202362 () Unit!8100)

(declare-fun lt!202363 () BitStream!4750)

(declare-fun choose!14 (BitStream!4750 BitStream!4750 BitStream!4750 tuple2!11314 tuple2!11314 BitStream!4750 (_ BitVec 8) tuple2!11314 tuple2!11314 BitStream!4750 (_ BitVec 8)) Unit!8100)

(assert (=> d!41767 (= lt!202362 (choose!14 lt!202062 (_2!5956 lt!202054) lt!202363 lt!202365 (tuple2!11315 (_1!5957 lt!202365) (_2!5957 lt!202365)) (_1!5957 lt!202365) (_2!5957 lt!202365) lt!202364 (tuple2!11315 (_1!5957 lt!202364) (_2!5957 lt!202364)) (_1!5957 lt!202364) (_2!5957 lt!202364)))))

(assert (=> d!41767 (= lt!202364 (readBytePure!0 lt!202363))))

(assert (=> d!41767 (= lt!202365 (readBytePure!0 lt!202062))))

(assert (=> d!41767 (= lt!202363 (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 lt!202062) (currentBit!5872 lt!202062)))))

(assert (=> d!41767 (= (readBytePrefixLemma!0 lt!202062 (_2!5956 lt!202054)) lt!202362)))

(declare-fun b!131186 () Bool)

(assert (=> b!131186 (= e!86952 (= (_2!5957 lt!202365) (_2!5957 lt!202364)))))

(assert (= (and d!41767 res!108807) b!131186))

(declare-fun m!197971 () Bool)

(assert (=> d!41767 m!197971))

(declare-fun m!197973 () Bool)

(assert (=> d!41767 m!197973))

(declare-fun m!197975 () Bool)

(assert (=> d!41767 m!197975))

(declare-fun m!197977 () Bool)

(assert (=> d!41767 m!197977))

(assert (=> d!41767 m!197639))

(assert (=> b!131018 d!41767))

(declare-fun d!41780 () Bool)

(declare-fun e!86958 () Bool)

(assert (=> d!41780 e!86958))

(declare-fun res!108813 () Bool)

(assert (=> d!41780 (=> (not res!108813) (not e!86958))))

(assert (=> d!41780 (= res!108813 (and (or (let ((rhs!3082 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3082 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3082) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!41781 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!41781 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!41781 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3081 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3081 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3081) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!202381 () Unit!8100)

(declare-fun choose!57 (BitStream!4750 BitStream!4750 (_ BitVec 64) (_ BitVec 32)) Unit!8100)

(assert (=> d!41780 (= lt!202381 (choose!57 thiss!1634 (_2!5956 lt!202052) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!41780 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5956 lt!202052) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!202381)))

(declare-fun b!131192 () Bool)

(declare-fun lt!202383 () (_ BitVec 32))

(assert (=> b!131192 (= e!86958 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) (bvsub (bvsub to!404 from!447) lt!202383)))))

(assert (=> b!131192 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!202383 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!202383) #b10000000000000000000000000000000)))))

(declare-fun lt!202382 () (_ BitVec 64))

(assert (=> b!131192 (= lt!202383 ((_ extract 31 0) lt!202382))))

(assert (=> b!131192 (and (bvslt lt!202382 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!202382 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!131192 (= lt!202382 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!41780 res!108813) b!131192))

(declare-fun m!197983 () Bool)

(assert (=> d!41780 m!197983))

(declare-fun m!197985 () Bool)

(assert (=> b!131192 m!197985))

(assert (=> b!131018 d!41780))

(declare-fun b!131212 () Bool)

(declare-fun e!86966 () Unit!8100)

(declare-fun lt!202457 () Unit!8100)

(assert (=> b!131212 (= e!86966 lt!202457)))

(declare-fun lt!202453 () (_ BitVec 64))

(assert (=> b!131212 (= lt!202453 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202450 () (_ BitVec 64))

(assert (=> b!131212 (= lt!202450 (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6058 array!6058 (_ BitVec 64) (_ BitVec 64)) Unit!8100)

(assert (=> b!131212 (= lt!202457 (arrayBitRangesEqSymmetric!0 (buf!3104 (_2!5956 lt!202052)) (buf!3104 (_2!5956 lt!202054)) lt!202453 lt!202450))))

(assert (=> b!131212 (arrayBitRangesEq!0 (buf!3104 (_2!5956 lt!202054)) (buf!3104 (_2!5956 lt!202052)) lt!202453 lt!202450)))

(declare-fun b!131213 () Bool)

(declare-fun Unit!8107 () Unit!8100)

(assert (=> b!131213 (= e!86966 Unit!8107)))

(declare-fun lt!202443 () (_ BitVec 64))

(declare-fun b!131214 () Bool)

(declare-fun e!86967 () Bool)

(declare-fun lt!202448 () (_ BitVec 64))

(declare-fun lt!202446 () tuple2!11308)

(declare-fun withMovedBitIndex!0 (BitStream!4750 (_ BitVec 64)) BitStream!4750)

(assert (=> b!131214 (= e!86967 (= (_1!5954 lt!202446) (withMovedBitIndex!0 (_2!5954 lt!202446) (bvsub lt!202448 lt!202443))))))

(assert (=> b!131214 (or (= (bvand lt!202448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202448 lt!202443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131214 (= lt!202443 (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202054))) (currentByte!5877 (_2!5956 lt!202054)) (currentBit!5872 (_2!5956 lt!202054))))))

(assert (=> b!131214 (= lt!202448 (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))))))

(declare-fun b!131215 () Bool)

(declare-fun res!108831 () Bool)

(assert (=> b!131215 (=> (not res!108831) (not e!86967))))

(assert (=> b!131215 (= res!108831 (isPrefixOf!0 (_2!5954 lt!202446) (_2!5956 lt!202054)))))

(declare-fun b!131216 () Bool)

(declare-fun res!108830 () Bool)

(assert (=> b!131216 (=> (not res!108830) (not e!86967))))

(assert (=> b!131216 (= res!108830 (isPrefixOf!0 (_1!5954 lt!202446) (_2!5956 lt!202052)))))

(declare-fun d!41785 () Bool)

(assert (=> d!41785 e!86967))

(declare-fun res!108829 () Bool)

(assert (=> d!41785 (=> (not res!108829) (not e!86967))))

(assert (=> d!41785 (= res!108829 (isPrefixOf!0 (_1!5954 lt!202446) (_2!5954 lt!202446)))))

(declare-fun lt!202449 () BitStream!4750)

(assert (=> d!41785 (= lt!202446 (tuple2!11309 lt!202449 (_2!5956 lt!202054)))))

(declare-fun lt!202440 () Unit!8100)

(declare-fun lt!202456 () Unit!8100)

(assert (=> d!41785 (= lt!202440 lt!202456)))

(assert (=> d!41785 (isPrefixOf!0 lt!202449 (_2!5956 lt!202054))))

(assert (=> d!41785 (= lt!202456 (lemmaIsPrefixTransitive!0 lt!202449 (_2!5956 lt!202054) (_2!5956 lt!202054)))))

(declare-fun lt!202455 () Unit!8100)

(declare-fun lt!202452 () Unit!8100)

(assert (=> d!41785 (= lt!202455 lt!202452)))

(assert (=> d!41785 (isPrefixOf!0 lt!202449 (_2!5956 lt!202054))))

(assert (=> d!41785 (= lt!202452 (lemmaIsPrefixTransitive!0 lt!202449 (_2!5956 lt!202052) (_2!5956 lt!202054)))))

(declare-fun lt!202447 () Unit!8100)

(assert (=> d!41785 (= lt!202447 e!86966)))

(declare-fun c!7562 () Bool)

(assert (=> d!41785 (= c!7562 (not (= (size!2743 (buf!3104 (_2!5956 lt!202052))) #b00000000000000000000000000000000)))))

(declare-fun lt!202442 () Unit!8100)

(declare-fun lt!202441 () Unit!8100)

(assert (=> d!41785 (= lt!202442 lt!202441)))

(assert (=> d!41785 (isPrefixOf!0 (_2!5956 lt!202054) (_2!5956 lt!202054))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4750) Unit!8100)

(assert (=> d!41785 (= lt!202441 (lemmaIsPrefixRefl!0 (_2!5956 lt!202054)))))

(declare-fun lt!202439 () Unit!8100)

(declare-fun lt!202454 () Unit!8100)

(assert (=> d!41785 (= lt!202439 lt!202454)))

(assert (=> d!41785 (= lt!202454 (lemmaIsPrefixRefl!0 (_2!5956 lt!202054)))))

(declare-fun lt!202458 () Unit!8100)

(declare-fun lt!202451 () Unit!8100)

(assert (=> d!41785 (= lt!202458 lt!202451)))

(assert (=> d!41785 (isPrefixOf!0 lt!202449 lt!202449)))

(assert (=> d!41785 (= lt!202451 (lemmaIsPrefixRefl!0 lt!202449))))

(declare-fun lt!202445 () Unit!8100)

(declare-fun lt!202444 () Unit!8100)

(assert (=> d!41785 (= lt!202445 lt!202444)))

(assert (=> d!41785 (isPrefixOf!0 (_2!5956 lt!202052) (_2!5956 lt!202052))))

(assert (=> d!41785 (= lt!202444 (lemmaIsPrefixRefl!0 (_2!5956 lt!202052)))))

(assert (=> d!41785 (= lt!202449 (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))))))

(assert (=> d!41785 (isPrefixOf!0 (_2!5956 lt!202052) (_2!5956 lt!202054))))

(assert (=> d!41785 (= (reader!0 (_2!5956 lt!202052) (_2!5956 lt!202054)) lt!202446)))

(assert (= (and d!41785 c!7562) b!131212))

(assert (= (and d!41785 (not c!7562)) b!131213))

(assert (= (and d!41785 res!108829) b!131216))

(assert (= (and b!131216 res!108830) b!131215))

(assert (= (and b!131215 res!108831) b!131214))

(declare-fun m!197999 () Bool)

(assert (=> b!131215 m!197999))

(declare-fun m!198001 () Bool)

(assert (=> d!41785 m!198001))

(declare-fun m!198003 () Bool)

(assert (=> d!41785 m!198003))

(declare-fun m!198005 () Bool)

(assert (=> d!41785 m!198005))

(declare-fun m!198007 () Bool)

(assert (=> d!41785 m!198007))

(declare-fun m!198009 () Bool)

(assert (=> d!41785 m!198009))

(declare-fun m!198011 () Bool)

(assert (=> d!41785 m!198011))

(declare-fun m!198013 () Bool)

(assert (=> d!41785 m!198013))

(declare-fun m!198015 () Bool)

(assert (=> d!41785 m!198015))

(declare-fun m!198017 () Bool)

(assert (=> d!41785 m!198017))

(declare-fun m!198019 () Bool)

(assert (=> d!41785 m!198019))

(assert (=> d!41785 m!197667))

(declare-fun m!198021 () Bool)

(assert (=> b!131214 m!198021))

(assert (=> b!131214 m!197663))

(assert (=> b!131214 m!197665))

(assert (=> b!131212 m!197665))

(declare-fun m!198023 () Bool)

(assert (=> b!131212 m!198023))

(declare-fun m!198025 () Bool)

(assert (=> b!131212 m!198025))

(declare-fun m!198027 () Bool)

(assert (=> b!131216 m!198027))

(assert (=> b!131018 d!41785))

(declare-fun d!41789 () Bool)

(declare-fun lt!202459 () tuple2!11332)

(assert (=> d!41789 (= lt!202459 (readByte!0 lt!202062))))

(assert (=> d!41789 (= (readBytePure!0 lt!202062) (tuple2!11315 (_2!5967 lt!202459) (_1!5967 lt!202459)))))

(declare-fun bs!10200 () Bool)

(assert (= bs!10200 d!41789))

(declare-fun m!198029 () Bool)

(assert (=> bs!10200 m!198029))

(assert (=> b!131018 d!41789))

(declare-fun d!41791 () Bool)

(declare-fun e!86970 () Bool)

(assert (=> d!41791 e!86970))

(declare-fun res!108836 () Bool)

(assert (=> d!41791 (=> (not res!108836) (not e!86970))))

(declare-fun lt!202476 () (_ BitVec 64))

(declare-fun lt!202472 () (_ BitVec 64))

(declare-fun lt!202475 () (_ BitVec 64))

(assert (=> d!41791 (= res!108836 (= lt!202472 (bvsub lt!202476 lt!202475)))))

(assert (=> d!41791 (or (= (bvand lt!202476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202476 lt!202475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41791 (= lt!202475 (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5957 lt!202061)))) ((_ sign_extend 32) (currentByte!5877 (_1!5957 lt!202061))) ((_ sign_extend 32) (currentBit!5872 (_1!5957 lt!202061)))))))

(declare-fun lt!202474 () (_ BitVec 64))

(declare-fun lt!202473 () (_ BitVec 64))

(assert (=> d!41791 (= lt!202476 (bvmul lt!202474 lt!202473))))

(assert (=> d!41791 (or (= lt!202474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202473 (bvsdiv (bvmul lt!202474 lt!202473) lt!202474)))))

(assert (=> d!41791 (= lt!202473 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41791 (= lt!202474 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5957 lt!202061)))))))

(assert (=> d!41791 (= lt!202472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5877 (_1!5957 lt!202061))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5872 (_1!5957 lt!202061)))))))

(assert (=> d!41791 (invariant!0 (currentBit!5872 (_1!5957 lt!202061)) (currentByte!5877 (_1!5957 lt!202061)) (size!2743 (buf!3104 (_1!5957 lt!202061))))))

(assert (=> d!41791 (= (bitIndex!0 (size!2743 (buf!3104 (_1!5957 lt!202061))) (currentByte!5877 (_1!5957 lt!202061)) (currentBit!5872 (_1!5957 lt!202061))) lt!202472)))

(declare-fun b!131221 () Bool)

(declare-fun res!108837 () Bool)

(assert (=> b!131221 (=> (not res!108837) (not e!86970))))

(assert (=> b!131221 (= res!108837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202472))))

(declare-fun b!131222 () Bool)

(declare-fun lt!202477 () (_ BitVec 64))

(assert (=> b!131222 (= e!86970 (bvsle lt!202472 (bvmul lt!202477 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131222 (or (= lt!202477 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202477 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202477)))))

(assert (=> b!131222 (= lt!202477 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5957 lt!202061)))))))

(assert (= (and d!41791 res!108836) b!131221))

(assert (= (and b!131221 res!108837) b!131222))

(declare-fun m!198031 () Bool)

(assert (=> d!41791 m!198031))

(declare-fun m!198033 () Bool)

(assert (=> d!41791 m!198033))

(assert (=> b!131018 d!41791))

(declare-fun d!41793 () Bool)

(assert (=> d!41793 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5954 lt!202063)))) ((_ sign_extend 32) (currentByte!5877 (_1!5954 lt!202063))) ((_ sign_extend 32) (currentBit!5872 (_1!5954 lt!202063))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5954 lt!202063)))) ((_ sign_extend 32) (currentByte!5877 (_1!5954 lt!202063))) ((_ sign_extend 32) (currentBit!5872 (_1!5954 lt!202063)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10201 () Bool)

(assert (= bs!10201 d!41793))

(declare-fun m!198035 () Bool)

(assert (=> bs!10201 m!198035))

(assert (=> b!131018 d!41793))

(declare-fun d!41795 () Bool)

(declare-fun e!86975 () Bool)

(assert (=> d!41795 e!86975))

(declare-fun res!108849 () Bool)

(assert (=> d!41795 (=> (not res!108849) (not e!86975))))

(declare-fun lt!202497 () tuple2!11312)

(assert (=> d!41795 (= res!108849 (= (size!2743 (buf!3104 thiss!1634)) (size!2743 (buf!3104 (_2!5956 lt!202497)))))))

(declare-fun choose!6 (BitStream!4750 (_ BitVec 8)) tuple2!11312)

(assert (=> d!41795 (= lt!202497 (choose!6 thiss!1634 (select (arr!3366 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!41795 (validate_offset_byte!0 ((_ sign_extend 32) (size!2743 (buf!3104 thiss!1634))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634)))))

(assert (=> d!41795 (= (appendByte!0 thiss!1634 (select (arr!3366 arr!237) from!447)) lt!202497)))

(declare-fun b!131233 () Bool)

(declare-fun res!108848 () Bool)

(assert (=> b!131233 (=> (not res!108848) (not e!86975))))

(declare-fun lt!202496 () (_ BitVec 64))

(declare-fun lt!202498 () (_ BitVec 64))

(assert (=> b!131233 (= res!108848 (= (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202497))) (currentByte!5877 (_2!5956 lt!202497)) (currentBit!5872 (_2!5956 lt!202497))) (bvadd lt!202498 lt!202496)))))

(assert (=> b!131233 (or (not (= (bvand lt!202498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202496 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!202498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!202498 lt!202496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131233 (= lt!202496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!131233 (= lt!202498 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(declare-fun b!131234 () Bool)

(declare-fun res!108850 () Bool)

(assert (=> b!131234 (=> (not res!108850) (not e!86975))))

(assert (=> b!131234 (= res!108850 (isPrefixOf!0 thiss!1634 (_2!5956 lt!202497)))))

(declare-fun lt!202499 () tuple2!11314)

(declare-fun lt!202500 () tuple2!11308)

(declare-fun b!131235 () Bool)

(assert (=> b!131235 (= e!86975 (and (= (_2!5957 lt!202499) (select (arr!3366 arr!237) from!447)) (= (_1!5957 lt!202499) (_2!5954 lt!202500))))))

(assert (=> b!131235 (= lt!202499 (readBytePure!0 (_1!5954 lt!202500)))))

(assert (=> b!131235 (= lt!202500 (reader!0 thiss!1634 (_2!5956 lt!202497)))))

(assert (= (and d!41795 res!108849) b!131233))

(assert (= (and b!131233 res!108848) b!131234))

(assert (= (and b!131234 res!108850) b!131235))

(assert (=> d!41795 m!197647))

(declare-fun m!198037 () Bool)

(assert (=> d!41795 m!198037))

(declare-fun m!198039 () Bool)

(assert (=> d!41795 m!198039))

(declare-fun m!198041 () Bool)

(assert (=> b!131233 m!198041))

(assert (=> b!131233 m!197683))

(declare-fun m!198043 () Bool)

(assert (=> b!131234 m!198043))

(declare-fun m!198045 () Bool)

(assert (=> b!131235 m!198045))

(declare-fun m!198047 () Bool)

(assert (=> b!131235 m!198047))

(assert (=> b!131018 d!41795))

(declare-fun d!41797 () Bool)

(assert (=> d!41797 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10202 () Bool)

(assert (= bs!10202 d!41797))

(declare-fun m!198049 () Bool)

(assert (=> bs!10202 m!198049))

(assert (=> b!131018 d!41797))

(declare-fun d!41799 () Bool)

(declare-fun lt!202511 () tuple2!11332)

(assert (=> d!41799 (= lt!202511 (readByte!0 (_1!5954 lt!202063)))))

(assert (=> d!41799 (= (readBytePure!0 (_1!5954 lt!202063)) (tuple2!11315 (_2!5967 lt!202511) (_1!5967 lt!202511)))))

(declare-fun bs!10203 () Bool)

(assert (= bs!10203 d!41799))

(declare-fun m!198051 () Bool)

(assert (=> bs!10203 m!198051))

(assert (=> b!131018 d!41799))

(declare-fun b!131242 () Bool)

(declare-fun e!86980 () Unit!8100)

(declare-fun lt!202530 () Unit!8100)

(assert (=> b!131242 (= e!86980 lt!202530)))

(declare-fun lt!202526 () (_ BitVec 64))

(assert (=> b!131242 (= lt!202526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202523 () (_ BitVec 64))

(assert (=> b!131242 (= lt!202523 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(assert (=> b!131242 (= lt!202530 (arrayBitRangesEqSymmetric!0 (buf!3104 thiss!1634) (buf!3104 (_2!5956 lt!202054)) lt!202526 lt!202523))))

(assert (=> b!131242 (arrayBitRangesEq!0 (buf!3104 (_2!5956 lt!202054)) (buf!3104 thiss!1634) lt!202526 lt!202523)))

(declare-fun b!131243 () Bool)

(declare-fun Unit!8108 () Unit!8100)

(assert (=> b!131243 (= e!86980 Unit!8108)))

(declare-fun b!131244 () Bool)

(declare-fun e!86981 () Bool)

(declare-fun lt!202519 () tuple2!11308)

(declare-fun lt!202521 () (_ BitVec 64))

(declare-fun lt!202516 () (_ BitVec 64))

(assert (=> b!131244 (= e!86981 (= (_1!5954 lt!202519) (withMovedBitIndex!0 (_2!5954 lt!202519) (bvsub lt!202521 lt!202516))))))

(assert (=> b!131244 (or (= (bvand lt!202521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202521 lt!202516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131244 (= lt!202516 (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202054))) (currentByte!5877 (_2!5956 lt!202054)) (currentBit!5872 (_2!5956 lt!202054))))))

(assert (=> b!131244 (= lt!202521 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(declare-fun b!131245 () Bool)

(declare-fun res!108859 () Bool)

(assert (=> b!131245 (=> (not res!108859) (not e!86981))))

(assert (=> b!131245 (= res!108859 (isPrefixOf!0 (_2!5954 lt!202519) (_2!5956 lt!202054)))))

(declare-fun b!131246 () Bool)

(declare-fun res!108858 () Bool)

(assert (=> b!131246 (=> (not res!108858) (not e!86981))))

(assert (=> b!131246 (= res!108858 (isPrefixOf!0 (_1!5954 lt!202519) thiss!1634))))

(declare-fun d!41801 () Bool)

(assert (=> d!41801 e!86981))

(declare-fun res!108857 () Bool)

(assert (=> d!41801 (=> (not res!108857) (not e!86981))))

(assert (=> d!41801 (= res!108857 (isPrefixOf!0 (_1!5954 lt!202519) (_2!5954 lt!202519)))))

(declare-fun lt!202522 () BitStream!4750)

(assert (=> d!41801 (= lt!202519 (tuple2!11309 lt!202522 (_2!5956 lt!202054)))))

(declare-fun lt!202513 () Unit!8100)

(declare-fun lt!202529 () Unit!8100)

(assert (=> d!41801 (= lt!202513 lt!202529)))

(assert (=> d!41801 (isPrefixOf!0 lt!202522 (_2!5956 lt!202054))))

(assert (=> d!41801 (= lt!202529 (lemmaIsPrefixTransitive!0 lt!202522 (_2!5956 lt!202054) (_2!5956 lt!202054)))))

(declare-fun lt!202528 () Unit!8100)

(declare-fun lt!202525 () Unit!8100)

(assert (=> d!41801 (= lt!202528 lt!202525)))

(assert (=> d!41801 (isPrefixOf!0 lt!202522 (_2!5956 lt!202054))))

(assert (=> d!41801 (= lt!202525 (lemmaIsPrefixTransitive!0 lt!202522 thiss!1634 (_2!5956 lt!202054)))))

(declare-fun lt!202520 () Unit!8100)

(assert (=> d!41801 (= lt!202520 e!86980)))

(declare-fun c!7563 () Bool)

(assert (=> d!41801 (= c!7563 (not (= (size!2743 (buf!3104 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!202515 () Unit!8100)

(declare-fun lt!202514 () Unit!8100)

(assert (=> d!41801 (= lt!202515 lt!202514)))

(assert (=> d!41801 (isPrefixOf!0 (_2!5956 lt!202054) (_2!5956 lt!202054))))

(assert (=> d!41801 (= lt!202514 (lemmaIsPrefixRefl!0 (_2!5956 lt!202054)))))

(declare-fun lt!202512 () Unit!8100)

(declare-fun lt!202527 () Unit!8100)

(assert (=> d!41801 (= lt!202512 lt!202527)))

(assert (=> d!41801 (= lt!202527 (lemmaIsPrefixRefl!0 (_2!5956 lt!202054)))))

(declare-fun lt!202531 () Unit!8100)

(declare-fun lt!202524 () Unit!8100)

(assert (=> d!41801 (= lt!202531 lt!202524)))

(assert (=> d!41801 (isPrefixOf!0 lt!202522 lt!202522)))

(assert (=> d!41801 (= lt!202524 (lemmaIsPrefixRefl!0 lt!202522))))

(declare-fun lt!202518 () Unit!8100)

(declare-fun lt!202517 () Unit!8100)

(assert (=> d!41801 (= lt!202518 lt!202517)))

(assert (=> d!41801 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41801 (= lt!202517 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41801 (= lt!202522 (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(assert (=> d!41801 (isPrefixOf!0 thiss!1634 (_2!5956 lt!202054))))

(assert (=> d!41801 (= (reader!0 thiss!1634 (_2!5956 lt!202054)) lt!202519)))

(assert (= (and d!41801 c!7563) b!131242))

(assert (= (and d!41801 (not c!7563)) b!131243))

(assert (= (and d!41801 res!108857) b!131246))

(assert (= (and b!131246 res!108858) b!131245))

(assert (= (and b!131245 res!108859) b!131244))

(declare-fun m!198053 () Bool)

(assert (=> b!131245 m!198053))

(declare-fun m!198055 () Bool)

(assert (=> d!41801 m!198055))

(declare-fun m!198057 () Bool)

(assert (=> d!41801 m!198057))

(assert (=> d!41801 m!198005))

(declare-fun m!198059 () Bool)

(assert (=> d!41801 m!198059))

(declare-fun m!198061 () Bool)

(assert (=> d!41801 m!198061))

(declare-fun m!198063 () Bool)

(assert (=> d!41801 m!198063))

(declare-fun m!198065 () Bool)

(assert (=> d!41801 m!198065))

(declare-fun m!198067 () Bool)

(assert (=> d!41801 m!198067))

(assert (=> d!41801 m!198017))

(declare-fun m!198069 () Bool)

(assert (=> d!41801 m!198069))

(assert (=> d!41801 m!197651))

(declare-fun m!198071 () Bool)

(assert (=> b!131244 m!198071))

(assert (=> b!131244 m!197663))

(assert (=> b!131244 m!197683))

(assert (=> b!131242 m!197683))

(declare-fun m!198073 () Bool)

(assert (=> b!131242 m!198073))

(declare-fun m!198075 () Bool)

(assert (=> b!131242 m!198075))

(declare-fun m!198077 () Bool)

(assert (=> b!131246 m!198077))

(assert (=> b!131018 d!41801))

(declare-fun d!41803 () Bool)

(assert (=> d!41803 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!202543 () Unit!8100)

(declare-fun choose!26 (BitStream!4750 array!6058 (_ BitVec 32) BitStream!4750) Unit!8100)

(assert (=> d!41803 (= lt!202543 (choose!26 thiss!1634 (buf!3104 (_2!5956 lt!202054)) (bvsub to!404 from!447) (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634))))))

(assert (=> d!41803 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3104 (_2!5956 lt!202054)) (bvsub to!404 from!447)) lt!202543)))

(declare-fun bs!10204 () Bool)

(assert (= bs!10204 d!41803))

(assert (=> bs!10204 m!197645))

(declare-fun m!198079 () Bool)

(assert (=> bs!10204 m!198079))

(assert (=> b!131018 d!41803))

(declare-fun d!41805 () Bool)

(declare-fun e!86985 () Bool)

(assert (=> d!41805 e!86985))

(declare-fun res!108865 () Bool)

(assert (=> d!41805 (=> (not res!108865) (not e!86985))))

(declare-fun lt!202548 () (_ BitVec 64))

(declare-fun lt!202544 () (_ BitVec 64))

(declare-fun lt!202547 () (_ BitVec 64))

(assert (=> d!41805 (= res!108865 (= lt!202544 (bvsub lt!202548 lt!202547)))))

(assert (=> d!41805 (or (= (bvand lt!202548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202548 lt!202547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41805 (= lt!202547 (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5957 lt!202048)))) ((_ sign_extend 32) (currentByte!5877 (_1!5957 lt!202048))) ((_ sign_extend 32) (currentBit!5872 (_1!5957 lt!202048)))))))

(declare-fun lt!202546 () (_ BitVec 64))

(declare-fun lt!202545 () (_ BitVec 64))

(assert (=> d!41805 (= lt!202548 (bvmul lt!202546 lt!202545))))

(assert (=> d!41805 (or (= lt!202546 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202545 (bvsdiv (bvmul lt!202546 lt!202545) lt!202546)))))

(assert (=> d!41805 (= lt!202545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41805 (= lt!202546 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5957 lt!202048)))))))

(assert (=> d!41805 (= lt!202544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5877 (_1!5957 lt!202048))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5872 (_1!5957 lt!202048)))))))

(assert (=> d!41805 (invariant!0 (currentBit!5872 (_1!5957 lt!202048)) (currentByte!5877 (_1!5957 lt!202048)) (size!2743 (buf!3104 (_1!5957 lt!202048))))))

(assert (=> d!41805 (= (bitIndex!0 (size!2743 (buf!3104 (_1!5957 lt!202048))) (currentByte!5877 (_1!5957 lt!202048)) (currentBit!5872 (_1!5957 lt!202048))) lt!202544)))

(declare-fun b!131252 () Bool)

(declare-fun res!108866 () Bool)

(assert (=> b!131252 (=> (not res!108866) (not e!86985))))

(assert (=> b!131252 (= res!108866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202544))))

(declare-fun b!131253 () Bool)

(declare-fun lt!202549 () (_ BitVec 64))

(assert (=> b!131253 (= e!86985 (bvsle lt!202544 (bvmul lt!202549 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131253 (or (= lt!202549 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202549 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202549)))))

(assert (=> b!131253 (= lt!202549 ((_ sign_extend 32) (size!2743 (buf!3104 (_1!5957 lt!202048)))))))

(assert (= (and d!41805 res!108865) b!131252))

(assert (= (and b!131252 res!108866) b!131253))

(declare-fun m!198099 () Bool)

(assert (=> d!41805 m!198099))

(declare-fun m!198101 () Bool)

(assert (=> d!41805 m!198101))

(assert (=> b!131018 d!41805))

(declare-fun d!41809 () Bool)

(declare-fun e!86986 () Bool)

(assert (=> d!41809 e!86986))

(declare-fun res!108867 () Bool)

(assert (=> d!41809 (=> (not res!108867) (not e!86986))))

(declare-fun lt!202555 () (_ BitVec 64))

(declare-fun lt!202554 () (_ BitVec 64))

(declare-fun lt!202551 () (_ BitVec 64))

(assert (=> d!41809 (= res!108867 (= lt!202551 (bvsub lt!202555 lt!202554)))))

(assert (=> d!41809 (or (= (bvand lt!202555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202554 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202555 lt!202554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41809 (= lt!202554 (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052)))))))

(declare-fun lt!202553 () (_ BitVec 64))

(declare-fun lt!202552 () (_ BitVec 64))

(assert (=> d!41809 (= lt!202555 (bvmul lt!202553 lt!202552))))

(assert (=> d!41809 (or (= lt!202553 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202552 (bvsdiv (bvmul lt!202553 lt!202552) lt!202553)))))

(assert (=> d!41809 (= lt!202552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41809 (= lt!202553 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))))))

(assert (=> d!41809 (= lt!202551 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052)))))))

(assert (=> d!41809 (invariant!0 (currentBit!5872 (_2!5956 lt!202052)) (currentByte!5877 (_2!5956 lt!202052)) (size!2743 (buf!3104 (_2!5956 lt!202052))))))

(assert (=> d!41809 (= (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))) lt!202551)))

(declare-fun b!131254 () Bool)

(declare-fun res!108868 () Bool)

(assert (=> b!131254 (=> (not res!108868) (not e!86986))))

(assert (=> b!131254 (= res!108868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202551))))

(declare-fun b!131255 () Bool)

(declare-fun lt!202556 () (_ BitVec 64))

(assert (=> b!131255 (= e!86986 (bvsle lt!202551 (bvmul lt!202556 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131255 (or (= lt!202556 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202556 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202556)))))

(assert (=> b!131255 (= lt!202556 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202052)))))))

(assert (= (and d!41809 res!108867) b!131254))

(assert (= (and b!131254 res!108868) b!131255))

(assert (=> d!41809 m!197839))

(declare-fun m!198105 () Bool)

(assert (=> d!41809 m!198105))

(assert (=> b!131016 d!41809))

(declare-fun d!41813 () Bool)

(declare-fun e!86987 () Bool)

(assert (=> d!41813 e!86987))

(declare-fun res!108869 () Bool)

(assert (=> d!41813 (=> (not res!108869) (not e!86987))))

(declare-fun lt!202561 () (_ BitVec 64))

(declare-fun lt!202557 () (_ BitVec 64))

(declare-fun lt!202560 () (_ BitVec 64))

(assert (=> d!41813 (= res!108869 (= lt!202557 (bvsub lt!202561 lt!202560)))))

(assert (=> d!41813 (or (= (bvand lt!202561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202561 lt!202560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41813 (= lt!202560 (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 thiss!1634))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634))))))

(declare-fun lt!202559 () (_ BitVec 64))

(declare-fun lt!202558 () (_ BitVec 64))

(assert (=> d!41813 (= lt!202561 (bvmul lt!202559 lt!202558))))

(assert (=> d!41813 (or (= lt!202559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202558 (bvsdiv (bvmul lt!202559 lt!202558) lt!202559)))))

(assert (=> d!41813 (= lt!202558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41813 (= lt!202559 ((_ sign_extend 32) (size!2743 (buf!3104 thiss!1634))))))

(assert (=> d!41813 (= lt!202557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5877 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5872 thiss!1634))))))

(assert (=> d!41813 (invariant!0 (currentBit!5872 thiss!1634) (currentByte!5877 thiss!1634) (size!2743 (buf!3104 thiss!1634)))))

(assert (=> d!41813 (= (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)) lt!202557)))

(declare-fun b!131256 () Bool)

(declare-fun res!108870 () Bool)

(assert (=> b!131256 (=> (not res!108870) (not e!86987))))

(assert (=> b!131256 (= res!108870 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202557))))

(declare-fun b!131257 () Bool)

(declare-fun lt!202562 () (_ BitVec 64))

(assert (=> b!131257 (= e!86987 (bvsle lt!202557 (bvmul lt!202562 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131257 (or (= lt!202562 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202562 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202562)))))

(assert (=> b!131257 (= lt!202562 ((_ sign_extend 32) (size!2743 (buf!3104 thiss!1634))))))

(assert (= (and d!41813 res!108869) b!131256))

(assert (= (and b!131256 res!108870) b!131257))

(declare-fun m!198107 () Bool)

(assert (=> d!41813 m!198107))

(assert (=> d!41813 m!197673))

(assert (=> b!131016 d!41813))

(declare-fun d!41815 () Bool)

(assert (=> d!41815 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2743 (buf!3104 thiss!1634))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 thiss!1634))) ((_ sign_extend 32) (currentByte!5877 thiss!1634)) ((_ sign_extend 32) (currentBit!5872 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10206 () Bool)

(assert (= bs!10206 d!41815))

(assert (=> bs!10206 m!198107))

(assert (=> b!131006 d!41815))

(declare-fun d!41817 () Bool)

(assert (=> d!41817 (= (array_inv!2532 (buf!3104 thiss!1634)) (bvsge (size!2743 (buf!3104 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!131017 d!41817))

(declare-fun d!41819 () Bool)

(assert (=> d!41819 (= (array_inv!2532 arr!237) (bvsge (size!2743 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25678 d!41819))

(declare-fun d!41821 () Bool)

(assert (=> d!41821 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5872 thiss!1634) (currentByte!5877 thiss!1634) (size!2743 (buf!3104 thiss!1634))))))

(declare-fun bs!10207 () Bool)

(assert (= bs!10207 d!41821))

(assert (=> bs!10207 m!197673))

(assert (=> start!25678 d!41821))

(declare-fun d!41823 () Bool)

(declare-datatypes ((tuple3!492 0))(
  ( (tuple3!493 (_1!5969 Unit!8100) (_2!5969 BitStream!4750) (_3!301 array!6058)) )
))
(declare-fun lt!202573 () tuple3!492)

(declare-fun readByteArrayLoop!0 (BitStream!4750 array!6058 (_ BitVec 32) (_ BitVec 32)) tuple3!492)

(assert (=> d!41823 (= lt!202573 (readByteArrayLoop!0 (_1!5954 lt!202055) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41823 (= (readByteArrayLoopPure!0 (_1!5954 lt!202055) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11311 (_2!5969 lt!202573) (_3!301 lt!202573)))))

(declare-fun bs!10208 () Bool)

(assert (= bs!10208 d!41823))

(declare-fun m!198109 () Bool)

(assert (=> bs!10208 m!198109))

(assert (=> b!131005 d!41823))

(declare-fun d!41825 () Bool)

(assert (=> d!41825 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) lt!202060) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052)))) lt!202060))))

(declare-fun bs!10209 () Bool)

(assert (= bs!10209 d!41825))

(declare-fun m!198119 () Bool)

(assert (=> bs!10209 m!198119))

(assert (=> b!131005 d!41825))

(declare-fun d!41829 () Bool)

(assert (=> d!41829 (validate_offset_bits!1 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202052))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202052))) lt!202060)))

(declare-fun lt!202581 () Unit!8100)

(declare-fun choose!9 (BitStream!4750 array!6058 (_ BitVec 64) BitStream!4750) Unit!8100)

(assert (=> d!41829 (= lt!202581 (choose!9 (_2!5956 lt!202052) (buf!3104 (_2!5956 lt!202054)) lt!202060 (BitStream!4751 (buf!3104 (_2!5956 lt!202054)) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052)))))))

(assert (=> d!41829 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5956 lt!202052) (buf!3104 (_2!5956 lt!202054)) lt!202060) lt!202581)))

(declare-fun bs!10212 () Bool)

(assert (= bs!10212 d!41829))

(assert (=> bs!10212 m!197677))

(declare-fun m!198127 () Bool)

(assert (=> bs!10212 m!198127))

(assert (=> b!131005 d!41829))

(assert (=> b!131005 d!41785))

(declare-fun d!41837 () Bool)

(declare-fun lt!202582 () tuple2!11332)

(assert (=> d!41837 (= lt!202582 (readByte!0 (_1!5954 lt!202058)))))

(assert (=> d!41837 (= (readBytePure!0 (_1!5954 lt!202058)) (tuple2!11315 (_2!5967 lt!202582) (_1!5967 lt!202582)))))

(declare-fun bs!10213 () Bool)

(assert (= bs!10213 d!41837))

(declare-fun m!198129 () Bool)

(assert (=> bs!10213 m!198129))

(assert (=> b!131014 d!41837))

(declare-fun b!131264 () Bool)

(declare-fun e!86993 () Unit!8100)

(declare-fun lt!202603 () Unit!8100)

(assert (=> b!131264 (= e!86993 lt!202603)))

(declare-fun lt!202599 () (_ BitVec 64))

(assert (=> b!131264 (= lt!202599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202596 () (_ BitVec 64))

(assert (=> b!131264 (= lt!202596 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(assert (=> b!131264 (= lt!202603 (arrayBitRangesEqSymmetric!0 (buf!3104 thiss!1634) (buf!3104 (_2!5956 lt!202052)) lt!202599 lt!202596))))

(assert (=> b!131264 (arrayBitRangesEq!0 (buf!3104 (_2!5956 lt!202052)) (buf!3104 thiss!1634) lt!202599 lt!202596)))

(declare-fun b!131265 () Bool)

(declare-fun Unit!8111 () Unit!8100)

(assert (=> b!131265 (= e!86993 Unit!8111)))

(declare-fun b!131266 () Bool)

(declare-fun e!86994 () Bool)

(declare-fun lt!202592 () tuple2!11308)

(declare-fun lt!202594 () (_ BitVec 64))

(declare-fun lt!202589 () (_ BitVec 64))

(assert (=> b!131266 (= e!86994 (= (_1!5954 lt!202592) (withMovedBitIndex!0 (_2!5954 lt!202592) (bvsub lt!202594 lt!202589))))))

(assert (=> b!131266 (or (= (bvand lt!202594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202594 lt!202589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131266 (= lt!202589 (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052))))))

(assert (=> b!131266 (= lt!202594 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(declare-fun b!131267 () Bool)

(declare-fun res!108879 () Bool)

(assert (=> b!131267 (=> (not res!108879) (not e!86994))))

(assert (=> b!131267 (= res!108879 (isPrefixOf!0 (_2!5954 lt!202592) (_2!5956 lt!202052)))))

(declare-fun b!131268 () Bool)

(declare-fun res!108878 () Bool)

(assert (=> b!131268 (=> (not res!108878) (not e!86994))))

(assert (=> b!131268 (= res!108878 (isPrefixOf!0 (_1!5954 lt!202592) thiss!1634))))

(declare-fun d!41839 () Bool)

(assert (=> d!41839 e!86994))

(declare-fun res!108877 () Bool)

(assert (=> d!41839 (=> (not res!108877) (not e!86994))))

(assert (=> d!41839 (= res!108877 (isPrefixOf!0 (_1!5954 lt!202592) (_2!5954 lt!202592)))))

(declare-fun lt!202595 () BitStream!4750)

(assert (=> d!41839 (= lt!202592 (tuple2!11309 lt!202595 (_2!5956 lt!202052)))))

(declare-fun lt!202586 () Unit!8100)

(declare-fun lt!202602 () Unit!8100)

(assert (=> d!41839 (= lt!202586 lt!202602)))

(assert (=> d!41839 (isPrefixOf!0 lt!202595 (_2!5956 lt!202052))))

(assert (=> d!41839 (= lt!202602 (lemmaIsPrefixTransitive!0 lt!202595 (_2!5956 lt!202052) (_2!5956 lt!202052)))))

(declare-fun lt!202601 () Unit!8100)

(declare-fun lt!202598 () Unit!8100)

(assert (=> d!41839 (= lt!202601 lt!202598)))

(assert (=> d!41839 (isPrefixOf!0 lt!202595 (_2!5956 lt!202052))))

(assert (=> d!41839 (= lt!202598 (lemmaIsPrefixTransitive!0 lt!202595 thiss!1634 (_2!5956 lt!202052)))))

(declare-fun lt!202593 () Unit!8100)

(assert (=> d!41839 (= lt!202593 e!86993)))

(declare-fun c!7564 () Bool)

(assert (=> d!41839 (= c!7564 (not (= (size!2743 (buf!3104 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!202588 () Unit!8100)

(declare-fun lt!202587 () Unit!8100)

(assert (=> d!41839 (= lt!202588 lt!202587)))

(assert (=> d!41839 (isPrefixOf!0 (_2!5956 lt!202052) (_2!5956 lt!202052))))

(assert (=> d!41839 (= lt!202587 (lemmaIsPrefixRefl!0 (_2!5956 lt!202052)))))

(declare-fun lt!202585 () Unit!8100)

(declare-fun lt!202600 () Unit!8100)

(assert (=> d!41839 (= lt!202585 lt!202600)))

(assert (=> d!41839 (= lt!202600 (lemmaIsPrefixRefl!0 (_2!5956 lt!202052)))))

(declare-fun lt!202604 () Unit!8100)

(declare-fun lt!202597 () Unit!8100)

(assert (=> d!41839 (= lt!202604 lt!202597)))

(assert (=> d!41839 (isPrefixOf!0 lt!202595 lt!202595)))

(assert (=> d!41839 (= lt!202597 (lemmaIsPrefixRefl!0 lt!202595))))

(declare-fun lt!202591 () Unit!8100)

(declare-fun lt!202590 () Unit!8100)

(assert (=> d!41839 (= lt!202591 lt!202590)))

(assert (=> d!41839 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41839 (= lt!202590 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41839 (= lt!202595 (BitStream!4751 (buf!3104 (_2!5956 lt!202052)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)))))

(assert (=> d!41839 (isPrefixOf!0 thiss!1634 (_2!5956 lt!202052))))

(assert (=> d!41839 (= (reader!0 thiss!1634 (_2!5956 lt!202052)) lt!202592)))

(assert (= (and d!41839 c!7564) b!131264))

(assert (= (and d!41839 (not c!7564)) b!131265))

(assert (= (and d!41839 res!108877) b!131268))

(assert (= (and b!131268 res!108878) b!131267))

(assert (= (and b!131267 res!108879) b!131266))

(declare-fun m!198133 () Bool)

(assert (=> b!131267 m!198133))

(declare-fun m!198135 () Bool)

(assert (=> d!41839 m!198135))

(declare-fun m!198137 () Bool)

(assert (=> d!41839 m!198137))

(assert (=> d!41839 m!198007))

(assert (=> d!41839 m!198059))

(declare-fun m!198139 () Bool)

(assert (=> d!41839 m!198139))

(declare-fun m!198141 () Bool)

(assert (=> d!41839 m!198141))

(declare-fun m!198145 () Bool)

(assert (=> d!41839 m!198145))

(assert (=> d!41839 m!198067))

(assert (=> d!41839 m!198015))

(declare-fun m!198147 () Bool)

(assert (=> d!41839 m!198147))

(assert (=> d!41839 m!197617))

(declare-fun m!198149 () Bool)

(assert (=> b!131266 m!198149))

(assert (=> b!131266 m!197665))

(assert (=> b!131266 m!197683))

(assert (=> b!131264 m!197683))

(declare-fun m!198151 () Bool)

(assert (=> b!131264 m!198151))

(declare-fun m!198153 () Bool)

(assert (=> b!131264 m!198153))

(declare-fun m!198155 () Bool)

(assert (=> b!131268 m!198155))

(assert (=> b!131014 d!41839))

(declare-fun d!41845 () Bool)

(declare-fun e!86997 () Bool)

(assert (=> d!41845 e!86997))

(declare-fun res!108883 () Bool)

(assert (=> d!41845 (=> (not res!108883) (not e!86997))))

(declare-fun lt!202611 () (_ BitVec 64))

(declare-fun lt!202610 () (_ BitVec 64))

(declare-fun lt!202607 () (_ BitVec 64))

(assert (=> d!41845 (= res!108883 (= lt!202607 (bvsub lt!202611 lt!202610)))))

(assert (=> d!41845 (or (= (bvand lt!202611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202611 lt!202610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41845 (= lt!202610 (remainingBits!0 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))) ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202054))) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202054)))))))

(declare-fun lt!202609 () (_ BitVec 64))

(declare-fun lt!202608 () (_ BitVec 64))

(assert (=> d!41845 (= lt!202611 (bvmul lt!202609 lt!202608))))

(assert (=> d!41845 (or (= lt!202609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202608 (bvsdiv (bvmul lt!202609 lt!202608) lt!202609)))))

(assert (=> d!41845 (= lt!202608 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41845 (= lt!202609 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))))))

(assert (=> d!41845 (= lt!202607 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5877 (_2!5956 lt!202054))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5872 (_2!5956 lt!202054)))))))

(assert (=> d!41845 (invariant!0 (currentBit!5872 (_2!5956 lt!202054)) (currentByte!5877 (_2!5956 lt!202054)) (size!2743 (buf!3104 (_2!5956 lt!202054))))))

(assert (=> d!41845 (= (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202054))) (currentByte!5877 (_2!5956 lt!202054)) (currentBit!5872 (_2!5956 lt!202054))) lt!202607)))

(declare-fun b!131272 () Bool)

(declare-fun res!108884 () Bool)

(assert (=> b!131272 (=> (not res!108884) (not e!86997))))

(assert (=> b!131272 (= res!108884 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202607))))

(declare-fun b!131273 () Bool)

(declare-fun lt!202612 () (_ BitVec 64))

(assert (=> b!131273 (= e!86997 (bvsle lt!202607 (bvmul lt!202612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131273 (or (= lt!202612 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202612 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202612)))))

(assert (=> b!131273 (= lt!202612 ((_ sign_extend 32) (size!2743 (buf!3104 (_2!5956 lt!202054)))))))

(assert (= (and d!41845 res!108883) b!131272))

(assert (= (and b!131272 res!108884) b!131273))

(declare-fun m!198159 () Bool)

(assert (=> d!41845 m!198159))

(declare-fun m!198161 () Bool)

(assert (=> d!41845 m!198161))

(assert (=> b!131012 d!41845))

(assert (=> b!131012 d!41809))

(declare-fun d!41849 () Bool)

(declare-fun res!108886 () Bool)

(declare-fun e!86999 () Bool)

(assert (=> d!41849 (=> (not res!108886) (not e!86999))))

(assert (=> d!41849 (= res!108886 (= (size!2743 (buf!3104 thiss!1634)) (size!2743 (buf!3104 (_2!5956 lt!202052)))))))

(assert (=> d!41849 (= (isPrefixOf!0 thiss!1634 (_2!5956 lt!202052)) e!86999)))

(declare-fun b!131274 () Bool)

(declare-fun res!108885 () Bool)

(assert (=> b!131274 (=> (not res!108885) (not e!86999))))

(assert (=> b!131274 (= res!108885 (bvsle (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634)) (bitIndex!0 (size!2743 (buf!3104 (_2!5956 lt!202052))) (currentByte!5877 (_2!5956 lt!202052)) (currentBit!5872 (_2!5956 lt!202052)))))))

(declare-fun b!131275 () Bool)

(declare-fun e!86998 () Bool)

(assert (=> b!131275 (= e!86999 e!86998)))

(declare-fun res!108887 () Bool)

(assert (=> b!131275 (=> res!108887 e!86998)))

(assert (=> b!131275 (= res!108887 (= (size!2743 (buf!3104 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!131276 () Bool)

(assert (=> b!131276 (= e!86998 (arrayBitRangesEq!0 (buf!3104 thiss!1634) (buf!3104 (_2!5956 lt!202052)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2743 (buf!3104 thiss!1634)) (currentByte!5877 thiss!1634) (currentBit!5872 thiss!1634))))))

(assert (= (and d!41849 res!108886) b!131274))

(assert (= (and b!131274 res!108885) b!131275))

(assert (= (and b!131275 (not res!108887)) b!131276))

(assert (=> b!131274 m!197683))

(assert (=> b!131274 m!197665))

(assert (=> b!131276 m!197683))

(assert (=> b!131276 m!197683))

(declare-fun m!198163 () Bool)

(assert (=> b!131276 m!198163))

(assert (=> b!131013 d!41849))

(declare-fun d!41851 () Bool)

(declare-fun res!108892 () Bool)

(declare-fun e!87004 () Bool)

(assert (=> d!41851 (=> res!108892 e!87004)))

(assert (=> d!41851 (= res!108892 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41851 (= (arrayRangesEq!146 arr!237 (_2!5955 lt!202049) #b00000000000000000000000000000000 to!404) e!87004)))

(declare-fun b!131281 () Bool)

(declare-fun e!87005 () Bool)

(assert (=> b!131281 (= e!87004 e!87005)))

(declare-fun res!108893 () Bool)

(assert (=> b!131281 (=> (not res!108893) (not e!87005))))

(assert (=> b!131281 (= res!108893 (= (select (arr!3366 arr!237) #b00000000000000000000000000000000) (select (arr!3366 (_2!5955 lt!202049)) #b00000000000000000000000000000000)))))

(declare-fun b!131282 () Bool)

(assert (=> b!131282 (= e!87005 (arrayRangesEq!146 arr!237 (_2!5955 lt!202049) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41851 (not res!108892)) b!131281))

(assert (= (and b!131281 res!108893) b!131282))

(declare-fun m!198165 () Bool)

(assert (=> b!131281 m!198165))

(declare-fun m!198167 () Bool)

(assert (=> b!131281 m!198167))

(declare-fun m!198169 () Bool)

(assert (=> b!131282 m!198169))

(assert (=> b!131011 d!41851))

(push 1)

(assert (not b!131216))

(assert (not d!41735))

(assert (not d!41803))

(assert (not d!41809))

(assert (not d!41785))

(assert (not d!41805))

(assert (not b!131244))

(assert (not d!41795))

(assert (not d!41825))

(assert (not b!131233))

(assert (not d!41789))

(assert (not d!41823))

(assert (not b!131111))

(assert (not d!41793))

(assert (not b!131109))

(assert (not b!131245))

(assert (not b!131267))

(assert (not d!41797))

(assert (not b!131235))

(assert (not d!41801))

(assert (not b!131282))

(assert (not b!131215))

(assert (not b!131234))

(assert (not d!41767))

(assert (not b!131212))

(assert (not b!131114))

(assert (not b!131246))

(assert (not b!131214))

(assert (not d!41737))

(assert (not b!131242))

(assert (not d!41845))

(assert (not b!131172))

(assert (not b!131276))

(assert (not b!131264))

(assert (not b!131170))

(assert (not b!131173))

(assert (not d!41813))

(assert (not d!41815))

(assert (not d!41739))

(assert (not b!131171))

(assert (not b!131192))

(assert (not b!131268))

(assert (not b!131112))

(assert (not d!41829))

(assert (not d!41799))

(assert (not b!131174))

(assert (not b!131266))

(assert (not d!41821))

(assert (not d!41780))

(assert (not b!131274))

(assert (not d!41839))

(assert (not d!41837))

(assert (not d!41729))

(assert (not d!41791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

