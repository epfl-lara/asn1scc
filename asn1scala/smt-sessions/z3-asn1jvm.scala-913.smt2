; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25662 () Bool)

(assert start!25662)

(declare-fun b!130669 () Bool)

(declare-fun e!86600 () Bool)

(declare-fun e!86603 () Bool)

(assert (=> b!130669 (= e!86600 e!86603)))

(declare-fun res!108342 () Bool)

(assert (=> b!130669 (=> (not res!108342) (not e!86603))))

(declare-datatypes ((array!6042 0))(
  ( (array!6043 (arr!3358 (Array (_ BitVec 32) (_ BitVec 8))) (size!2735 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4734 0))(
  ( (BitStream!4735 (buf!3096 array!6042) (currentByte!5869 (_ BitVec 32)) (currentBit!5864 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8084 0))(
  ( (Unit!8085) )
))
(declare-datatypes ((tuple2!11244 0))(
  ( (tuple2!11245 (_1!5922 Unit!8084) (_2!5922 BitStream!4734)) )
))
(declare-fun lt!201668 () tuple2!11244)

(declare-fun lt!201658 () (_ BitVec 64))

(declare-fun lt!201666 () tuple2!11244)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130669 (= res!108342 (= (bitIndex!0 (size!2735 (buf!3096 (_2!5922 lt!201668))) (currentByte!5869 (_2!5922 lt!201668)) (currentBit!5864 (_2!5922 lt!201668))) (bvadd (bitIndex!0 (size!2735 (buf!3096 (_2!5922 lt!201666))) (currentByte!5869 (_2!5922 lt!201666)) (currentBit!5864 (_2!5922 lt!201666))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201658))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!130669 (= lt!201658 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun arr!237 () array!6042)

(declare-fun b!130670 () Bool)

(declare-fun e!86597 () Bool)

(declare-datatypes ((tuple2!11246 0))(
  ( (tuple2!11247 (_1!5923 BitStream!4734) (_2!5923 array!6042)) )
))
(declare-fun lt!201656 () tuple2!11246)

(declare-fun arrayRangesEq!138 (array!6042 array!6042 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130670 (= e!86597 (not (arrayRangesEq!138 arr!237 (_2!5923 lt!201656) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130671 () Bool)

(declare-fun e!86598 () Bool)

(declare-fun thiss!1634 () BitStream!4734)

(declare-fun array_inv!2524 (array!6042) Bool)

(assert (=> b!130671 (= e!86598 (array_inv!2524 (buf!3096 thiss!1634)))))

(declare-fun b!130672 () Bool)

(declare-fun e!86599 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130672 (= e!86599 (invariant!0 (currentBit!5864 thiss!1634) (currentByte!5869 thiss!1634) (size!2735 (buf!3096 (_2!5922 lt!201666)))))))

(declare-fun b!130673 () Bool)

(declare-fun res!108331 () Bool)

(declare-fun e!86594 () Bool)

(assert (=> b!130673 (=> (not res!108331) (not e!86594))))

(assert (=> b!130673 (= res!108331 (invariant!0 (currentBit!5864 thiss!1634) (currentByte!5869 thiss!1634) (size!2735 (buf!3096 thiss!1634))))))

(declare-fun b!130674 () Bool)

(declare-fun res!108334 () Bool)

(assert (=> b!130674 (=> (not res!108334) (not e!86603))))

(declare-fun isPrefixOf!0 (BitStream!4734 BitStream!4734) Bool)

(assert (=> b!130674 (= res!108334 (isPrefixOf!0 (_2!5922 lt!201666) (_2!5922 lt!201668)))))

(declare-fun res!108337 () Bool)

(assert (=> start!25662 (=> (not res!108337) (not e!86594))))

(assert (=> start!25662 (= res!108337 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2735 arr!237))))))

(assert (=> start!25662 e!86594))

(assert (=> start!25662 true))

(assert (=> start!25662 (array_inv!2524 arr!237)))

(declare-fun inv!12 (BitStream!4734) Bool)

(assert (=> start!25662 (and (inv!12 thiss!1634) e!86598)))

(declare-fun b!130675 () Bool)

(assert (=> b!130675 (= e!86594 (not true))))

(declare-datatypes ((tuple2!11248 0))(
  ( (tuple2!11249 (_1!5924 BitStream!4734) (_2!5924 BitStream!4734)) )
))
(declare-fun lt!201662 () tuple2!11248)

(declare-datatypes ((tuple2!11250 0))(
  ( (tuple2!11251 (_1!5925 BitStream!4734) (_2!5925 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4734) tuple2!11250)

(assert (=> b!130675 (= (_2!5925 (readBytePure!0 (_1!5924 lt!201662))) (select (arr!3358 arr!237) from!447))))

(declare-fun lt!201659 () tuple2!11248)

(declare-fun reader!0 (BitStream!4734 BitStream!4734) tuple2!11248)

(assert (=> b!130675 (= lt!201659 (reader!0 (_2!5922 lt!201666) (_2!5922 lt!201668)))))

(assert (=> b!130675 (= lt!201662 (reader!0 thiss!1634 (_2!5922 lt!201668)))))

(declare-fun e!86595 () Bool)

(assert (=> b!130675 e!86595))

(declare-fun res!108339 () Bool)

(assert (=> b!130675 (=> (not res!108339) (not e!86595))))

(declare-fun lt!201661 () tuple2!11250)

(declare-fun lt!201663 () tuple2!11250)

(assert (=> b!130675 (= res!108339 (= (bitIndex!0 (size!2735 (buf!3096 (_1!5925 lt!201661))) (currentByte!5869 (_1!5925 lt!201661)) (currentBit!5864 (_1!5925 lt!201661))) (bitIndex!0 (size!2735 (buf!3096 (_1!5925 lt!201663))) (currentByte!5869 (_1!5925 lt!201663)) (currentBit!5864 (_1!5925 lt!201663)))))))

(declare-fun lt!201657 () Unit!8084)

(declare-fun lt!201667 () BitStream!4734)

(declare-fun readBytePrefixLemma!0 (BitStream!4734 BitStream!4734) Unit!8084)

(assert (=> b!130675 (= lt!201657 (readBytePrefixLemma!0 lt!201667 (_2!5922 lt!201668)))))

(assert (=> b!130675 (= lt!201663 (readBytePure!0 (BitStream!4735 (buf!3096 (_2!5922 lt!201668)) (currentByte!5869 thiss!1634) (currentBit!5864 thiss!1634))))))

(assert (=> b!130675 (= lt!201661 (readBytePure!0 lt!201667))))

(assert (=> b!130675 (= lt!201667 (BitStream!4735 (buf!3096 (_2!5922 lt!201666)) (currentByte!5869 thiss!1634) (currentBit!5864 thiss!1634)))))

(assert (=> b!130675 e!86599))

(declare-fun res!108332 () Bool)

(assert (=> b!130675 (=> (not res!108332) (not e!86599))))

(assert (=> b!130675 (= res!108332 (isPrefixOf!0 thiss!1634 (_2!5922 lt!201668)))))

(declare-fun lt!201664 () Unit!8084)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4734 BitStream!4734 BitStream!4734) Unit!8084)

(assert (=> b!130675 (= lt!201664 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5922 lt!201666) (_2!5922 lt!201668)))))

(assert (=> b!130675 e!86600))

(declare-fun res!108340 () Bool)

(assert (=> b!130675 (=> (not res!108340) (not e!86600))))

(assert (=> b!130675 (= res!108340 (= (size!2735 (buf!3096 (_2!5922 lt!201666))) (size!2735 (buf!3096 (_2!5922 lt!201668)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4734 array!6042 (_ BitVec 32) (_ BitVec 32)) tuple2!11244)

(assert (=> b!130675 (= lt!201668 (appendByteArrayLoop!0 (_2!5922 lt!201666) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130675 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2735 (buf!3096 (_2!5922 lt!201666)))) ((_ sign_extend 32) (currentByte!5869 (_2!5922 lt!201666))) ((_ sign_extend 32) (currentBit!5864 (_2!5922 lt!201666))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201655 () Unit!8084)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4734 BitStream!4734 (_ BitVec 64) (_ BitVec 32)) Unit!8084)

(assert (=> b!130675 (= lt!201655 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5922 lt!201666) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86602 () Bool)

(assert (=> b!130675 e!86602))

(declare-fun res!108333 () Bool)

(assert (=> b!130675 (=> (not res!108333) (not e!86602))))

(assert (=> b!130675 (= res!108333 (= (size!2735 (buf!3096 thiss!1634)) (size!2735 (buf!3096 (_2!5922 lt!201666)))))))

(declare-fun appendByte!0 (BitStream!4734 (_ BitVec 8)) tuple2!11244)

(assert (=> b!130675 (= lt!201666 (appendByte!0 thiss!1634 (select (arr!3358 arr!237) from!447)))))

(declare-fun b!130676 () Bool)

(declare-fun res!108338 () Bool)

(assert (=> b!130676 (=> (not res!108338) (not e!86602))))

(assert (=> b!130676 (= res!108338 (= (bitIndex!0 (size!2735 (buf!3096 (_2!5922 lt!201666))) (currentByte!5869 (_2!5922 lt!201666)) (currentBit!5864 (_2!5922 lt!201666))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2735 (buf!3096 thiss!1634)) (currentByte!5869 thiss!1634) (currentBit!5864 thiss!1634)))))))

(declare-fun b!130677 () Bool)

(assert (=> b!130677 (= e!86595 (= (_2!5925 lt!201661) (_2!5925 lt!201663)))))

(declare-fun b!130678 () Bool)

(declare-fun res!108341 () Bool)

(assert (=> b!130678 (=> (not res!108341) (not e!86594))))

(assert (=> b!130678 (= res!108341 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2735 (buf!3096 thiss!1634))) ((_ sign_extend 32) (currentByte!5869 thiss!1634)) ((_ sign_extend 32) (currentBit!5864 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130679 () Bool)

(declare-fun res!108335 () Bool)

(assert (=> b!130679 (=> (not res!108335) (not e!86602))))

(assert (=> b!130679 (= res!108335 (isPrefixOf!0 thiss!1634 (_2!5922 lt!201666)))))

(declare-fun b!130680 () Bool)

(assert (=> b!130680 (= e!86603 (not e!86597))))

(declare-fun res!108343 () Bool)

(assert (=> b!130680 (=> res!108343 e!86597)))

(declare-fun lt!201654 () tuple2!11248)

(assert (=> b!130680 (= res!108343 (or (not (= (size!2735 (_2!5923 lt!201656)) (size!2735 arr!237))) (not (= (_1!5923 lt!201656) (_2!5924 lt!201654)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4734 array!6042 (_ BitVec 32) (_ BitVec 32)) tuple2!11246)

(assert (=> b!130680 (= lt!201656 (readByteArrayLoopPure!0 (_1!5924 lt!201654) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130680 (validate_offset_bits!1 ((_ sign_extend 32) (size!2735 (buf!3096 (_2!5922 lt!201668)))) ((_ sign_extend 32) (currentByte!5869 (_2!5922 lt!201666))) ((_ sign_extend 32) (currentBit!5864 (_2!5922 lt!201666))) lt!201658)))

(declare-fun lt!201665 () Unit!8084)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4734 array!6042 (_ BitVec 64)) Unit!8084)

(assert (=> b!130680 (= lt!201665 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5922 lt!201666) (buf!3096 (_2!5922 lt!201668)) lt!201658))))

(assert (=> b!130680 (= lt!201654 (reader!0 (_2!5922 lt!201666) (_2!5922 lt!201668)))))

(declare-fun b!130681 () Bool)

(declare-fun res!108336 () Bool)

(assert (=> b!130681 (=> (not res!108336) (not e!86594))))

(assert (=> b!130681 (= res!108336 (bvslt from!447 to!404))))

(declare-fun b!130682 () Bool)

(declare-fun lt!201660 () tuple2!11248)

(declare-fun lt!201653 () tuple2!11250)

(assert (=> b!130682 (= e!86602 (and (= (_2!5925 lt!201653) (select (arr!3358 arr!237) from!447)) (= (_1!5925 lt!201653) (_2!5924 lt!201660))))))

(assert (=> b!130682 (= lt!201653 (readBytePure!0 (_1!5924 lt!201660)))))

(assert (=> b!130682 (= lt!201660 (reader!0 thiss!1634 (_2!5922 lt!201666)))))

(assert (= (and start!25662 res!108337) b!130678))

(assert (= (and b!130678 res!108341) b!130681))

(assert (= (and b!130681 res!108336) b!130673))

(assert (= (and b!130673 res!108331) b!130675))

(assert (= (and b!130675 res!108333) b!130676))

(assert (= (and b!130676 res!108338) b!130679))

(assert (= (and b!130679 res!108335) b!130682))

(assert (= (and b!130675 res!108340) b!130669))

(assert (= (and b!130669 res!108342) b!130674))

(assert (= (and b!130674 res!108334) b!130680))

(assert (= (and b!130680 (not res!108343)) b!130670))

(assert (= (and b!130675 res!108332) b!130672))

(assert (= (and b!130675 res!108339) b!130677))

(assert (= start!25662 b!130671))

(declare-fun m!197093 () Bool)

(assert (=> b!130670 m!197093))

(declare-fun m!197095 () Bool)

(assert (=> b!130673 m!197095))

(declare-fun m!197097 () Bool)

(assert (=> b!130671 m!197097))

(declare-fun m!197099 () Bool)

(assert (=> b!130682 m!197099))

(declare-fun m!197101 () Bool)

(assert (=> b!130682 m!197101))

(declare-fun m!197103 () Bool)

(assert (=> b!130682 m!197103))

(declare-fun m!197105 () Bool)

(assert (=> b!130675 m!197105))

(declare-fun m!197107 () Bool)

(assert (=> b!130675 m!197107))

(declare-fun m!197109 () Bool)

(assert (=> b!130675 m!197109))

(declare-fun m!197111 () Bool)

(assert (=> b!130675 m!197111))

(declare-fun m!197113 () Bool)

(assert (=> b!130675 m!197113))

(declare-fun m!197115 () Bool)

(assert (=> b!130675 m!197115))

(declare-fun m!197117 () Bool)

(assert (=> b!130675 m!197117))

(declare-fun m!197119 () Bool)

(assert (=> b!130675 m!197119))

(declare-fun m!197121 () Bool)

(assert (=> b!130675 m!197121))

(declare-fun m!197123 () Bool)

(assert (=> b!130675 m!197123))

(declare-fun m!197125 () Bool)

(assert (=> b!130675 m!197125))

(assert (=> b!130675 m!197099))

(declare-fun m!197127 () Bool)

(assert (=> b!130675 m!197127))

(declare-fun m!197129 () Bool)

(assert (=> b!130675 m!197129))

(declare-fun m!197131 () Bool)

(assert (=> b!130675 m!197131))

(assert (=> b!130675 m!197099))

(declare-fun m!197133 () Bool)

(assert (=> b!130669 m!197133))

(declare-fun m!197135 () Bool)

(assert (=> b!130669 m!197135))

(declare-fun m!197137 () Bool)

(assert (=> b!130672 m!197137))

(declare-fun m!197139 () Bool)

(assert (=> b!130674 m!197139))

(assert (=> b!130676 m!197135))

(declare-fun m!197141 () Bool)

(assert (=> b!130676 m!197141))

(declare-fun m!197143 () Bool)

(assert (=> b!130679 m!197143))

(declare-fun m!197145 () Bool)

(assert (=> b!130678 m!197145))

(declare-fun m!197147 () Bool)

(assert (=> b!130680 m!197147))

(declare-fun m!197149 () Bool)

(assert (=> b!130680 m!197149))

(declare-fun m!197151 () Bool)

(assert (=> b!130680 m!197151))

(assert (=> b!130680 m!197115))

(declare-fun m!197153 () Bool)

(assert (=> start!25662 m!197153))

(declare-fun m!197155 () Bool)

(assert (=> start!25662 m!197155))

(check-sat (not b!130678) (not b!130669) (not b!130671) (not start!25662) (not b!130680) (not b!130673) (not b!130676) (not b!130672) (not b!130675) (not b!130682) (not b!130679) (not b!130670) (not b!130674))
