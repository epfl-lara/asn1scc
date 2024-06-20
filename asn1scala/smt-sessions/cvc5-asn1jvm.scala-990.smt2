; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27794 () Bool)

(assert start!27794)

(declare-fun res!119669 () Bool)

(declare-fun e!95447 () Bool)

(assert (=> start!27794 (=> (not res!119669) (not e!95447))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6551 0))(
  ( (array!6552 (arr!3688 (Array (_ BitVec 32) (_ BitVec 8))) (size!2965 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6551)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27794 (= res!119669 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2965 arr!237))))))

(assert (=> start!27794 e!95447))

(assert (=> start!27794 true))

(declare-fun array_inv!2754 (array!6551) Bool)

(assert (=> start!27794 (array_inv!2754 arr!237)))

(declare-datatypes ((BitStream!5188 0))(
  ( (BitStream!5189 (buf!3394 array!6551) (currentByte!6278 (_ BitVec 32)) (currentBit!6273 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5188)

(declare-fun e!95443 () Bool)

(declare-fun inv!12 (BitStream!5188) Bool)

(assert (=> start!27794 (and (inv!12 thiss!1634) e!95443)))

(declare-fun b!143290 () Bool)

(assert (=> b!143290 (= e!95447 (not true))))

(declare-datatypes ((tuple2!12752 0))(
  ( (tuple2!12753 (_1!6717 BitStream!5188) (_2!6717 BitStream!5188)) )
))
(declare-fun lt!222157 () tuple2!12752)

(declare-datatypes ((tuple2!12754 0))(
  ( (tuple2!12755 (_1!6718 BitStream!5188) (_2!6718 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5188) tuple2!12754)

(assert (=> b!143290 (= (_2!6718 (readBytePure!0 (_1!6717 lt!222157))) (select (arr!3688 arr!237) from!447))))

(declare-fun lt!222154 () tuple2!12752)

(declare-datatypes ((Unit!8930 0))(
  ( (Unit!8931) )
))
(declare-datatypes ((tuple2!12756 0))(
  ( (tuple2!12757 (_1!6719 Unit!8930) (_2!6719 BitStream!5188)) )
))
(declare-fun lt!222151 () tuple2!12756)

(declare-fun lt!222152 () tuple2!12756)

(declare-fun reader!0 (BitStream!5188 BitStream!5188) tuple2!12752)

(assert (=> b!143290 (= lt!222154 (reader!0 (_2!6719 lt!222151) (_2!6719 lt!222152)))))

(assert (=> b!143290 (= lt!222157 (reader!0 thiss!1634 (_2!6719 lt!222152)))))

(declare-fun e!95448 () Bool)

(assert (=> b!143290 e!95448))

(declare-fun res!119661 () Bool)

(assert (=> b!143290 (=> (not res!119661) (not e!95448))))

(declare-fun lt!222145 () tuple2!12754)

(declare-fun lt!222155 () tuple2!12754)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143290 (= res!119661 (= (bitIndex!0 (size!2965 (buf!3394 (_1!6718 lt!222145))) (currentByte!6278 (_1!6718 lt!222145)) (currentBit!6273 (_1!6718 lt!222145))) (bitIndex!0 (size!2965 (buf!3394 (_1!6718 lt!222155))) (currentByte!6278 (_1!6718 lt!222155)) (currentBit!6273 (_1!6718 lt!222155)))))))

(declare-fun lt!222148 () Unit!8930)

(declare-fun lt!222159 () BitStream!5188)

(declare-fun readBytePrefixLemma!0 (BitStream!5188 BitStream!5188) Unit!8930)

(assert (=> b!143290 (= lt!222148 (readBytePrefixLemma!0 lt!222159 (_2!6719 lt!222152)))))

(assert (=> b!143290 (= lt!222155 (readBytePure!0 (BitStream!5189 (buf!3394 (_2!6719 lt!222152)) (currentByte!6278 thiss!1634) (currentBit!6273 thiss!1634))))))

(assert (=> b!143290 (= lt!222145 (readBytePure!0 lt!222159))))

(assert (=> b!143290 (= lt!222159 (BitStream!5189 (buf!3394 (_2!6719 lt!222151)) (currentByte!6278 thiss!1634) (currentBit!6273 thiss!1634)))))

(declare-fun e!95444 () Bool)

(assert (=> b!143290 e!95444))

(declare-fun res!119667 () Bool)

(assert (=> b!143290 (=> (not res!119667) (not e!95444))))

(declare-fun isPrefixOf!0 (BitStream!5188 BitStream!5188) Bool)

(assert (=> b!143290 (= res!119667 (isPrefixOf!0 thiss!1634 (_2!6719 lt!222152)))))

(declare-fun lt!222150 () Unit!8930)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5188 BitStream!5188 BitStream!5188) Unit!8930)

(assert (=> b!143290 (= lt!222150 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6719 lt!222151) (_2!6719 lt!222152)))))

(declare-fun e!95445 () Bool)

(assert (=> b!143290 e!95445))

(declare-fun res!119668 () Bool)

(assert (=> b!143290 (=> (not res!119668) (not e!95445))))

(assert (=> b!143290 (= res!119668 (= (size!2965 (buf!3394 (_2!6719 lt!222151))) (size!2965 (buf!3394 (_2!6719 lt!222152)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5188 array!6551 (_ BitVec 32) (_ BitVec 32)) tuple2!12756)

(assert (=> b!143290 (= lt!222152 (appendByteArrayLoop!0 (_2!6719 lt!222151) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143290 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2965 (buf!3394 (_2!6719 lt!222151)))) ((_ sign_extend 32) (currentByte!6278 (_2!6719 lt!222151))) ((_ sign_extend 32) (currentBit!6273 (_2!6719 lt!222151))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222158 () Unit!8930)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5188 BitStream!5188 (_ BitVec 64) (_ BitVec 32)) Unit!8930)

(assert (=> b!143290 (= lt!222158 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6719 lt!222151) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!95446 () Bool)

(assert (=> b!143290 e!95446))

(declare-fun res!119665 () Bool)

(assert (=> b!143290 (=> (not res!119665) (not e!95446))))

(assert (=> b!143290 (= res!119665 (= (size!2965 (buf!3394 thiss!1634)) (size!2965 (buf!3394 (_2!6719 lt!222151)))))))

(declare-fun appendByte!0 (BitStream!5188 (_ BitVec 8)) tuple2!12756)

(assert (=> b!143290 (= lt!222151 (appendByte!0 thiss!1634 (select (arr!3688 arr!237) from!447)))))

(declare-fun b!143291 () Bool)

(declare-fun res!119664 () Bool)

(assert (=> b!143291 (=> (not res!119664) (not e!95447))))

(assert (=> b!143291 (= res!119664 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2965 (buf!3394 thiss!1634))) ((_ sign_extend 32) (currentByte!6278 thiss!1634)) ((_ sign_extend 32) (currentBit!6273 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143292 () Bool)

(declare-fun res!119671 () Bool)

(assert (=> b!143292 (=> (not res!119671) (not e!95447))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143292 (= res!119671 (invariant!0 (currentBit!6273 thiss!1634) (currentByte!6278 thiss!1634) (size!2965 (buf!3394 thiss!1634))))))

(declare-fun b!143293 () Bool)

(declare-fun res!119670 () Bool)

(assert (=> b!143293 (=> (not res!119670) (not e!95446))))

(assert (=> b!143293 (= res!119670 (= (bitIndex!0 (size!2965 (buf!3394 (_2!6719 lt!222151))) (currentByte!6278 (_2!6719 lt!222151)) (currentBit!6273 (_2!6719 lt!222151))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2965 (buf!3394 thiss!1634)) (currentByte!6278 thiss!1634) (currentBit!6273 thiss!1634)))))))

(declare-datatypes ((tuple2!12758 0))(
  ( (tuple2!12759 (_1!6720 BitStream!5188) (_2!6720 array!6551)) )
))
(declare-fun lt!222147 () tuple2!12758)

(declare-fun b!143294 () Bool)

(declare-fun e!95451 () Bool)

(declare-fun arrayRangesEq!281 (array!6551 array!6551 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143294 (= e!95451 (not (arrayRangesEq!281 arr!237 (_2!6720 lt!222147) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143295 () Bool)

(declare-fun e!95449 () Bool)

(assert (=> b!143295 (= e!95445 e!95449)))

(declare-fun res!119662 () Bool)

(assert (=> b!143295 (=> (not res!119662) (not e!95449))))

(declare-fun lt!222153 () (_ BitVec 64))

(assert (=> b!143295 (= res!119662 (= (bitIndex!0 (size!2965 (buf!3394 (_2!6719 lt!222152))) (currentByte!6278 (_2!6719 lt!222152)) (currentBit!6273 (_2!6719 lt!222152))) (bvadd (bitIndex!0 (size!2965 (buf!3394 (_2!6719 lt!222151))) (currentByte!6278 (_2!6719 lt!222151)) (currentBit!6273 (_2!6719 lt!222151))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222153))))))

(assert (=> b!143295 (= lt!222153 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143296 () Bool)

(assert (=> b!143296 (= e!95444 (invariant!0 (currentBit!6273 thiss!1634) (currentByte!6278 thiss!1634) (size!2965 (buf!3394 (_2!6719 lt!222151)))))))

(declare-fun b!143297 () Bool)

(assert (=> b!143297 (= e!95448 (= (_2!6718 lt!222145) (_2!6718 lt!222155)))))

(declare-fun b!143298 () Bool)

(assert (=> b!143298 (= e!95449 (not e!95451))))

(declare-fun res!119660 () Bool)

(assert (=> b!143298 (=> res!119660 e!95451)))

(declare-fun lt!222149 () tuple2!12752)

(assert (=> b!143298 (= res!119660 (or (not (= (size!2965 (_2!6720 lt!222147)) (size!2965 arr!237))) (not (= (_1!6720 lt!222147) (_2!6717 lt!222149)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5188 array!6551 (_ BitVec 32) (_ BitVec 32)) tuple2!12758)

(assert (=> b!143298 (= lt!222147 (readByteArrayLoopPure!0 (_1!6717 lt!222149) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143298 (validate_offset_bits!1 ((_ sign_extend 32) (size!2965 (buf!3394 (_2!6719 lt!222152)))) ((_ sign_extend 32) (currentByte!6278 (_2!6719 lt!222151))) ((_ sign_extend 32) (currentBit!6273 (_2!6719 lt!222151))) lt!222153)))

(declare-fun lt!222156 () Unit!8930)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5188 array!6551 (_ BitVec 64)) Unit!8930)

(assert (=> b!143298 (= lt!222156 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6719 lt!222151) (buf!3394 (_2!6719 lt!222152)) lt!222153))))

(assert (=> b!143298 (= lt!222149 (reader!0 (_2!6719 lt!222151) (_2!6719 lt!222152)))))

(declare-fun b!143299 () Bool)

(declare-fun res!119666 () Bool)

(assert (=> b!143299 (=> (not res!119666) (not e!95449))))

(assert (=> b!143299 (= res!119666 (isPrefixOf!0 (_2!6719 lt!222151) (_2!6719 lt!222152)))))

(declare-fun b!143300 () Bool)

(declare-fun res!119672 () Bool)

(assert (=> b!143300 (=> (not res!119672) (not e!95446))))

(assert (=> b!143300 (= res!119672 (isPrefixOf!0 thiss!1634 (_2!6719 lt!222151)))))

(declare-fun b!143301 () Bool)

(assert (=> b!143301 (= e!95443 (array_inv!2754 (buf!3394 thiss!1634)))))

(declare-fun b!143302 () Bool)

(declare-fun res!119663 () Bool)

(assert (=> b!143302 (=> (not res!119663) (not e!95447))))

(assert (=> b!143302 (= res!119663 (bvslt from!447 to!404))))

(declare-fun lt!222146 () tuple2!12754)

(declare-fun lt!222160 () tuple2!12752)

(declare-fun b!143303 () Bool)

(assert (=> b!143303 (= e!95446 (and (= (_2!6718 lt!222146) (select (arr!3688 arr!237) from!447)) (= (_1!6718 lt!222146) (_2!6717 lt!222160))))))

(assert (=> b!143303 (= lt!222146 (readBytePure!0 (_1!6717 lt!222160)))))

(assert (=> b!143303 (= lt!222160 (reader!0 thiss!1634 (_2!6719 lt!222151)))))

(assert (= (and start!27794 res!119669) b!143291))

(assert (= (and b!143291 res!119664) b!143302))

(assert (= (and b!143302 res!119663) b!143292))

(assert (= (and b!143292 res!119671) b!143290))

(assert (= (and b!143290 res!119665) b!143293))

(assert (= (and b!143293 res!119670) b!143300))

(assert (= (and b!143300 res!119672) b!143303))

(assert (= (and b!143290 res!119668) b!143295))

(assert (= (and b!143295 res!119662) b!143299))

(assert (= (and b!143299 res!119666) b!143298))

(assert (= (and b!143298 (not res!119660)) b!143294))

(assert (= (and b!143290 res!119667) b!143296))

(assert (= (and b!143290 res!119661) b!143297))

(assert (= start!27794 b!143301))

(declare-fun m!219997 () Bool)

(assert (=> b!143299 m!219997))

(declare-fun m!219999 () Bool)

(assert (=> b!143294 m!219999))

(declare-fun m!220001 () Bool)

(assert (=> b!143292 m!220001))

(declare-fun m!220003 () Bool)

(assert (=> start!27794 m!220003))

(declare-fun m!220005 () Bool)

(assert (=> start!27794 m!220005))

(declare-fun m!220007 () Bool)

(assert (=> b!143296 m!220007))

(declare-fun m!220009 () Bool)

(assert (=> b!143295 m!220009))

(declare-fun m!220011 () Bool)

(assert (=> b!143295 m!220011))

(assert (=> b!143293 m!220011))

(declare-fun m!220013 () Bool)

(assert (=> b!143293 m!220013))

(declare-fun m!220015 () Bool)

(assert (=> b!143290 m!220015))

(declare-fun m!220017 () Bool)

(assert (=> b!143290 m!220017))

(declare-fun m!220019 () Bool)

(assert (=> b!143290 m!220019))

(declare-fun m!220021 () Bool)

(assert (=> b!143290 m!220021))

(declare-fun m!220023 () Bool)

(assert (=> b!143290 m!220023))

(declare-fun m!220025 () Bool)

(assert (=> b!143290 m!220025))

(declare-fun m!220027 () Bool)

(assert (=> b!143290 m!220027))

(declare-fun m!220029 () Bool)

(assert (=> b!143290 m!220029))

(declare-fun m!220031 () Bool)

(assert (=> b!143290 m!220031))

(declare-fun m!220033 () Bool)

(assert (=> b!143290 m!220033))

(declare-fun m!220035 () Bool)

(assert (=> b!143290 m!220035))

(declare-fun m!220037 () Bool)

(assert (=> b!143290 m!220037))

(declare-fun m!220039 () Bool)

(assert (=> b!143290 m!220039))

(declare-fun m!220041 () Bool)

(assert (=> b!143290 m!220041))

(declare-fun m!220043 () Bool)

(assert (=> b!143290 m!220043))

(assert (=> b!143290 m!220039))

(declare-fun m!220045 () Bool)

(assert (=> b!143298 m!220045))

(declare-fun m!220047 () Bool)

(assert (=> b!143298 m!220047))

(declare-fun m!220049 () Bool)

(assert (=> b!143298 m!220049))

(assert (=> b!143298 m!220015))

(declare-fun m!220051 () Bool)

(assert (=> b!143300 m!220051))

(assert (=> b!143303 m!220039))

(declare-fun m!220053 () Bool)

(assert (=> b!143303 m!220053))

(declare-fun m!220055 () Bool)

(assert (=> b!143303 m!220055))

(declare-fun m!220057 () Bool)

(assert (=> b!143301 m!220057))

(declare-fun m!220059 () Bool)

(assert (=> b!143291 m!220059))

(push 1)

(assert (not b!143296))

(assert (not start!27794))

(assert (not b!143298))

(assert (not b!143290))

(assert (not b!143292))

(assert (not b!143303))

(assert (not b!143299))

(assert (not b!143295))

(assert (not b!143291))

(assert (not b!143301))

(assert (not b!143294))

(assert (not b!143293))

(assert (not b!143300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

