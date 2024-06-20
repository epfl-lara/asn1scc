; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26372 () Bool)

(assert start!26372)

(declare-fun e!89771 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((array!6172 0))(
  ( (array!6173 (arr!3459 (Array (_ BitVec 32) (_ BitVec 8))) (size!2794 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4852 0))(
  ( (BitStream!4853 (buf!3187 array!6172) (currentByte!5984 (_ BitVec 32)) (currentBit!5979 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11748 0))(
  ( (tuple2!11749 (_1!6190 BitStream!4852) (_2!6190 BitStream!4852)) )
))
(declare-fun lt!209893 () tuple2!11748)

(declare-fun b!135246 () Bool)

(declare-datatypes ((tuple2!11750 0))(
  ( (tuple2!11751 (_1!6191 BitStream!4852) (_2!6191 (_ BitVec 8))) )
))
(declare-fun lt!209917 () tuple2!11750)

(declare-fun arr!237 () array!6172)

(assert (=> b!135246 (= e!89771 (and (= (_2!6191 lt!209917) (select (arr!3459 arr!237) from!447)) (= (_1!6191 lt!209917) (_2!6190 lt!209893))))))

(declare-fun readBytePure!0 (BitStream!4852) tuple2!11750)

(assert (=> b!135246 (= lt!209917 (readBytePure!0 (_1!6190 lt!209893)))))

(declare-fun thiss!1634 () BitStream!4852)

(declare-datatypes ((Unit!8426 0))(
  ( (Unit!8427) )
))
(declare-datatypes ((tuple2!11752 0))(
  ( (tuple2!11753 (_1!6192 Unit!8426) (_2!6192 BitStream!4852)) )
))
(declare-fun lt!209916 () tuple2!11752)

(declare-fun reader!0 (BitStream!4852 BitStream!4852) tuple2!11748)

(assert (=> b!135246 (= lt!209893 (reader!0 thiss!1634 (_2!6192 lt!209916)))))

(declare-fun res!112472 () Bool)

(declare-fun e!89779 () Bool)

(assert (=> start!26372 (=> (not res!112472) (not e!89779))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!26372 (= res!112472 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2794 arr!237))))))

(assert (=> start!26372 e!89779))

(assert (=> start!26372 true))

(declare-fun array_inv!2583 (array!6172) Bool)

(assert (=> start!26372 (array_inv!2583 arr!237)))

(declare-fun e!89778 () Bool)

(declare-fun inv!12 (BitStream!4852) Bool)

(assert (=> start!26372 (and (inv!12 thiss!1634) e!89778)))

(declare-fun b!135247 () Bool)

(declare-fun e!89780 () Bool)

(assert (=> b!135247 (= e!89779 (not e!89780))))

(declare-fun res!112473 () Bool)

(assert (=> b!135247 (=> res!112473 e!89780)))

(declare-datatypes ((tuple2!11754 0))(
  ( (tuple2!11755 (_1!6193 BitStream!4852) (_2!6193 array!6172)) )
))
(declare-fun lt!209895 () tuple2!11754)

(declare-fun lt!209905 () tuple2!11754)

(declare-fun arrayRangesEq!197 (array!6172 array!6172 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135247 (= res!112473 (not (arrayRangesEq!197 (_2!6193 lt!209895) (_2!6193 lt!209905) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209914 () tuple2!11754)

(assert (=> b!135247 (arrayRangesEq!197 (_2!6193 lt!209895) (_2!6193 lt!209914) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209915 () Unit!8426)

(declare-fun lt!209892 () tuple2!11748)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4852 array!6172 (_ BitVec 32) (_ BitVec 32)) Unit!8426)

(assert (=> b!135247 (= lt!209915 (readByteArrayLoopArrayPrefixLemma!0 (_1!6190 lt!209892) arr!237 from!447 to!404))))

(declare-fun lt!209913 () array!6172)

(declare-fun readByteArrayLoopPure!0 (BitStream!4852 array!6172 (_ BitVec 32) (_ BitVec 32)) tuple2!11754)

(declare-fun withMovedByteIndex!0 (BitStream!4852 (_ BitVec 32)) BitStream!4852)

(assert (=> b!135247 (= lt!209914 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6190 lt!209892) #b00000000000000000000000000000001) lt!209913 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209898 () tuple2!11748)

(assert (=> b!135247 (= lt!209905 (readByteArrayLoopPure!0 (_1!6190 lt!209898) lt!209913 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209903 () tuple2!11750)

(assert (=> b!135247 (= lt!209913 (array!6173 (store (arr!3459 arr!237) from!447 (_2!6191 lt!209903)) (size!2794 arr!237)))))

(declare-fun lt!209911 () tuple2!11752)

(declare-fun lt!209897 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135247 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2794 (buf!3187 (_2!6192 lt!209911)))) ((_ sign_extend 32) (currentByte!5984 (_2!6192 lt!209916))) ((_ sign_extend 32) (currentBit!5979 (_2!6192 lt!209916))) lt!209897)))

(declare-fun lt!209912 () Unit!8426)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4852 array!6172 (_ BitVec 32)) Unit!8426)

(assert (=> b!135247 (= lt!209912 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6192 lt!209916) (buf!3187 (_2!6192 lt!209911)) lt!209897))))

(assert (=> b!135247 (= (_1!6193 lt!209895) (_2!6190 lt!209892))))

(assert (=> b!135247 (= lt!209895 (readByteArrayLoopPure!0 (_1!6190 lt!209892) arr!237 from!447 to!404))))

(assert (=> b!135247 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2794 (buf!3187 (_2!6192 lt!209911)))) ((_ sign_extend 32) (currentByte!5984 thiss!1634)) ((_ sign_extend 32) (currentBit!5979 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209906 () Unit!8426)

(assert (=> b!135247 (= lt!209906 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3187 (_2!6192 lt!209911)) (bvsub to!404 from!447)))))

(assert (=> b!135247 (= (_2!6191 lt!209903) (select (arr!3459 arr!237) from!447))))

(assert (=> b!135247 (= lt!209903 (readBytePure!0 (_1!6190 lt!209892)))))

(assert (=> b!135247 (= lt!209898 (reader!0 (_2!6192 lt!209916) (_2!6192 lt!209911)))))

(assert (=> b!135247 (= lt!209892 (reader!0 thiss!1634 (_2!6192 lt!209911)))))

(declare-fun e!89776 () Bool)

(assert (=> b!135247 e!89776))

(declare-fun res!112465 () Bool)

(assert (=> b!135247 (=> (not res!112465) (not e!89776))))

(declare-fun lt!209896 () tuple2!11750)

(declare-fun lt!209902 () tuple2!11750)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135247 (= res!112465 (= (bitIndex!0 (size!2794 (buf!3187 (_1!6191 lt!209896))) (currentByte!5984 (_1!6191 lt!209896)) (currentBit!5979 (_1!6191 lt!209896))) (bitIndex!0 (size!2794 (buf!3187 (_1!6191 lt!209902))) (currentByte!5984 (_1!6191 lt!209902)) (currentBit!5979 (_1!6191 lt!209902)))))))

