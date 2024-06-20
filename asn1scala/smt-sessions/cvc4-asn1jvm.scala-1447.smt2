; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39720 () Bool)

(assert start!39720)

(declare-fun b!179753 () Bool)

(declare-fun e!124986 () Bool)

(declare-fun e!124984 () Bool)

(assert (=> b!179753 (= e!124986 e!124984)))

(declare-fun res!149190 () Bool)

(assert (=> b!179753 (=> res!149190 e!124984)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!275903 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!275897 () (_ BitVec 64))

(assert (=> b!179753 (= res!149190 (not (= lt!275897 (bvsub (bvsub (bvadd lt!275903 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!9654 0))(
  ( (array!9655 (arr!5187 (Array (_ BitVec 32) (_ BitVec 8))) (size!4257 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7622 0))(
  ( (BitStream!7623 (buf!4700 array!9654) (currentByte!8910 (_ BitVec 32)) (currentBit!8905 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12933 0))(
  ( (Unit!12934) )
))
(declare-datatypes ((tuple2!15488 0))(
  ( (tuple2!15489 (_1!8389 Unit!12933) (_2!8389 BitStream!7622)) )
))
(declare-fun lt!275890 () tuple2!15488)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179753 (= lt!275897 (bitIndex!0 (size!4257 (buf!4700 (_2!8389 lt!275890))) (currentByte!8910 (_2!8389 lt!275890)) (currentBit!8905 (_2!8389 lt!275890))))))

(declare-fun thiss!1204 () BitStream!7622)

(declare-fun isPrefixOf!0 (BitStream!7622 BitStream!7622) Bool)

(assert (=> b!179753 (isPrefixOf!0 thiss!1204 (_2!8389 lt!275890))))

(declare-fun lt!275898 () Unit!12933)

(declare-fun lt!275896 () tuple2!15488)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7622 BitStream!7622 BitStream!7622) Unit!12933)

(assert (=> b!179753 (= lt!275898 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8389 lt!275896) (_2!8389 lt!275890)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15488)

(assert (=> b!179753 (= lt!275890 (appendBitsLSBFirstLoopTR!0 (_2!8389 lt!275896) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179754 () Bool)

(declare-fun res!149181 () Bool)

(declare-fun e!124985 () Bool)

(assert (=> b!179754 (=> (not res!149181) (not e!124985))))

(assert (=> b!179754 (= res!149181 (isPrefixOf!0 thiss!1204 (_2!8389 lt!275896)))))

(declare-fun b!179755 () Bool)

(declare-fun res!149193 () Bool)

(assert (=> b!179755 (=> res!149193 e!124984)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179755 (= res!149193 (not (invariant!0 (currentBit!8905 (_2!8389 lt!275890)) (currentByte!8910 (_2!8389 lt!275890)) (size!4257 (buf!4700 (_2!8389 lt!275890))))))))

(declare-fun b!179756 () Bool)

(declare-fun e!124983 () Bool)

(declare-datatypes ((tuple2!15490 0))(
  ( (tuple2!15491 (_1!8390 BitStream!7622) (_2!8390 Bool)) )
))
(declare-fun lt!275892 () tuple2!15490)

(declare-fun lt!275902 () (_ BitVec 64))

(assert (=> b!179756 (= e!124983 (= (bitIndex!0 (size!4257 (buf!4700 (_1!8390 lt!275892))) (currentByte!8910 (_1!8390 lt!275892)) (currentBit!8905 (_1!8390 lt!275892))) lt!275902))))

(declare-fun b!179757 () Bool)

(assert (=> b!179757 (= e!124985 e!124983)))

(declare-fun res!149185 () Bool)

(assert (=> b!179757 (=> (not res!149185) (not e!124983))))

(declare-fun lt!275900 () Bool)

(assert (=> b!179757 (= res!149185 (and (= (_2!8390 lt!275892) lt!275900) (= (_1!8390 lt!275892) (_2!8389 lt!275896))))))

(declare-fun readBitPure!0 (BitStream!7622) tuple2!15490)

(declare-fun readerFrom!0 (BitStream!7622 (_ BitVec 32) (_ BitVec 32)) BitStream!7622)

(assert (=> b!179757 (= lt!275892 (readBitPure!0 (readerFrom!0 (_2!8389 lt!275896) (currentBit!8905 thiss!1204) (currentByte!8910 thiss!1204))))))

(declare-fun b!179758 () Bool)

(assert (=> b!179758 (= e!124984 (bvsle i!590 #b00000000000000000000000001000000))))

(declare-datatypes ((tuple2!15492 0))(
  ( (tuple2!15493 (_1!8391 BitStream!7622) (_2!8391 BitStream!7622)) )
))
(declare-fun lt!275888 () tuple2!15492)

(assert (=> b!179758 (= (_2!8390 (readBitPure!0 (_1!8391 lt!275888))) lt!275900)))

(declare-fun lt!275891 () tuple2!15492)

(declare-fun reader!0 (BitStream!7622 BitStream!7622) tuple2!15492)

(assert (=> b!179758 (= lt!275891 (reader!0 (_2!8389 lt!275896) (_2!8389 lt!275890)))))

(assert (=> b!179758 (= lt!275888 (reader!0 thiss!1204 (_2!8389 lt!275890)))))

(declare-fun e!124987 () Bool)

(assert (=> b!179758 e!124987))

(declare-fun res!149184 () Bool)

(assert (=> b!179758 (=> (not res!149184) (not e!124987))))

(declare-fun lt!275894 () tuple2!15490)

(declare-fun lt!275899 () tuple2!15490)

(assert (=> b!179758 (= res!149184 (= (bitIndex!0 (size!4257 (buf!4700 (_1!8390 lt!275894))) (currentByte!8910 (_1!8390 lt!275894)) (currentBit!8905 (_1!8390 lt!275894))) (bitIndex!0 (size!4257 (buf!4700 (_1!8390 lt!275899))) (currentByte!8910 (_1!8390 lt!275899)) (currentBit!8905 (_1!8390 lt!275899)))))))

(declare-fun lt!275901 () Unit!12933)

(declare-fun lt!275889 () BitStream!7622)

(declare-fun readBitPrefixLemma!0 (BitStream!7622 BitStream!7622) Unit!12933)

(assert (=> b!179758 (= lt!275901 (readBitPrefixLemma!0 lt!275889 (_2!8389 lt!275890)))))

(assert (=> b!179758 (= lt!275899 (readBitPure!0 (BitStream!7623 (buf!4700 (_2!8389 lt!275890)) (currentByte!8910 thiss!1204) (currentBit!8905 thiss!1204))))))

(assert (=> b!179758 (= lt!275894 (readBitPure!0 lt!275889))))

(declare-fun e!124981 () Bool)

(assert (=> b!179758 e!124981))

(declare-fun res!149187 () Bool)

(assert (=> b!179758 (=> (not res!149187) (not e!124981))))

(assert (=> b!179758 (= res!149187 (invariant!0 (currentBit!8905 thiss!1204) (currentByte!8910 thiss!1204) (size!4257 (buf!4700 (_2!8389 lt!275896)))))))

(assert (=> b!179758 (= lt!275889 (BitStream!7623 (buf!4700 (_2!8389 lt!275896)) (currentByte!8910 thiss!1204) (currentBit!8905 thiss!1204)))))

(declare-fun b!179759 () Bool)

(assert (=> b!179759 (= e!124981 (invariant!0 (currentBit!8905 thiss!1204) (currentByte!8910 thiss!1204) (size!4257 (buf!4700 (_2!8389 lt!275890)))))))

(declare-fun b!179760 () Bool)

(declare-fun res!149180 () Bool)

(assert (=> b!179760 (=> res!149180 e!124984)))

(assert (=> b!179760 (= res!149180 (not (isPrefixOf!0 thiss!1204 (_2!8389 lt!275896))))))

(declare-fun b!179761 () Bool)

(declare-fun res!149183 () Bool)

(assert (=> b!179761 (=> res!149183 e!124984)))

(declare-fun lt!275893 () (_ BitVec 64))

(assert (=> b!179761 (= res!149183 (or (not (= (size!4257 (buf!4700 (_2!8389 lt!275890))) (size!4257 (buf!4700 thiss!1204)))) (not (= lt!275897 (bvsub (bvadd lt!275893 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!149192 () Bool)

(declare-fun e!124989 () Bool)

(assert (=> start!39720 (=> (not res!149192) (not e!124989))))

(assert (=> start!39720 (= res!149192 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39720 e!124989))

(assert (=> start!39720 true))

(declare-fun e!124990 () Bool)

(declare-fun inv!12 (BitStream!7622) Bool)

(assert (=> start!39720 (and (inv!12 thiss!1204) e!124990)))

(declare-fun b!179762 () Bool)

(assert (=> b!179762 (= e!124987 (= (_2!8390 lt!275894) (_2!8390 lt!275899)))))

(declare-fun b!179763 () Bool)

(declare-fun res!149188 () Bool)

(assert (=> b!179763 (=> (not res!149188) (not e!124989))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179763 (= res!149188 (validate_offset_bits!1 ((_ sign_extend 32) (size!4257 (buf!4700 thiss!1204))) ((_ sign_extend 32) (currentByte!8910 thiss!1204)) ((_ sign_extend 32) (currentBit!8905 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179764 () Bool)

(declare-fun res!149178 () Bool)

(assert (=> b!179764 (=> (not res!149178) (not e!124989))))

(assert (=> b!179764 (= res!149178 (invariant!0 (currentBit!8905 thiss!1204) (currentByte!8910 thiss!1204) (size!4257 (buf!4700 thiss!1204))))))

(declare-fun b!179765 () Bool)

(assert (=> b!179765 (= e!124989 (not e!124986))))

(declare-fun res!149179 () Bool)

(assert (=> b!179765 (=> res!149179 e!124986)))

(assert (=> b!179765 (= res!149179 (not (= lt!275903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275893))))))

(assert (=> b!179765 (= lt!275903 (bitIndex!0 (size!4257 (buf!4700 (_2!8389 lt!275896))) (currentByte!8910 (_2!8389 lt!275896)) (currentBit!8905 (_2!8389 lt!275896))))))

(assert (=> b!179765 (= lt!275893 (bitIndex!0 (size!4257 (buf!4700 thiss!1204)) (currentByte!8910 thiss!1204) (currentBit!8905 thiss!1204)))))

(declare-fun e!124982 () Bool)

(assert (=> b!179765 e!124982))

(declare-fun res!149186 () Bool)

(assert (=> b!179765 (=> (not res!149186) (not e!124982))))

(assert (=> b!179765 (= res!149186 (= (size!4257 (buf!4700 thiss!1204)) (size!4257 (buf!4700 (_2!8389 lt!275896)))))))

(declare-fun appendBit!0 (BitStream!7622 Bool) tuple2!15488)

(assert (=> b!179765 (= lt!275896 (appendBit!0 thiss!1204 lt!275900))))

(assert (=> b!179765 (= lt!275900 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179766 () Bool)

(declare-fun array_inv!3998 (array!9654) Bool)

(assert (=> b!179766 (= e!124990 (array_inv!3998 (buf!4700 thiss!1204)))))

(declare-fun b!179767 () Bool)

(declare-fun res!149182 () Bool)

(assert (=> b!179767 (=> res!149182 e!124984)))

(assert (=> b!179767 (= res!149182 (not (isPrefixOf!0 (_2!8389 lt!275896) (_2!8389 lt!275890))))))

(declare-fun b!179768 () Bool)

(declare-fun res!149189 () Bool)

(assert (=> b!179768 (=> (not res!149189) (not e!124989))))

(assert (=> b!179768 (= res!149189 (not (= i!590 nBits!348)))))

(declare-fun b!179769 () Bool)

(assert (=> b!179769 (= e!124982 e!124985)))

(declare-fun res!149191 () Bool)

(assert (=> b!179769 (=> (not res!149191) (not e!124985))))

(declare-fun lt!275895 () (_ BitVec 64))

(assert (=> b!179769 (= res!149191 (= lt!275902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!275895)))))

(assert (=> b!179769 (= lt!275902 (bitIndex!0 (size!4257 (buf!4700 (_2!8389 lt!275896))) (currentByte!8910 (_2!8389 lt!275896)) (currentBit!8905 (_2!8389 lt!275896))))))

(assert (=> b!179769 (= lt!275895 (bitIndex!0 (size!4257 (buf!4700 thiss!1204)) (currentByte!8910 thiss!1204) (currentBit!8905 thiss!1204)))))

(assert (= (and start!39720 res!149192) b!179763))

(assert (= (and b!179763 res!149188) b!179764))

(assert (= (and b!179764 res!149178) b!179768))

(assert (= (and b!179768 res!149189) b!179765))

(assert (= (and b!179765 res!149186) b!179769))

(assert (= (and b!179769 res!149191) b!179754))

(assert (= (and b!179754 res!149181) b!179757))

(assert (= (and b!179757 res!149185) b!179756))

(assert (= (and b!179765 (not res!149179)) b!179753))

(assert (= (and b!179753 (not res!149190)) b!179755))

(assert (= (and b!179755 (not res!149193)) b!179761))

(assert (= (and b!179761 (not res!149183)) b!179767))

(assert (= (and b!179767 (not res!149182)) b!179760))

(assert (= (and b!179760 (not res!149180)) b!179758))

(assert (= (and b!179758 res!149187) b!179759))

(assert (= (and b!179758 res!149184) b!179762))

(assert (= start!39720 b!179766))

(declare-fun m!280111 () Bool)

(assert (=> b!179755 m!280111))

(declare-fun m!280113 () Bool)

(assert (=> b!179767 m!280113))

(declare-fun m!280115 () Bool)

(assert (=> b!179763 m!280115))

(declare-fun m!280117 () Bool)

(assert (=> b!179758 m!280117))

(declare-fun m!280119 () Bool)

(assert (=> b!179758 m!280119))

(declare-fun m!280121 () Bool)

(assert (=> b!179758 m!280121))

(declare-fun m!280123 () Bool)

(assert (=> b!179758 m!280123))

(declare-fun m!280125 () Bool)

(assert (=> b!179758 m!280125))

(declare-fun m!280127 () Bool)

(assert (=> b!179758 m!280127))

(declare-fun m!280129 () Bool)

(assert (=> b!179758 m!280129))

(declare-fun m!280131 () Bool)

(assert (=> b!179758 m!280131))

(declare-fun m!280133 () Bool)

(assert (=> b!179758 m!280133))

(declare-fun m!280135 () Bool)

(assert (=> b!179754 m!280135))

(declare-fun m!280137 () Bool)

(assert (=> b!179753 m!280137))

(declare-fun m!280139 () Bool)

(assert (=> b!179753 m!280139))

(declare-fun m!280141 () Bool)

(assert (=> b!179753 m!280141))

(declare-fun m!280143 () Bool)

(assert (=> b!179753 m!280143))

(declare-fun m!280145 () Bool)

(assert (=> b!179765 m!280145))

(declare-fun m!280147 () Bool)

(assert (=> b!179765 m!280147))

(declare-fun m!280149 () Bool)

(assert (=> b!179765 m!280149))

(declare-fun m!280151 () Bool)

(assert (=> b!179766 m!280151))

(declare-fun m!280153 () Bool)

(assert (=> start!39720 m!280153))

(declare-fun m!280155 () Bool)

(assert (=> b!179759 m!280155))

(assert (=> b!179760 m!280135))

(declare-fun m!280157 () Bool)

(assert (=> b!179756 m!280157))

(assert (=> b!179769 m!280145))

(assert (=> b!179769 m!280147))

(declare-fun m!280159 () Bool)

(assert (=> b!179757 m!280159))

(assert (=> b!179757 m!280159))

(declare-fun m!280161 () Bool)

(assert (=> b!179757 m!280161))

(declare-fun m!280163 () Bool)

(assert (=> b!179764 m!280163))

(push 1)

(assert (not b!179756))

(assert (not start!39720))

(assert (not b!179754))

(assert (not b!179769))

(assert (not b!179759))

(assert (not b!179766))

(assert (not b!179765))

(assert (not b!179758))

(assert (not b!179757))

(assert (not b!179764))

(assert (not b!179753))

(assert (not b!179767))

(assert (not b!179760))

(assert (not b!179763))

(assert (not b!179755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

