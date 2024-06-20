; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28002 () Bool)

(assert start!28002)

(declare-fun b!144845 () Bool)

(declare-fun e!96546 () Bool)

(assert (=> b!144845 (= e!96546 (not true))))

(declare-fun e!96543 () Bool)

(assert (=> b!144845 e!96543))

(declare-fun res!121069 () Bool)

(assert (=> b!144845 (=> (not res!121069) (not e!96543))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6594 0))(
  ( (array!6595 (arr!3718 (Array (_ BitVec 32) (_ BitVec 8))) (size!2985 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5228 0))(
  ( (BitStream!5229 (buf!3424 array!6594) (currentByte!6314 (_ BitVec 32)) (currentBit!6309 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9043 0))(
  ( (Unit!9044) )
))
(declare-datatypes ((tuple2!12922 0))(
  ( (tuple2!12923 (_1!6807 Unit!9043) (_2!6807 BitStream!5228)) )
))
(declare-fun lt!224514 () tuple2!12922)

(declare-fun thiss!1634 () BitStream!5228)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144845 (= res!121069 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2985 (buf!3424 (_2!6807 lt!224514)))) ((_ sign_extend 32) (currentByte!6314 thiss!1634)) ((_ sign_extend 32) (currentBit!6309 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224515 () Unit!9043)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5228 array!6594 (_ BitVec 32)) Unit!9043)

(assert (=> b!144845 (= lt!224515 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3424 (_2!6807 lt!224514)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12924 0))(
  ( (tuple2!12925 (_1!6808 BitStream!5228) (_2!6808 BitStream!5228)) )
))
(declare-fun lt!224507 () tuple2!12924)

(declare-fun arr!237 () array!6594)

(declare-datatypes ((tuple2!12926 0))(
  ( (tuple2!12927 (_1!6809 BitStream!5228) (_2!6809 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5228) tuple2!12926)

(assert (=> b!144845 (= (_2!6809 (readBytePure!0 (_1!6808 lt!224507))) (select (arr!3718 arr!237) from!447))))

(declare-fun lt!224522 () tuple2!12924)

(declare-fun lt!224523 () tuple2!12922)

(declare-fun reader!0 (BitStream!5228 BitStream!5228) tuple2!12924)

(assert (=> b!144845 (= lt!224522 (reader!0 (_2!6807 lt!224523) (_2!6807 lt!224514)))))

(assert (=> b!144845 (= lt!224507 (reader!0 thiss!1634 (_2!6807 lt!224514)))))

(declare-fun e!96538 () Bool)

(assert (=> b!144845 e!96538))

(declare-fun res!121070 () Bool)

(assert (=> b!144845 (=> (not res!121070) (not e!96538))))

(declare-fun lt!224511 () tuple2!12926)

(declare-fun lt!224512 () tuple2!12926)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144845 (= res!121070 (= (bitIndex!0 (size!2985 (buf!3424 (_1!6809 lt!224511))) (currentByte!6314 (_1!6809 lt!224511)) (currentBit!6309 (_1!6809 lt!224511))) (bitIndex!0 (size!2985 (buf!3424 (_1!6809 lt!224512))) (currentByte!6314 (_1!6809 lt!224512)) (currentBit!6309 (_1!6809 lt!224512)))))))

(declare-fun lt!224508 () Unit!9043)

(declare-fun lt!224510 () BitStream!5228)

(declare-fun readBytePrefixLemma!0 (BitStream!5228 BitStream!5228) Unit!9043)

(assert (=> b!144845 (= lt!224508 (readBytePrefixLemma!0 lt!224510 (_2!6807 lt!224514)))))

(assert (=> b!144845 (= lt!224512 (readBytePure!0 (BitStream!5229 (buf!3424 (_2!6807 lt!224514)) (currentByte!6314 thiss!1634) (currentBit!6309 thiss!1634))))))

(assert (=> b!144845 (= lt!224511 (readBytePure!0 lt!224510))))

(assert (=> b!144845 (= lt!224510 (BitStream!5229 (buf!3424 (_2!6807 lt!224523)) (currentByte!6314 thiss!1634) (currentBit!6309 thiss!1634)))))

(declare-fun e!96544 () Bool)

(assert (=> b!144845 e!96544))

(declare-fun res!121068 () Bool)

(assert (=> b!144845 (=> (not res!121068) (not e!96544))))

(declare-fun isPrefixOf!0 (BitStream!5228 BitStream!5228) Bool)

(assert (=> b!144845 (= res!121068 (isPrefixOf!0 thiss!1634 (_2!6807 lt!224514)))))

(declare-fun lt!224519 () Unit!9043)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5228 BitStream!5228 BitStream!5228) Unit!9043)