(declare-fun lt!209899 () Unit!8426)

(declare-fun lt!209894 () BitStream!4852)

(declare-fun readBytePrefixLemma!0 (BitStream!4852 BitStream!4852) Unit!8426)

(assert (=> b!135247 (= lt!209899 (readBytePrefixLemma!0 lt!209894 (_2!6192 lt!209911)))))

(assert (=> b!135247 (= lt!209902 (readBytePure!0 (BitStream!4853 (buf!3187 (_2!6192 lt!209911)) (currentByte!5984 thiss!1634) (currentBit!5979 thiss!1634))))))

(assert (=> b!135247 (= lt!209896 (readBytePure!0 lt!209894))))

(assert (=> b!135247 (= lt!209894 (BitStream!4853 (buf!3187 (_2!6192 lt!209916)) (currentByte!5984 thiss!1634) (currentBit!5979 thiss!1634)))))

(declare-fun e!89774 () Bool)

(assert (=> b!135247 e!89774))

(declare-fun res!112466 () Bool)

(assert (=> b!135247 (=> (not res!112466) (not e!89774))))

(declare-fun isPrefixOf!0 (BitStream!4852 BitStream!4852) Bool)

(assert (=> b!135247 (= res!112466 (isPrefixOf!0 thiss!1634 (_2!6192 lt!209911)))))

(declare-fun lt!209907 () Unit!8426)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4852 BitStream!4852 BitStream!4852) Unit!8426)

