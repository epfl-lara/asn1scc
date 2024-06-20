; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41912 () Bool)

(assert start!41912)

(declare-fun b!197260 () Bool)

(declare-fun e!135491 () Bool)

(declare-datatypes ((array!10097 0))(
  ( (array!10098 (arr!5380 (Array (_ BitVec 32) (_ BitVec 8))) (size!4450 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8008 0))(
  ( (BitStream!8009 (buf!4936 array!10097) (currentByte!9274 (_ BitVec 32)) (currentBit!9269 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8008)

(declare-fun array_inv!4191 (array!10097) Bool)

(assert (=> b!197260 (= e!135491 (array_inv!4191 (buf!4936 thiss!1204)))))

(declare-fun b!197261 () Bool)

(declare-fun res!165094 () Bool)

(declare-fun e!135494 () Bool)

(assert (=> b!197261 (=> res!165094 e!135494)))

(declare-datatypes ((Unit!13965 0))(
  ( (Unit!13966) )
))
(declare-datatypes ((tuple2!17060 0))(
  ( (tuple2!17061 (_1!9175 Unit!13965) (_2!9175 BitStream!8008)) )
))
(declare-fun lt!307101 () tuple2!17060)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!197261 (= res!165094 (not (invariant!0 (currentBit!9269 (_2!9175 lt!307101)) (currentByte!9274 (_2!9175 lt!307101)) (size!4450 (buf!4936 (_2!9175 lt!307101))))))))

(declare-fun b!197262 () Bool)

(declare-fun e!135488 () Bool)

(declare-fun e!135490 () Bool)

(assert (=> b!197262 (= e!135488 e!135490)))

(declare-fun res!165097 () Bool)

(assert (=> b!197262 (=> (not res!165097) (not e!135490))))

(declare-datatypes ((tuple2!17062 0))(
  ( (tuple2!17063 (_1!9176 BitStream!8008) (_2!9176 Bool)) )
))
(declare-fun lt!307103 () tuple2!17062)

(declare-fun lt!307098 () Bool)

(declare-fun lt!307102 () tuple2!17060)

(assert (=> b!197262 (= res!165097 (and (= (_2!9176 lt!307103) lt!307098) (= (_1!9176 lt!307103) (_2!9175 lt!307102))))))

(declare-fun readBitPure!0 (BitStream!8008) tuple2!17062)

(declare-fun readerFrom!0 (BitStream!8008 (_ BitVec 32) (_ BitVec 32)) BitStream!8008)

(assert (=> b!197262 (= lt!307103 (readBitPure!0 (readerFrom!0 (_2!9175 lt!307102) (currentBit!9269 thiss!1204) (currentByte!9274 thiss!1204))))))

(declare-fun b!197263 () Bool)

(declare-fun res!165088 () Bool)

(assert (=> b!197263 (=> res!165088 e!135494)))

(declare-fun isPrefixOf!0 (BitStream!8008 BitStream!8008) Bool)

(assert (=> b!197263 (= res!165088 (not (isPrefixOf!0 (_2!9175 lt!307102) (_2!9175 lt!307101))))))

(declare-fun b!197264 () Bool)

(declare-fun res!165090 () Bool)

(declare-fun e!135487 () Bool)

(assert (=> b!197264 (=> (not res!165090) (not e!135487))))

(assert (=> b!197264 (= res!165090 (invariant!0 (currentBit!9269 thiss!1204) (currentByte!9274 thiss!1204) (size!4450 (buf!4936 thiss!1204))))))

(declare-fun b!197265 () Bool)

(declare-fun e!135492 () Bool)

(assert (=> b!197265 (= e!135487 (not e!135492))))

(declare-fun res!165089 () Bool)

(assert (=> b!197265 (=> res!165089 e!135492)))

(declare-fun lt!307100 () (_ BitVec 64))

(declare-fun lt!307096 () (_ BitVec 64))

(assert (=> b!197265 (= res!165089 (not (= lt!307100 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307096))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197265 (= lt!307100 (bitIndex!0 (size!4450 (buf!4936 (_2!9175 lt!307102))) (currentByte!9274 (_2!9175 lt!307102)) (currentBit!9269 (_2!9175 lt!307102))))))

(assert (=> b!197265 (= lt!307096 (bitIndex!0 (size!4450 (buf!4936 thiss!1204)) (currentByte!9274 thiss!1204) (currentBit!9269 thiss!1204)))))

(declare-fun e!135489 () Bool)

(assert (=> b!197265 e!135489))

(declare-fun res!165099 () Bool)

(assert (=> b!197265 (=> (not res!165099) (not e!135489))))

(assert (=> b!197265 (= res!165099 (= (size!4450 (buf!4936 thiss!1204)) (size!4450 (buf!4936 (_2!9175 lt!307102)))))))

(declare-fun appendBit!0 (BitStream!8008 Bool) tuple2!17060)

(assert (=> b!197265 (= lt!307102 (appendBit!0 thiss!1204 lt!307098))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!197265 (= lt!307098 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!197266 () Bool)

(declare-fun res!165098 () Bool)

(assert (=> b!197266 (=> (not res!165098) (not e!135487))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!197266 (= res!165098 (not (= i!590 nBits!348)))))

(declare-fun b!197267 () Bool)

(assert (=> b!197267 (= e!135492 e!135494)))

(declare-fun res!165091 () Bool)

(assert (=> b!197267 (=> res!165091 e!135494)))

(declare-fun lt!307105 () (_ BitVec 64))

(assert (=> b!197267 (= res!165091 (not (= lt!307105 (bvsub (bvsub (bvadd lt!307100 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!197267 (= lt!307105 (bitIndex!0 (size!4450 (buf!4936 (_2!9175 lt!307101))) (currentByte!9274 (_2!9175 lt!307101)) (currentBit!9269 (_2!9175 lt!307101))))))

(assert (=> b!197267 (isPrefixOf!0 thiss!1204 (_2!9175 lt!307101))))

(declare-fun lt!307097 () Unit!13965)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8008 BitStream!8008 BitStream!8008) Unit!13965)

(assert (=> b!197267 (= lt!307097 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9175 lt!307102) (_2!9175 lt!307101)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8008 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17060)

(assert (=> b!197267 (= lt!307101 (appendBitsLSBFirstLoopTR!0 (_2!9175 lt!307102) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!197268 () Bool)

(declare-fun res!165092 () Bool)

(assert (=> b!197268 (=> res!165092 e!135494)))

(assert (=> b!197268 (= res!165092 (or (not (= (size!4450 (buf!4936 (_2!9175 lt!307101))) (size!4450 (buf!4936 thiss!1204)))) (not (= lt!307105 (bvsub (bvadd lt!307096 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!197269 () Bool)

(declare-fun res!165093 () Bool)

(assert (=> b!197269 (=> (not res!165093) (not e!135487))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197269 (= res!165093 (validate_offset_bits!1 ((_ sign_extend 32) (size!4450 (buf!4936 thiss!1204))) ((_ sign_extend 32) (currentByte!9274 thiss!1204)) ((_ sign_extend 32) (currentBit!9269 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!197270 () Bool)

(assert (=> b!197270 (= e!135489 e!135488)))

(declare-fun res!165095 () Bool)

(assert (=> b!197270 (=> (not res!165095) (not e!135488))))

(declare-fun lt!307104 () (_ BitVec 64))

(declare-fun lt!307099 () (_ BitVec 64))

(assert (=> b!197270 (= res!165095 (= lt!307104 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307099)))))

(assert (=> b!197270 (= lt!307104 (bitIndex!0 (size!4450 (buf!4936 (_2!9175 lt!307102))) (currentByte!9274 (_2!9175 lt!307102)) (currentBit!9269 (_2!9175 lt!307102))))))

(assert (=> b!197270 (= lt!307099 (bitIndex!0 (size!4450 (buf!4936 thiss!1204)) (currentByte!9274 thiss!1204) (currentBit!9269 thiss!1204)))))

(declare-fun b!197271 () Bool)

(assert (=> b!197271 (= e!135494 (isPrefixOf!0 thiss!1204 (_2!9175 lt!307102)))))

(declare-fun res!165096 () Bool)

(assert (=> start!41912 (=> (not res!165096) (not e!135487))))

(assert (=> start!41912 (= res!165096 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41912 e!135487))

(assert (=> start!41912 true))

(declare-fun inv!12 (BitStream!8008) Bool)

(assert (=> start!41912 (and (inv!12 thiss!1204) e!135491)))

(declare-fun b!197272 () Bool)

(declare-fun res!165087 () Bool)

(assert (=> b!197272 (=> (not res!165087) (not e!135488))))

(assert (=> b!197272 (= res!165087 (isPrefixOf!0 thiss!1204 (_2!9175 lt!307102)))))

(declare-fun b!197273 () Bool)

(assert (=> b!197273 (= e!135490 (= (bitIndex!0 (size!4450 (buf!4936 (_1!9176 lt!307103))) (currentByte!9274 (_1!9176 lt!307103)) (currentBit!9269 (_1!9176 lt!307103))) lt!307104))))

(assert (= (and start!41912 res!165096) b!197269))

(assert (= (and b!197269 res!165093) b!197264))

(assert (= (and b!197264 res!165090) b!197266))

(assert (= (and b!197266 res!165098) b!197265))

(assert (= (and b!197265 res!165099) b!197270))

(assert (= (and b!197270 res!165095) b!197272))

(assert (= (and b!197272 res!165087) b!197262))

(assert (= (and b!197262 res!165097) b!197273))

(assert (= (and b!197265 (not res!165089)) b!197267))

(assert (= (and b!197267 (not res!165091)) b!197261))

(assert (= (and b!197261 (not res!165094)) b!197268))

(assert (= (and b!197268 (not res!165092)) b!197263))

(assert (= (and b!197263 (not res!165088)) b!197271))

(assert (= start!41912 b!197260))

(declare-fun m!304877 () Bool)

(assert (=> b!197264 m!304877))

(declare-fun m!304879 () Bool)

(assert (=> b!197271 m!304879))

(declare-fun m!304881 () Bool)

(assert (=> b!197263 m!304881))

(declare-fun m!304883 () Bool)

(assert (=> b!197273 m!304883))

(declare-fun m!304885 () Bool)

(assert (=> b!197261 m!304885))

(declare-fun m!304887 () Bool)

(assert (=> b!197262 m!304887))

(assert (=> b!197262 m!304887))

(declare-fun m!304889 () Bool)

(assert (=> b!197262 m!304889))

(declare-fun m!304891 () Bool)

(assert (=> b!197269 m!304891))

(assert (=> b!197272 m!304879))

(declare-fun m!304893 () Bool)

(assert (=> b!197270 m!304893))

(declare-fun m!304895 () Bool)

(assert (=> b!197270 m!304895))

(declare-fun m!304897 () Bool)

(assert (=> b!197267 m!304897))

(declare-fun m!304899 () Bool)

(assert (=> b!197267 m!304899))

(declare-fun m!304901 () Bool)

(assert (=> b!197267 m!304901))

(declare-fun m!304903 () Bool)

(assert (=> b!197267 m!304903))

(declare-fun m!304905 () Bool)

(assert (=> b!197260 m!304905))

(declare-fun m!304907 () Bool)

(assert (=> start!41912 m!304907))

(assert (=> b!197265 m!304893))

(assert (=> b!197265 m!304895))

(declare-fun m!304909 () Bool)

(assert (=> b!197265 m!304909))

(push 1)

(assert (not start!41912))

(assert (not b!197264))

(assert (not b!197261))

(assert (not b!197270))