(assert (=> b!144845 (= lt!224519 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6807 lt!224523) (_2!6807 lt!224514)))))

(declare-fun e!96541 () Bool)

(assert (=> b!144845 e!96541))

(declare-fun res!121062 () Bool)

(assert (=> b!144845 (=> (not res!121062) (not e!96541))))

(assert (=> b!144845 (= res!121062 (= (size!2985 (buf!3424 (_2!6807 lt!224523))) (size!2985 (buf!3424 (_2!6807 lt!224514)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5228 array!6594 (_ BitVec 32) (_ BitVec 32)) tuple2!12922)

(assert (=> b!144845 (= lt!224514 (appendByteArrayLoop!0 (_2!6807 lt!224523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144845 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2985 (buf!3424 (_2!6807 lt!224523)))) ((_ sign_extend 32) (currentByte!6314 (_2!6807 lt!224523))) ((_ sign_extend 32) (currentBit!6309 (_2!6807 lt!224523))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224516 () Unit!9043)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5228 BitStream!5228 (_ BitVec 64) (_ BitVec 32)) Unit!9043)

(assert (=> b!144845 (= lt!224516 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6807 lt!224523) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!96542 () Bool)

(assert (=> b!144845 e!96542))

(declare-fun res!121066 () Bool)

(assert (=> b!144845 (=> (not res!121066) (not e!96542))))

(assert (=> b!144845 (= res!121066 (= (size!2985 (buf!3424 thiss!1634)) (size!2985 (buf!3424 (_2!6807 lt!224523)))))))

(declare-fun appendByte!0 (BitStream!5228 (_ BitVec 8)) tuple2!12922)

(assert (=> b!144845 (= lt!224523 (appendByte!0 thiss!1634 (select (arr!3718 arr!237) from!447)))))

(declare-fun res!121067 () Bool)

(assert (=> start!28002 (=> (not res!121067) (not e!96546))))

(assert (=> start!28002 (= res!121067 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2985 arr!237))))))

(assert (=> start!28002 e!96546))

(assert (=> start!28002 true))

(declare-fun array_inv!2774 (array!6594) Bool)

(assert (=> start!28002 (array_inv!2774 arr!237)))

(declare-fun e!96545 () Bool)

(declare-fun inv!12 (BitStream!5228) Bool)

(assert (=> start!28002 (and (inv!12 thiss!1634) e!96545)))

(declare-fun b!144846 () Bool)

(declare-fun res!121059 () Bool)

(assert (=> b!144846 (=> (not res!121059) (not e!96546))))

(assert (=> b!144846 (= res!121059 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2985 (buf!3424 thiss!1634))) ((_ sign_extend 32) (currentByte!6314 thiss!1634)) ((_ sign_extend 32) (currentBit!6309 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12928 0))(
  ( (tuple2!12929 (_1!6810 BitStream!5228) (_2!6810 array!6594)) )
))
(declare-fun lt!224509 () tuple2!12928)

(declare-fun e!96539 () Bool)

(declare-fun b!144847 () Bool)

(declare-fun arrayRangesEq!301 (array!6594 array!6594 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144847 (= e!96539 (not (arrayRangesEq!301 arr!237 (_2!6810 lt!224509) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144848 () Bool)

(declare-fun e!96540 () Bool)

(assert (=> b!144848 (= e!96540 (not e!96539))))

(declare-fun res!121063 () Bool)

(assert (=> b!144848 (=> res!121063 e!96539)))

(declare-fun lt!224513 () tuple2!12924)

(assert (=> b!144848 (= res!121063 (or (not (= (size!2985 (_2!6810 lt!224509)) (size!2985 arr!237))) (not (= (_1!6810 lt!224509) (_2!6808 lt!224513)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5228 array!6594 (_ BitVec 32) (_ BitVec 32)) tuple2!12928)

(assert (=> b!144848 (= lt!224509 (readByteArrayLoopPure!0 (_1!6808 lt!224513) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224521 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144848 (validate_offset_bits!1 ((_ sign_extend 32) (size!2985 (buf!3424 (_2!6807 lt!224514)))) ((_ sign_extend 32) (currentByte!6314 (_2!6807 lt!224523))) ((_ sign_extend 32) (currentBit!6309 (_2!6807 lt!224523))) lt!224521)))

(declare-fun lt!224517 () Unit!9043)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5228 array!6594 (_ BitVec 64)) Unit!9043)

(assert (=> b!144848 (= lt!224517 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6807 lt!224523) (buf!3424 (_2!6807 lt!224514)) lt!224521))))

(assert (=> b!144848 (= lt!224513 (reader!0 (_2!6807 lt!224523) (_2!6807 lt!224514)))))

(declare-fun b!144849 () Bool)

(declare-fun res!121071 () Bool)

(assert (=> b!144849 (=> (not res!121071) (not e!96546))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144849 (= res!121071 (invariant!0 (currentBit!6309 thiss!1634) (currentByte!6314 thiss!1634) (size!2985 (buf!3424 thiss!1634))))))

(declare-fun b!144850 () Bool)

(assert (=> b!144850 (= e!96543 (= (_1!6810 (readByteArrayLoopPure!0 (_1!6808 lt!224507) arr!237 from!447 to!404)) (_2!6808 lt!224507)))))

(declare-fun b!144851 () Bool)

(declare-fun res!121061 () Bool)

(assert (=> b!144851 (=> (not res!121061) (not e!96546))))

(assert (=> b!144851 (= res!121061 (bvslt from!447 to!404))))

(declare-fun lt!224518 () tuple2!12926)

(declare-fun b!144852 () Bool)

(declare-fun lt!224520 () tuple2!12924)

(assert (=> b!144852 (= e!96542 (and (= (_2!6809 lt!224518) (select (arr!3718 arr!237) from!447)) (= (_1!6809 lt!224518) (_2!6808 lt!224520))))))

(assert (=> b!144852 (= lt!224518 (readBytePure!0 (_1!6808 lt!224520)))))

(assert (=> b!144852 (= lt!224520 (reader!0 thiss!1634 (_2!6807 lt!224523)))))

(declare-fun b!144853 () Bool)

(declare-fun res!121072 () Bool)

(assert (=> b!144853 (=> (not res!121072) (not e!96542))))

(assert (=> b!144853 (= res!121072 (isPrefixOf!0 thiss!1634 (_2!6807 lt!224523)))))

(declare-fun b!144854 () Bool)

(declare-fun res!121064 () Bool)

(assert (=> b!144854 (=> (not res!121064) (not e!96542))))

(assert (=> b!144854 (= res!121064 (= (bitIndex!0 (size!2985 (buf!3424 (_2!6807 lt!224523))) (currentByte!6314 (_2!6807 lt!224523)) (currentBit!6309 (_2!6807 lt!224523))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2985 (buf!3424 thiss!1634)) (currentByte!6314 thiss!1634) (currentBit!6309 thiss!1634)))))))

(declare-fun b!144855 () Bool)

(assert (=> b!144855 (= e!96541 e!96540)))

(declare-fun res!121060 () Bool)

(assert (=> b!144855 (=> (not res!121060) (not e!96540))))

(assert (=> b!144855 (= res!121060 (= (bitIndex!0 (size!2985 (buf!3424 (_2!6807 lt!224514))) (currentByte!6314 (_2!6807 lt!224514)) (currentBit!6309 (_2!6807 lt!224514))) (bvadd (bitIndex!0 (size!2985 (buf!3424 (_2!6807 lt!224523))) (currentByte!6314 (_2!6807 lt!224523)) (currentBit!6309 (_2!6807 lt!224523))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224521))))))

(assert (=> b!144855 (= lt!224521 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144856 () Bool)

(declare-fun res!121065 () Bool)

(assert (=> b!144856 (=> (not res!121065) (not e!96540))))

(assert (=> b!144856 (= res!121065 (isPrefixOf!0 (_2!6807 lt!224523) (_2!6807 lt!224514)))))

(declare-fun b!144857 () Bool)

(assert (=> b!144857 (= e!96545 (array_inv!2774 (buf!3424 thiss!1634)))))

(declare-fun b!144858 () Bool)

(assert (=> b!144858 (= e!96544 (invariant!0 (currentBit!6309 thiss!1634) (currentByte!6314 thiss!1634) (size!2985 (buf!3424 (_2!6807 lt!224523)))))))

(declare-fun b!144859 () Bool)

(assert (=> b!144859 (= e!96538 (= (_2!6809 lt!224511) (_2!6809 lt!224512)))))

(assert (= (and start!28002 res!121067) b!144846))

(assert (= (and b!144846 res!121059) b!144851))

(assert (= (and b!144851 res!121061) b!144849))

(assert (= (and b!144849 res!121071) b!144845))

(assert (= (and b!144845 res!121066) b!144854))

(assert (= (and b!144854 res!121064) b!144853))

(assert (= (and b!144853 res!121072) b!144852))

(assert (= (and b!144845 res!121062) b!144855))

(assert (= (and b!144855 res!121060) b!144856))

(assert (= (and b!144856 res!121065) b!144848))

(assert (= (and b!144848 (not res!121063)) b!144847))

(assert (= (and b!144845 res!121068) b!144858))

(assert (= (and b!144845 res!121070) b!144859))

(assert (= (and b!144845 res!121069) b!144850))

(assert (= start!28002 b!144857))

(declare-fun m!222781 () Bool)

(assert (=> b!144850 m!222781))

(declare-fun m!222783 () Bool)

(assert (=> b!144856 m!222783))

(declare-fun m!222785 () Bool)

(assert (=> b!144848 m!222785))

(declare-fun m!222787 () Bool)

(assert (=> b!144848 m!222787))

(declare-fun m!222789 () Bool)

(assert (=> b!144848 m!222789))

(declare-fun m!222791 () Bool)

(assert (=> b!144848 m!222791))

(declare-fun m!222793 () Bool)

(assert (=> b!144847 m!222793))

(declare-fun m!222795 () Bool)

(assert (=> b!144854 m!222795))

(declare-fun m!222797 () Bool)

(assert (=> b!144854 m!222797))

(declare-fun m!222799 () Bool)

(assert (=> b!144855 m!222799))

(assert (=> b!144855 m!222795))

(declare-fun m!222801 () Bool)

(assert (=> b!144857 m!222801))

(declare-fun m!222803 () Bool)

(assert (=> b!144852 m!222803))

(declare-fun m!222805 () Bool)

(assert (=> b!144852 m!222805))

(declare-fun m!222807 () Bool)

(assert (=> b!144852 m!222807))

(declare-fun m!222809 () Bool)

(assert (=> b!144845 m!222809))

(declare-fun m!222811 () Bool)

(assert (=> b!144845 m!222811))

(declare-fun m!222813 () Bool)

(assert (=> b!144845 m!222813))

(declare-fun m!222815 () Bool)

(assert (=> b!144845 m!222815))

(declare-fun m!222817 () Bool)

(assert (=> b!144845 m!222817))

(declare-fun m!222819 () Bool)

(assert (=> b!144845 m!222819))

(declare-fun m!222821 () Bool)

(assert (=> b!144845 m!222821))

(declare-fun m!222823 () Bool)

(assert (=> b!144845 m!222823))

(assert (=> b!144845 m!222791))

(assert (=> b!144845 m!222803))

(declare-fun m!222825 () Bool)

(assert (=> b!144845 m!222825))

(declare-fun m!222827 () Bool)

(assert (=> b!144845 m!222827))

(declare-fun m!222829 () Bool)

(assert (=> b!144845 m!222829))

(declare-fun m!222831 () Bool)

(assert (=> b!144845 m!222831))

(declare-fun m!222833 () Bool)

(assert (=> b!144845 m!222833))

(declare-fun m!222835 () Bool)

(assert (=> b!144845 m!222835))

(declare-fun m!222837 () Bool)

(assert (=> b!144845 m!222837))

(assert (=> b!144845 m!222803))

(declare-fun m!222839 () Bool)

(assert (=> b!144858 m!222839))

(declare-fun m!222841 () Bool)

(assert (=> b!144849 m!222841))

(declare-fun m!222843 () Bool)

(assert (=> start!28002 m!222843))

(declare-fun m!222845 () Bool)

(assert (=> start!28002 m!222845))

(declare-fun m!222847 () Bool)

(assert (=> b!144846 m!222847))

(declare-fun m!222849 () Bool)

(assert (=> b!144853 m!222849))

(push 1)

(assert (not b!144850))

(assert (not b!144848))

(assert (not b!144845))

(assert (not b!144855))

(assert (not start!28002))

(assert (not b!144857))

(assert (not b!144852))

(assert (not b!144847))

(assert (not b!144856))

(assert (not b!144853))

(assert (not b!144858))

(assert (not b!144854))

(assert (not b!144846))

(assert (not b!144849))

(check-sat)