(assert (=> b!135247 (= lt!209907 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6192 lt!209916) (_2!6192 lt!209911)))))

(declare-fun e!89781 () Bool)

(assert (=> b!135247 e!89781))

(declare-fun res!112471 () Bool)

(assert (=> b!135247 (=> (not res!112471) (not e!89781))))

(assert (=> b!135247 (= res!112471 (= (size!2794 (buf!3187 (_2!6192 lt!209916))) (size!2794 (buf!3187 (_2!6192 lt!209911)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4852 array!6172 (_ BitVec 32) (_ BitVec 32)) tuple2!11752)

(assert (=> b!135247 (= lt!209911 (appendByteArrayLoop!0 (_2!6192 lt!209916) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135247 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2794 (buf!3187 (_2!6192 lt!209916)))) ((_ sign_extend 32) (currentByte!5984 (_2!6192 lt!209916))) ((_ sign_extend 32) (currentBit!5979 (_2!6192 lt!209916))) lt!209897)))

(assert (=> b!135247 (= lt!209897 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209904 () Unit!8426)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4852 BitStream!4852 (_ BitVec 64) (_ BitVec 32)) Unit!8426)

(assert (=> b!135247 (= lt!209904 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6192 lt!209916) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135247 e!89771))

(declare-fun res!112468 () Bool)

(assert (=> b!135247 (=> (not res!112468) (not e!89771))))

(assert (=> b!135247 (= res!112468 (= (size!2794 (buf!3187 thiss!1634)) (size!2794 (buf!3187 (_2!6192 lt!209916)))))))

(declare-fun appendByte!0 (BitStream!4852 (_ BitVec 8)) tuple2!11752)

(assert (=> b!135247 (= lt!209916 (appendByte!0 thiss!1634 (select (arr!3459 arr!237) from!447)))))

(declare-fun b!135248 () Bool)

(assert (=> b!135248 (= e!89776 (= (_2!6191 lt!209896) (_2!6191 lt!209902)))))

(declare-fun b!135249 () Bool)

(declare-fun res!112470 () Bool)

(assert (=> b!135249 (=> (not res!112470) (not e!89771))))

(assert (=> b!135249 (= res!112470 (isPrefixOf!0 thiss!1634 (_2!6192 lt!209916)))))

(declare-fun b!135250 () Bool)

(assert (=> b!135250 (= e!89778 (array_inv!2583 (buf!3187 thiss!1634)))))

(declare-fun b!135251 () Bool)

(declare-fun res!112463 () Bool)

(assert (=> b!135251 (=> (not res!112463) (not e!89779))))

(assert (=> b!135251 (= res!112463 (bvslt from!447 to!404))))

(declare-fun b!135252 () Bool)

(declare-fun e!89777 () Bool)

(declare-fun e!89773 () Bool)

(assert (=> b!135252 (= e!89777 (not e!89773))))

(declare-fun res!112467 () Bool)

(assert (=> b!135252 (=> res!112467 e!89773)))

(declare-fun lt!209901 () tuple2!11754)

(declare-fun lt!209908 () tuple2!11748)

(assert (=> b!135252 (= res!112467 (or (not (= (size!2794 (_2!6193 lt!209901)) (size!2794 arr!237))) (not (= (_1!6193 lt!209901) (_2!6190 lt!209908)))))))

(assert (=> b!135252 (= lt!209901 (readByteArrayLoopPure!0 (_1!6190 lt!209908) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209900 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135252 (validate_offset_bits!1 ((_ sign_extend 32) (size!2794 (buf!3187 (_2!6192 lt!209911)))) ((_ sign_extend 32) (currentByte!5984 (_2!6192 lt!209916))) ((_ sign_extend 32) (currentBit!5979 (_2!6192 lt!209916))) lt!209900)))

(declare-fun lt!209910 () Unit!8426)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4852 array!6172 (_ BitVec 64)) Unit!8426)

(assert (=> b!135252 (= lt!209910 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6192 lt!209916) (buf!3187 (_2!6192 lt!209911)) lt!209900))))

(assert (=> b!135252 (= lt!209908 (reader!0 (_2!6192 lt!209916) (_2!6192 lt!209911)))))

(declare-fun b!135253 () Bool)

(assert (=> b!135253 (= e!89781 e!89777)))

(declare-fun res!112475 () Bool)

(assert (=> b!135253 (=> (not res!112475) (not e!89777))))

(assert (=> b!135253 (= res!112475 (= (bitIndex!0 (size!2794 (buf!3187 (_2!6192 lt!209911))) (currentByte!5984 (_2!6192 lt!209911)) (currentBit!5979 (_2!6192 lt!209911))) (bvadd (bitIndex!0 (size!2794 (buf!3187 (_2!6192 lt!209916))) (currentByte!5984 (_2!6192 lt!209916)) (currentBit!5979 (_2!6192 lt!209916))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209900))))))

(assert (=> b!135253 (= lt!209900 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135254 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135254 (= e!89774 (invariant!0 (currentBit!5979 thiss!1634) (currentByte!5984 thiss!1634) (size!2794 (buf!3187 (_2!6192 lt!209916)))))))

(declare-fun b!135255 () Bool)

(declare-fun res!112469 () Bool)

(assert (=> b!135255 (=> (not res!112469) (not e!89771))))

(assert (=> b!135255 (= res!112469 (= (bitIndex!0 (size!2794 (buf!3187 (_2!6192 lt!209916))) (currentByte!5984 (_2!6192 lt!209916)) (currentBit!5979 (_2!6192 lt!209916))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2794 (buf!3187 thiss!1634)) (currentByte!5984 thiss!1634) (currentBit!5979 thiss!1634)))))))

(declare-fun b!135256 () Bool)

(declare-fun res!112464 () Bool)

(assert (=> b!135256 (=> (not res!112464) (not e!89777))))

(assert (=> b!135256 (= res!112464 (isPrefixOf!0 (_2!6192 lt!209916) (_2!6192 lt!209911)))))

(declare-fun b!135257 () Bool)

(assert (=> b!135257 (= e!89780 true)))

(assert (=> b!135257 (arrayRangesEq!197 (_2!6193 lt!209905) (_2!6193 lt!209895) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209909 () Unit!8426)

(declare-fun arrayRangesEqSymmetricLemma!10 (array!6172 array!6172 (_ BitVec 32) (_ BitVec 32)) Unit!8426)

(assert (=> b!135257 (= lt!209909 (arrayRangesEqSymmetricLemma!10 (_2!6193 lt!209895) (_2!6193 lt!209905) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135258 () Bool)

(declare-fun res!112476 () Bool)

(assert (=> b!135258 (=> (not res!112476) (not e!89779))))

(assert (=> b!135258 (= res!112476 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2794 (buf!3187 thiss!1634))) ((_ sign_extend 32) (currentByte!5984 thiss!1634)) ((_ sign_extend 32) (currentBit!5979 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135259 () Bool)

(assert (=> b!135259 (= e!89773 (not (arrayRangesEq!197 arr!237 (_2!6193 lt!209901) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135260 () Bool)

(declare-fun res!112474 () Bool)

(assert (=> b!135260 (=> (not res!112474) (not e!89779))))

(assert (=> b!135260 (= res!112474 (invariant!0 (currentBit!5979 thiss!1634) (currentByte!5984 thiss!1634) (size!2794 (buf!3187 thiss!1634))))))

(assert (= (and start!26372 res!112472) b!135258))

(assert (= (and b!135258 res!112476) b!135251))

(assert (= (and b!135251 res!112463) b!135260))

(assert (= (and b!135260 res!112474) b!135247))

(assert (= (and b!135247 res!112468) b!135255))

(assert (= (and b!135255 res!112469) b!135249))

(assert (= (and b!135249 res!112470) b!135246))

(assert (= (and b!135247 res!112471) b!135253))

(assert (= (and b!135253 res!112475) b!135256))

(assert (= (and b!135256 res!112464) b!135252))

(assert (= (and b!135252 (not res!112467)) b!135259))

(assert (= (and b!135247 res!112466) b!135254))

(assert (= (and b!135247 res!112465) b!135248))

(assert (= (and b!135247 (not res!112473)) b!135257))

(assert (= start!26372 b!135250))

(declare-fun m!206227 () Bool)

(assert (=> b!135252 m!206227))

(declare-fun m!206229 () Bool)

(assert (=> b!135252 m!206229))

(declare-fun m!206231 () Bool)

(assert (=> b!135252 m!206231))

(declare-fun m!206233 () Bool)

(assert (=> b!135252 m!206233))

(declare-fun m!206235 () Bool)

(assert (=> b!135246 m!206235))

(declare-fun m!206237 () Bool)

(assert (=> b!135246 m!206237))

(declare-fun m!206239 () Bool)

(assert (=> b!135246 m!206239))

(declare-fun m!206241 () Bool)

(assert (=> b!135253 m!206241))

(declare-fun m!206243 () Bool)

(assert (=> b!135253 m!206243))

(declare-fun m!206245 () Bool)

(assert (=> b!135249 m!206245))

(declare-fun m!206247 () Bool)

(assert (=> b!135259 m!206247))

(declare-fun m!206249 () Bool)

(assert (=> b!135257 m!206249))

(declare-fun m!206251 () Bool)

(assert (=> b!135257 m!206251))

(assert (=> b!135255 m!206243))

(declare-fun m!206253 () Bool)

(assert (=> b!135255 m!206253))

(declare-fun m!206255 () Bool)

(assert (=> start!26372 m!206255))

(declare-fun m!206257 () Bool)

(assert (=> start!26372 m!206257))

(declare-fun m!206259 () Bool)

(assert (=> b!135250 m!206259))

(declare-fun m!206261 () Bool)

(assert (=> b!135254 m!206261))

(declare-fun m!206263 () Bool)

(assert (=> b!135247 m!206263))

(declare-fun m!206265 () Bool)

(assert (=> b!135247 m!206265))

(declare-fun m!206267 () Bool)

(assert (=> b!135247 m!206267))

(declare-fun m!206269 () Bool)

(assert (=> b!135247 m!206269))

(assert (=> b!135247 m!206269))

(declare-fun m!206271 () Bool)

(assert (=> b!135247 m!206271))

(assert (=> b!135247 m!206233))

(declare-fun m!206273 () Bool)

(assert (=> b!135247 m!206273))

(declare-fun m!206275 () Bool)

(assert (=> b!135247 m!206275))

(declare-fun m!206277 () Bool)

(assert (=> b!135247 m!206277))

(declare-fun m!206279 () Bool)

(assert (=> b!135247 m!206279))

(declare-fun m!206281 () Bool)

(assert (=> b!135247 m!206281))

(declare-fun m!206283 () Bool)

(assert (=> b!135247 m!206283))

(assert (=> b!135247 m!206235))

(declare-fun m!206285 () Bool)

(assert (=> b!135247 m!206285))

(declare-fun m!206287 () Bool)

(assert (=> b!135247 m!206287))

(declare-fun m!206289 () Bool)

(assert (=> b!135247 m!206289))

(declare-fun m!206291 () Bool)

(assert (=> b!135247 m!206291))

(declare-fun m!206293 () Bool)

(assert (=> b!135247 m!206293))

(declare-fun m!206295 () Bool)

(assert (=> b!135247 m!206295))

(declare-fun m!206297 () Bool)

(assert (=> b!135247 m!206297))

(declare-fun m!206299 () Bool)

(assert (=> b!135247 m!206299))

(declare-fun m!206301 () Bool)

(assert (=> b!135247 m!206301))

(declare-fun m!206303 () Bool)

(assert (=> b!135247 m!206303))

(declare-fun m!206305 () Bool)

(assert (=> b!135247 m!206305))

(declare-fun m!206307 () Bool)

(assert (=> b!135247 m!206307))

(declare-fun m!206309 () Bool)

(assert (=> b!135247 m!206309))

(declare-fun m!206311 () Bool)

(assert (=> b!135247 m!206311))

(assert (=> b!135247 m!206235))

(declare-fun m!206313 () Bool)

(assert (=> b!135258 m!206313))

(declare-fun m!206315 () Bool)

(assert (=> b!135260 m!206315))

(declare-fun m!206317 () Bool)

(assert (=> b!135256 m!206317))

(push 1)

(assert (not b!135260))

(assert (not b!135258))

(assert (not b!135256))

(assert (not b!135249))

(assert (not start!26372))

(assert (not b!135254))

(assert (not b!135253))

(assert (not b!135247))

(assert (not b!135255))

(assert (not b!135259))

(assert (not b!135257))

(assert (not b!135250))

(assert (not b!135246))

(assert (not b!135252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

