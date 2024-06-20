; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43046 () Bool)

(assert start!43046)

(declare-fun b!202929 () Bool)

(declare-fun e!139100 () Bool)

(declare-fun e!139103 () Bool)

(assert (=> b!202929 (= e!139100 e!139103)))

(declare-fun res!169983 () Bool)

(assert (=> b!202929 (=> (not res!169983) (not e!139103))))

(declare-datatypes ((array!10300 0))(
  ( (array!10301 (arr!5462 (Array (_ BitVec 32) (_ BitVec 8))) (size!4532 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8172 0))(
  ( (BitStream!8173 (buf!5037 array!10300) (currentByte!9486 (_ BitVec 32)) (currentBit!9481 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14423 0))(
  ( (Unit!14424) )
))
(declare-datatypes ((tuple2!17364 0))(
  ( (tuple2!17365 (_1!9334 Unit!14423) (_2!9334 BitStream!8172)) )
))
(declare-fun lt!316394 () tuple2!17364)

(declare-fun lt!316397 () Bool)

(declare-datatypes ((tuple2!17366 0))(
  ( (tuple2!17367 (_1!9335 BitStream!8172) (_2!9335 Bool)) )
))
(declare-fun lt!316390 () tuple2!17366)

(assert (=> b!202929 (= res!169983 (and (= (_2!9335 lt!316390) lt!316397) (= (_1!9335 lt!316390) (_2!9334 lt!316394))))))

(declare-fun thiss!1204 () BitStream!8172)

(declare-fun readBitPure!0 (BitStream!8172) tuple2!17366)

(declare-fun readerFrom!0 (BitStream!8172 (_ BitVec 32) (_ BitVec 32)) BitStream!8172)

(assert (=> b!202929 (= lt!316390 (readBitPure!0 (readerFrom!0 (_2!9334 lt!316394) (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204))))))

(declare-fun b!202930 () Bool)

(declare-fun lt!316396 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202930 (= e!139103 (= (bitIndex!0 (size!4532 (buf!5037 (_1!9335 lt!316390))) (currentByte!9486 (_1!9335 lt!316390)) (currentBit!9481 (_1!9335 lt!316390))) lt!316396))))

(declare-fun b!202931 () Bool)

(declare-fun res!169989 () Bool)

(assert (=> b!202931 (=> (not res!169989) (not e!139100))))

(declare-fun isPrefixOf!0 (BitStream!8172 BitStream!8172) Bool)

(assert (=> b!202931 (= res!169989 (isPrefixOf!0 thiss!1204 (_2!9334 lt!316394)))))

(declare-fun b!202932 () Bool)

(declare-fun e!139098 () Bool)

(declare-fun e!139101 () Bool)

(assert (=> b!202932 (= e!139098 (not e!139101))))

(declare-fun res!169986 () Bool)

(assert (=> b!202932 (=> res!169986 e!139101)))

(declare-fun lt!316388 () (_ BitVec 64))

(declare-fun lt!316392 () (_ BitVec 64))

(assert (=> b!202932 (= res!169986 (not (= lt!316388 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!316392))))))

(assert (=> b!202932 (= lt!316388 (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))))))

(assert (=> b!202932 (= lt!316392 (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204)))))

(declare-fun e!139102 () Bool)

(assert (=> b!202932 e!139102))

(declare-fun res!169990 () Bool)

(assert (=> b!202932 (=> (not res!169990) (not e!139102))))

(assert (=> b!202932 (= res!169990 (= (size!4532 (buf!5037 thiss!1204)) (size!4532 (buf!5037 (_2!9334 lt!316394)))))))

(declare-fun appendBit!0 (BitStream!8172 Bool) tuple2!17364)

(assert (=> b!202932 (= lt!316394 (appendBit!0 thiss!1204 lt!316397))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!202932 (= lt!316397 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202933 () Bool)

(declare-fun res!169991 () Bool)

(assert (=> b!202933 (=> (not res!169991) (not e!139098))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202933 (= res!169991 (not (= i!590 nBits!348)))))

(declare-fun b!202935 () Bool)

(declare-fun res!169985 () Bool)

(assert (=> b!202935 (=> (not res!169985) (not e!139098))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202935 (= res!169985 (validate_offset_bits!1 ((_ sign_extend 32) (size!4532 (buf!5037 thiss!1204))) ((_ sign_extend 32) (currentByte!9486 thiss!1204)) ((_ sign_extend 32) (currentBit!9481 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202936 () Bool)

(declare-fun res!169984 () Bool)

(assert (=> b!202936 (=> (not res!169984) (not e!139098))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202936 (= res!169984 (invariant!0 (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204) (size!4532 (buf!5037 thiss!1204))))))

(declare-fun res!169987 () Bool)

(assert (=> start!43046 (=> (not res!169987) (not e!139098))))

(assert (=> start!43046 (= res!169987 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43046 e!139098))

(assert (=> start!43046 true))

(declare-fun e!139104 () Bool)

(declare-fun inv!12 (BitStream!8172) Bool)

(assert (=> start!43046 (and (inv!12 thiss!1204) e!139104)))

(declare-fun b!202934 () Bool)

(assert (=> b!202934 (= e!139102 e!139100)))

(declare-fun res!169988 () Bool)

(assert (=> b!202934 (=> (not res!169988) (not e!139100))))

(declare-fun lt!316393 () (_ BitVec 64))

(assert (=> b!202934 (= res!169988 (= lt!316396 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!316393)))))

(assert (=> b!202934 (= lt!316396 (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))))))

(assert (=> b!202934 (= lt!316393 (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204)))))

(declare-fun b!202937 () Bool)

(declare-fun array_inv!4273 (array!10300) Bool)

(assert (=> b!202937 (= e!139104 (array_inv!4273 (buf!5037 thiss!1204)))))

(declare-fun lt!316389 () (_ BitVec 64))

(declare-fun b!202938 () Bool)

(declare-fun lt!316395 () (_ BitVec 64))

(assert (=> b!202938 (= e!139101 (or (= lt!316395 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!316395 (bvand (bvsub lt!316389 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!202938 (= lt!316395 (bvand lt!316389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!202938 (= lt!316389 (bvadd lt!316388 ((_ sign_extend 32) nBits!348)))))

(declare-fun lt!316391 () tuple2!17364)

(assert (=> b!202938 (isPrefixOf!0 thiss!1204 (_2!9334 lt!316391))))

(declare-fun lt!316387 () Unit!14423)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8172 BitStream!8172 BitStream!8172) Unit!14423)

(assert (=> b!202938 (= lt!316387 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9334 lt!316394) (_2!9334 lt!316391)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8172 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17364)

(assert (=> b!202938 (= lt!316391 (appendBitsLSBFirstLoopTR!0 (_2!9334 lt!316394) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!43046 res!169987) b!202935))

(assert (= (and b!202935 res!169985) b!202936))

(assert (= (and b!202936 res!169984) b!202933))

(assert (= (and b!202933 res!169991) b!202932))

(assert (= (and b!202932 res!169990) b!202934))

(assert (= (and b!202934 res!169988) b!202931))

(assert (= (and b!202931 res!169989) b!202929))

(assert (= (and b!202929 res!169983) b!202930))

(assert (= (and b!202932 (not res!169986)) b!202938))

(assert (= start!43046 b!202937))

(declare-fun m!313603 () Bool)

(assert (=> b!202929 m!313603))

(assert (=> b!202929 m!313603))

(declare-fun m!313605 () Bool)

(assert (=> b!202929 m!313605))

(declare-fun m!313607 () Bool)

(assert (=> start!43046 m!313607))

(declare-fun m!313609 () Bool)

(assert (=> b!202930 m!313609))

(declare-fun m!313611 () Bool)

(assert (=> b!202931 m!313611))

(declare-fun m!313613 () Bool)

(assert (=> b!202934 m!313613))

(declare-fun m!313615 () Bool)

(assert (=> b!202934 m!313615))

(assert (=> b!202932 m!313613))

(assert (=> b!202932 m!313615))

(declare-fun m!313617 () Bool)

(assert (=> b!202932 m!313617))

(declare-fun m!313619 () Bool)

(assert (=> b!202938 m!313619))

(declare-fun m!313621 () Bool)

(assert (=> b!202938 m!313621))

(declare-fun m!313623 () Bool)

(assert (=> b!202938 m!313623))

(declare-fun m!313625 () Bool)

(assert (=> b!202936 m!313625))

(declare-fun m!313627 () Bool)

(assert (=> b!202937 m!313627))

(declare-fun m!313629 () Bool)

(assert (=> b!202935 m!313629))

(check-sat (not b!202932) (not b!202931) (not b!202936) (not b!202937) (not b!202929) (not start!43046) (not b!202935) (not b!202930) (not b!202938) (not b!202934))
(check-sat)
(get-model)

(declare-fun d!69375 () Bool)

(declare-fun res!170027 () Bool)

(declare-fun e!139130 () Bool)

(assert (=> d!69375 (=> (not res!170027) (not e!139130))))

(assert (=> d!69375 (= res!170027 (= (size!4532 (buf!5037 thiss!1204)) (size!4532 (buf!5037 (_2!9334 lt!316391)))))))

(assert (=> d!69375 (= (isPrefixOf!0 thiss!1204 (_2!9334 lt!316391)) e!139130)))

(declare-fun b!202975 () Bool)

(declare-fun res!170025 () Bool)

(assert (=> b!202975 (=> (not res!170025) (not e!139130))))

(assert (=> b!202975 (= res!170025 (bvsle (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204)) (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316391))) (currentByte!9486 (_2!9334 lt!316391)) (currentBit!9481 (_2!9334 lt!316391)))))))

(declare-fun b!202976 () Bool)

(declare-fun e!139131 () Bool)

(assert (=> b!202976 (= e!139130 e!139131)))

(declare-fun res!170026 () Bool)

(assert (=> b!202976 (=> res!170026 e!139131)))

(assert (=> b!202976 (= res!170026 (= (size!4532 (buf!5037 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202977 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10300 array!10300 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202977 (= e!139131 (arrayBitRangesEq!0 (buf!5037 thiss!1204) (buf!5037 (_2!9334 lt!316391)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204))))))

(assert (= (and d!69375 res!170027) b!202975))

(assert (= (and b!202975 res!170025) b!202976))

(assert (= (and b!202976 (not res!170026)) b!202977))

(assert (=> b!202975 m!313615))

(declare-fun m!313659 () Bool)

(assert (=> b!202975 m!313659))

(assert (=> b!202977 m!313615))

(assert (=> b!202977 m!313615))

(declare-fun m!313661 () Bool)

(assert (=> b!202977 m!313661))

(assert (=> b!202938 d!69375))

(declare-fun d!69377 () Bool)

(assert (=> d!69377 (isPrefixOf!0 thiss!1204 (_2!9334 lt!316391))))

(declare-fun lt!316433 () Unit!14423)

(declare-fun choose!30 (BitStream!8172 BitStream!8172 BitStream!8172) Unit!14423)

(assert (=> d!69377 (= lt!316433 (choose!30 thiss!1204 (_2!9334 lt!316394) (_2!9334 lt!316391)))))

(assert (=> d!69377 (isPrefixOf!0 thiss!1204 (_2!9334 lt!316394))))

(assert (=> d!69377 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9334 lt!316394) (_2!9334 lt!316391)) lt!316433)))

(declare-fun bs!17109 () Bool)

(assert (= bs!17109 d!69377))

(assert (=> bs!17109 m!313619))

(declare-fun m!313663 () Bool)

(assert (=> bs!17109 m!313663))

(assert (=> bs!17109 m!313611))

(assert (=> b!202938 d!69377))

(declare-fun b!203078 () Bool)

(declare-fun e!139194 () (_ BitVec 64))

(assert (=> b!203078 (= e!139194 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun d!69379 () Bool)

(declare-fun e!139191 () Bool)

(assert (=> d!69379 e!139191))

(declare-fun res!170127 () Bool)

(assert (=> d!69379 (=> (not res!170127) (not e!139191))))

(declare-fun lt!316640 () tuple2!17364)

(assert (=> d!69379 (= res!170127 (invariant!0 (currentBit!9481 (_2!9334 lt!316640)) (currentByte!9486 (_2!9334 lt!316640)) (size!4532 (buf!5037 (_2!9334 lt!316640)))))))

(declare-fun e!139189 () tuple2!17364)

(assert (=> d!69379 (= lt!316640 e!139189)))

(declare-fun c!10067 () Bool)

(assert (=> d!69379 (= c!10067 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69379 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69379 (= (appendBitsLSBFirstLoopTR!0 (_2!9334 lt!316394) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!316640)))

(declare-fun b!203079 () Bool)

(declare-fun res!170128 () Bool)

(declare-fun lt!316657 () tuple2!17364)

(assert (=> b!203079 (= res!170128 (isPrefixOf!0 (_2!9334 lt!316394) (_2!9334 lt!316657)))))

(declare-fun e!139188 () Bool)

(assert (=> b!203079 (=> (not res!170128) (not e!139188))))

(declare-fun b!203080 () Bool)

(declare-fun e!139193 () Bool)

(declare-fun lt!316675 () tuple2!17366)

(declare-fun lt!316678 () tuple2!17366)

(assert (=> b!203080 (= e!139193 (= (_2!9335 lt!316675) (_2!9335 lt!316678)))))

(declare-fun b!203081 () Bool)

(declare-fun Unit!14427 () Unit!14423)

(assert (=> b!203081 (= e!139189 (tuple2!17365 Unit!14427 (_2!9334 lt!316394)))))

(declare-fun lt!316633 () Unit!14423)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8172) Unit!14423)

(assert (=> b!203081 (= lt!316633 (lemmaIsPrefixRefl!0 (_2!9334 lt!316394)))))

(declare-fun call!3201 () Bool)

(assert (=> b!203081 call!3201))

(declare-fun lt!316634 () Unit!14423)

(assert (=> b!203081 (= lt!316634 lt!316633)))

(declare-fun b!203082 () Bool)

(declare-fun e!139190 () Bool)

(declare-datatypes ((tuple2!17372 0))(
  ( (tuple2!17373 (_1!9338 BitStream!8172) (_2!9338 (_ BitVec 64))) )
))
(declare-fun lt!316684 () tuple2!17372)

(declare-datatypes ((tuple2!17374 0))(
  ( (tuple2!17375 (_1!9339 BitStream!8172) (_2!9339 BitStream!8172)) )
))
(declare-fun lt!316685 () tuple2!17374)

(assert (=> b!203082 (= e!139190 (= (_1!9338 lt!316684) (_2!9339 lt!316685)))))

(declare-fun b!203083 () Bool)

(declare-fun e!139195 () Bool)

(assert (=> b!203083 (= e!139191 e!139195)))

(declare-fun res!170122 () Bool)

(assert (=> b!203083 (=> (not res!170122) (not e!139195))))

(declare-fun lt!316665 () tuple2!17372)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203083 (= res!170122 (= (_2!9338 lt!316665) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!316638 () tuple2!17374)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17372)

(assert (=> b!203083 (= lt!316665 (readNBitsLSBFirstsLoopPure!0 (_1!9339 lt!316638) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!316642 () Unit!14423)

(declare-fun lt!316688 () Unit!14423)

(assert (=> b!203083 (= lt!316642 lt!316688)))

(declare-fun lt!316641 () (_ BitVec 64))

(assert (=> b!203083 (validate_offset_bits!1 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316640)))) ((_ sign_extend 32) (currentByte!9486 (_2!9334 lt!316394))) ((_ sign_extend 32) (currentBit!9481 (_2!9334 lt!316394))) lt!316641)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8172 array!10300 (_ BitVec 64)) Unit!14423)

(assert (=> b!203083 (= lt!316688 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9334 lt!316394) (buf!5037 (_2!9334 lt!316640)) lt!316641))))

(declare-fun e!139196 () Bool)

(assert (=> b!203083 e!139196))

(declare-fun res!170126 () Bool)

(assert (=> b!203083 (=> (not res!170126) (not e!139196))))

(assert (=> b!203083 (= res!170126 (and (= (size!4532 (buf!5037 (_2!9334 lt!316394))) (size!4532 (buf!5037 (_2!9334 lt!316640)))) (bvsge lt!316641 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203083 (= lt!316641 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203083 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8172 BitStream!8172) tuple2!17374)

(assert (=> b!203083 (= lt!316638 (reader!0 (_2!9334 lt!316394) (_2!9334 lt!316640)))))

(declare-fun lt!316654 () tuple2!17364)

(declare-fun bm!3198 () Bool)

(assert (=> bm!3198 (= call!3201 (isPrefixOf!0 (_2!9334 lt!316394) (ite c!10067 (_2!9334 lt!316394) (_2!9334 lt!316654))))))

(declare-fun b!203084 () Bool)

(declare-fun res!170120 () Bool)

(assert (=> b!203084 (= res!170120 (= (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316657))) (currentByte!9486 (_2!9334 lt!316657)) (currentBit!9481 (_2!9334 lt!316657))) (bvadd (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!203084 (=> (not res!170120) (not e!139188))))

(declare-fun b!203085 () Bool)

(assert (=> b!203085 (= e!139195 (= (_1!9338 lt!316665) (_2!9339 lt!316638)))))

(declare-fun b!203086 () Bool)

(declare-fun res!170124 () Bool)

(assert (=> b!203086 (=> (not res!170124) (not e!139191))))

(assert (=> b!203086 (= res!170124 (isPrefixOf!0 (_2!9334 lt!316394) (_2!9334 lt!316640)))))

(declare-fun b!203087 () Bool)

(assert (=> b!203087 (= e!139189 (tuple2!17365 (_1!9334 lt!316654) (_2!9334 lt!316654)))))

(declare-fun lt!316673 () Bool)

(assert (=> b!203087 (= lt!316673 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203087 (= lt!316657 (appendBit!0 (_2!9334 lt!316394) lt!316673))))

(declare-fun res!170125 () Bool)

(assert (=> b!203087 (= res!170125 (= (size!4532 (buf!5037 (_2!9334 lt!316394))) (size!4532 (buf!5037 (_2!9334 lt!316657)))))))

(assert (=> b!203087 (=> (not res!170125) (not e!139188))))

(assert (=> b!203087 e!139188))

(declare-fun lt!316660 () tuple2!17364)

(assert (=> b!203087 (= lt!316660 lt!316657)))

(assert (=> b!203087 (= lt!316654 (appendBitsLSBFirstLoopTR!0 (_2!9334 lt!316660) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!316662 () Unit!14423)

(assert (=> b!203087 (= lt!316662 (lemmaIsPrefixTransitive!0 (_2!9334 lt!316394) (_2!9334 lt!316660) (_2!9334 lt!316654)))))

(assert (=> b!203087 call!3201))

(declare-fun lt!316677 () Unit!14423)

(assert (=> b!203087 (= lt!316677 lt!316662)))

(assert (=> b!203087 (invariant!0 (currentBit!9481 (_2!9334 lt!316394)) (currentByte!9486 (_2!9334 lt!316394)) (size!4532 (buf!5037 (_2!9334 lt!316660))))))

(declare-fun lt!316668 () BitStream!8172)

(assert (=> b!203087 (= lt!316668 (BitStream!8173 (buf!5037 (_2!9334 lt!316660)) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))))))

(assert (=> b!203087 (invariant!0 (currentBit!9481 lt!316668) (currentByte!9486 lt!316668) (size!4532 (buf!5037 (_2!9334 lt!316654))))))

(declare-fun lt!316650 () BitStream!8172)

(assert (=> b!203087 (= lt!316650 (BitStream!8173 (buf!5037 (_2!9334 lt!316654)) (currentByte!9486 lt!316668) (currentBit!9481 lt!316668)))))

(assert (=> b!203087 (= lt!316675 (readBitPure!0 lt!316668))))

(assert (=> b!203087 (= lt!316678 (readBitPure!0 lt!316650))))

(declare-fun lt!316648 () Unit!14423)

(declare-fun readBitPrefixLemma!0 (BitStream!8172 BitStream!8172) Unit!14423)

(assert (=> b!203087 (= lt!316648 (readBitPrefixLemma!0 lt!316668 (_2!9334 lt!316654)))))

(declare-fun res!170119 () Bool)

(assert (=> b!203087 (= res!170119 (= (bitIndex!0 (size!4532 (buf!5037 (_1!9335 lt!316675))) (currentByte!9486 (_1!9335 lt!316675)) (currentBit!9481 (_1!9335 lt!316675))) (bitIndex!0 (size!4532 (buf!5037 (_1!9335 lt!316678))) (currentByte!9486 (_1!9335 lt!316678)) (currentBit!9481 (_1!9335 lt!316678)))))))

(assert (=> b!203087 (=> (not res!170119) (not e!139193))))

(assert (=> b!203087 e!139193))

(declare-fun lt!316643 () Unit!14423)

(assert (=> b!203087 (= lt!316643 lt!316648)))

(declare-fun lt!316659 () tuple2!17374)

(assert (=> b!203087 (= lt!316659 (reader!0 (_2!9334 lt!316394) (_2!9334 lt!316654)))))

(declare-fun lt!316645 () tuple2!17374)

(assert (=> b!203087 (= lt!316645 (reader!0 (_2!9334 lt!316660) (_2!9334 lt!316654)))))

(declare-fun lt!316655 () tuple2!17366)

(assert (=> b!203087 (= lt!316655 (readBitPure!0 (_1!9339 lt!316659)))))

(assert (=> b!203087 (= (_2!9335 lt!316655) lt!316673)))

(declare-fun lt!316635 () Unit!14423)

(declare-fun Unit!14428 () Unit!14423)

(assert (=> b!203087 (= lt!316635 Unit!14428)))

(declare-fun lt!316646 () (_ BitVec 64))

(assert (=> b!203087 (= lt!316646 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316681 () (_ BitVec 64))

(assert (=> b!203087 (= lt!316681 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316670 () Unit!14423)

(assert (=> b!203087 (= lt!316670 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9334 lt!316394) (buf!5037 (_2!9334 lt!316654)) lt!316681))))

(assert (=> b!203087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316654)))) ((_ sign_extend 32) (currentByte!9486 (_2!9334 lt!316394))) ((_ sign_extend 32) (currentBit!9481 (_2!9334 lt!316394))) lt!316681)))

(declare-fun lt!316679 () Unit!14423)

(assert (=> b!203087 (= lt!316679 lt!316670)))

(declare-fun lt!316661 () tuple2!17372)

(assert (=> b!203087 (= lt!316661 (readNBitsLSBFirstsLoopPure!0 (_1!9339 lt!316659) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316646))))

(declare-fun lt!316683 () (_ BitVec 64))

(assert (=> b!203087 (= lt!316683 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!316664 () Unit!14423)

(assert (=> b!203087 (= lt!316664 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9334 lt!316660) (buf!5037 (_2!9334 lt!316654)) lt!316683))))

(assert (=> b!203087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316654)))) ((_ sign_extend 32) (currentByte!9486 (_2!9334 lt!316660))) ((_ sign_extend 32) (currentBit!9481 (_2!9334 lt!316660))) lt!316683)))

(declare-fun lt!316649 () Unit!14423)

(assert (=> b!203087 (= lt!316649 lt!316664)))

(declare-fun lt!316666 () tuple2!17372)

(assert (=> b!203087 (= lt!316666 (readNBitsLSBFirstsLoopPure!0 (_1!9339 lt!316645) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316646 (ite (_2!9335 lt!316655) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!316671 () tuple2!17372)

(assert (=> b!203087 (= lt!316671 (readNBitsLSBFirstsLoopPure!0 (_1!9339 lt!316659) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316646))))

(declare-fun c!10066 () Bool)

(assert (=> b!203087 (= c!10066 (_2!9335 (readBitPure!0 (_1!9339 lt!316659))))))

(declare-fun lt!316672 () tuple2!17372)

(declare-fun withMovedBitIndex!0 (BitStream!8172 (_ BitVec 64)) BitStream!8172)

(assert (=> b!203087 (= lt!316672 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9339 lt!316659) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316646 e!139194)))))

(declare-fun lt!316644 () Unit!14423)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14423)

(assert (=> b!203087 (= lt!316644 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9339 lt!316659) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316646))))

(assert (=> b!203087 (and (= (_2!9338 lt!316671) (_2!9338 lt!316672)) (= (_1!9338 lt!316671) (_1!9338 lt!316672)))))

(declare-fun lt!316652 () Unit!14423)

(assert (=> b!203087 (= lt!316652 lt!316644)))

(assert (=> b!203087 (= (_1!9339 lt!316659) (withMovedBitIndex!0 (_2!9339 lt!316659) (bvsub (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))) (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316654))) (currentByte!9486 (_2!9334 lt!316654)) (currentBit!9481 (_2!9334 lt!316654))))))))

(declare-fun lt!316658 () Unit!14423)

(declare-fun Unit!14429 () Unit!14423)

(assert (=> b!203087 (= lt!316658 Unit!14429)))

(assert (=> b!203087 (= (_1!9339 lt!316645) (withMovedBitIndex!0 (_2!9339 lt!316645) (bvsub (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316660))) (currentByte!9486 (_2!9334 lt!316660)) (currentBit!9481 (_2!9334 lt!316660))) (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316654))) (currentByte!9486 (_2!9334 lt!316654)) (currentBit!9481 (_2!9334 lt!316654))))))))

(declare-fun lt!316687 () Unit!14423)

(declare-fun Unit!14430 () Unit!14423)

(assert (=> b!203087 (= lt!316687 Unit!14430)))

(assert (=> b!203087 (= (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))) (bvsub (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316660))) (currentByte!9486 (_2!9334 lt!316660)) (currentBit!9481 (_2!9334 lt!316660))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!316669 () Unit!14423)

(declare-fun Unit!14431 () Unit!14423)

(assert (=> b!203087 (= lt!316669 Unit!14431)))

(assert (=> b!203087 (= (_2!9338 lt!316661) (_2!9338 lt!316666))))

(declare-fun lt!316686 () Unit!14423)

(declare-fun Unit!14432 () Unit!14423)

(assert (=> b!203087 (= lt!316686 Unit!14432)))

(assert (=> b!203087 (invariant!0 (currentBit!9481 (_2!9334 lt!316654)) (currentByte!9486 (_2!9334 lt!316654)) (size!4532 (buf!5037 (_2!9334 lt!316654))))))

(declare-fun lt!316636 () Unit!14423)

(declare-fun Unit!14433 () Unit!14423)

(assert (=> b!203087 (= lt!316636 Unit!14433)))

(assert (=> b!203087 (= (size!4532 (buf!5037 (_2!9334 lt!316394))) (size!4532 (buf!5037 (_2!9334 lt!316654))))))

(declare-fun lt!316674 () Unit!14423)

(declare-fun Unit!14434 () Unit!14423)

(assert (=> b!203087 (= lt!316674 Unit!14434)))

(assert (=> b!203087 (= (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316654))) (currentByte!9486 (_2!9334 lt!316654)) (currentBit!9481 (_2!9334 lt!316654))) (bvsub (bvadd (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316676 () Unit!14423)

(declare-fun Unit!14435 () Unit!14423)

(assert (=> b!203087 (= lt!316676 Unit!14435)))

(declare-fun lt!316651 () Unit!14423)

(declare-fun Unit!14436 () Unit!14423)

(assert (=> b!203087 (= lt!316651 Unit!14436)))

(assert (=> b!203087 (= lt!316685 (reader!0 (_2!9334 lt!316394) (_2!9334 lt!316654)))))

(declare-fun lt!316637 () (_ BitVec 64))

(assert (=> b!203087 (= lt!316637 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316647 () Unit!14423)

(assert (=> b!203087 (= lt!316647 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9334 lt!316394) (buf!5037 (_2!9334 lt!316654)) lt!316637))))

(assert (=> b!203087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316654)))) ((_ sign_extend 32) (currentByte!9486 (_2!9334 lt!316394))) ((_ sign_extend 32) (currentBit!9481 (_2!9334 lt!316394))) lt!316637)))

(declare-fun lt!316656 () Unit!14423)

(assert (=> b!203087 (= lt!316656 lt!316647)))

(assert (=> b!203087 (= lt!316684 (readNBitsLSBFirstsLoopPure!0 (_1!9339 lt!316685) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170123 () Bool)

(assert (=> b!203087 (= res!170123 (= (_2!9338 lt!316684) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!203087 (=> (not res!170123) (not e!139190))))

(assert (=> b!203087 e!139190))

(declare-fun lt!316663 () Unit!14423)

(declare-fun Unit!14437 () Unit!14423)

(assert (=> b!203087 (= lt!316663 Unit!14437)))

(declare-fun b!203088 () Bool)

(declare-fun lt!316653 () tuple2!17366)

(assert (=> b!203088 (= lt!316653 (readBitPure!0 (readerFrom!0 (_2!9334 lt!316657) (currentBit!9481 (_2!9334 lt!316394)) (currentByte!9486 (_2!9334 lt!316394)))))))

(declare-fun res!170121 () Bool)

(assert (=> b!203088 (= res!170121 (and (= (_2!9335 lt!316653) lt!316673) (= (_1!9335 lt!316653) (_2!9334 lt!316657))))))

(declare-fun e!139192 () Bool)

(assert (=> b!203088 (=> (not res!170121) (not e!139192))))

(assert (=> b!203088 (= e!139188 e!139192)))

(declare-fun b!203089 () Bool)

(assert (=> b!203089 (= e!139194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!203090 () Bool)

(assert (=> b!203090 (= e!139192 (= (bitIndex!0 (size!4532 (buf!5037 (_1!9335 lt!316653))) (currentByte!9486 (_1!9335 lt!316653)) (currentBit!9481 (_1!9335 lt!316653))) (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316657))) (currentByte!9486 (_2!9334 lt!316657)) (currentBit!9481 (_2!9334 lt!316657)))))))

(declare-fun b!203091 () Bool)

(declare-fun res!170129 () Bool)

(assert (=> b!203091 (=> (not res!170129) (not e!139191))))

(assert (=> b!203091 (= res!170129 (= (size!4532 (buf!5037 (_2!9334 lt!316394))) (size!4532 (buf!5037 (_2!9334 lt!316640)))))))

(declare-fun b!203092 () Bool)

(declare-fun res!170130 () Bool)

(assert (=> b!203092 (=> (not res!170130) (not e!139191))))

(declare-fun lt!316667 () (_ BitVec 64))

(declare-fun lt!316680 () (_ BitVec 64))

(assert (=> b!203092 (= res!170130 (= (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316640))) (currentByte!9486 (_2!9334 lt!316640)) (currentBit!9481 (_2!9334 lt!316640))) (bvsub lt!316680 lt!316667)))))

(assert (=> b!203092 (or (= (bvand lt!316680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316680 lt!316667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203092 (= lt!316667 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!316639 () (_ BitVec 64))

(declare-fun lt!316682 () (_ BitVec 64))

(assert (=> b!203092 (= lt!316680 (bvadd lt!316639 lt!316682))))

(assert (=> b!203092 (or (not (= (bvand lt!316639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316682 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316639 lt!316682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203092 (= lt!316682 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203092 (= lt!316639 (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))))))

(declare-fun b!203093 () Bool)

(assert (=> b!203093 (= e!139196 (validate_offset_bits!1 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316394)))) ((_ sign_extend 32) (currentByte!9486 (_2!9334 lt!316394))) ((_ sign_extend 32) (currentBit!9481 (_2!9334 lt!316394))) lt!316641))))

(assert (= (and d!69379 c!10067) b!203081))

(assert (= (and d!69379 (not c!10067)) b!203087))

(assert (= (and b!203087 res!170125) b!203084))

(assert (= (and b!203084 res!170120) b!203079))

(assert (= (and b!203079 res!170128) b!203088))

(assert (= (and b!203088 res!170121) b!203090))

(assert (= (and b!203087 res!170119) b!203080))

(assert (= (and b!203087 c!10066) b!203078))

(assert (= (and b!203087 (not c!10066)) b!203089))

(assert (= (and b!203087 res!170123) b!203082))

(assert (= (or b!203081 b!203087) bm!3198))

(assert (= (and d!69379 res!170127) b!203091))

(assert (= (and b!203091 res!170129) b!203092))

(assert (= (and b!203092 res!170130) b!203086))

(assert (= (and b!203086 res!170124) b!203083))

(assert (= (and b!203083 res!170126) b!203093))

(assert (= (and b!203083 res!170122) b!203085))

(declare-fun m!313727 () Bool)

(assert (=> b!203093 m!313727))

(declare-fun m!313729 () Bool)

(assert (=> b!203087 m!313729))

(declare-fun m!313731 () Bool)

(assert (=> b!203087 m!313731))

(declare-fun m!313733 () Bool)

(assert (=> b!203087 m!313733))

(declare-fun m!313735 () Bool)

(assert (=> b!203087 m!313735))

(declare-fun m!313737 () Bool)

(assert (=> b!203087 m!313737))

(declare-fun m!313739 () Bool)

(assert (=> b!203087 m!313739))

(declare-fun m!313741 () Bool)

(assert (=> b!203087 m!313741))

(declare-fun m!313743 () Bool)

(assert (=> b!203087 m!313743))

(declare-fun m!313745 () Bool)

(assert (=> b!203087 m!313745))

(declare-fun m!313747 () Bool)

(assert (=> b!203087 m!313747))

(declare-fun m!313749 () Bool)

(assert (=> b!203087 m!313749))

(declare-fun m!313751 () Bool)

(assert (=> b!203087 m!313751))

(declare-fun m!313753 () Bool)

(assert (=> b!203087 m!313753))

(declare-fun m!313755 () Bool)

(assert (=> b!203087 m!313755))

(assert (=> b!203087 m!313613))

(declare-fun m!313757 () Bool)

(assert (=> b!203087 m!313757))

(declare-fun m!313759 () Bool)

(assert (=> b!203087 m!313759))

(declare-fun m!313761 () Bool)

(assert (=> b!203087 m!313761))

(declare-fun m!313763 () Bool)

(assert (=> b!203087 m!313763))

(declare-fun m!313765 () Bool)

(assert (=> b!203087 m!313765))

(declare-fun m!313767 () Bool)

(assert (=> b!203087 m!313767))

(declare-fun m!313769 () Bool)

(assert (=> b!203087 m!313769))

(declare-fun m!313771 () Bool)

(assert (=> b!203087 m!313771))

(declare-fun m!313773 () Bool)

(assert (=> b!203087 m!313773))

(declare-fun m!313775 () Bool)

(assert (=> b!203087 m!313775))

(declare-fun m!313777 () Bool)

(assert (=> b!203087 m!313777))

(assert (=> b!203087 m!313729))

(declare-fun m!313779 () Bool)

(assert (=> b!203087 m!313779))

(declare-fun m!313781 () Bool)

(assert (=> b!203087 m!313781))

(declare-fun m!313783 () Bool)

(assert (=> b!203087 m!313783))

(declare-fun m!313785 () Bool)

(assert (=> b!203087 m!313785))

(declare-fun m!313787 () Bool)

(assert (=> b!203087 m!313787))

(declare-fun m!313789 () Bool)

(assert (=> b!203087 m!313789))

(declare-fun m!313791 () Bool)

(assert (=> b!203087 m!313791))

(declare-fun m!313793 () Bool)

(assert (=> b!203092 m!313793))

(assert (=> b!203092 m!313613))

(declare-fun m!313795 () Bool)

(assert (=> b!203079 m!313795))

(declare-fun m!313797 () Bool)

(assert (=> b!203083 m!313797))

(declare-fun m!313799 () Bool)

(assert (=> b!203083 m!313799))

(declare-fun m!313801 () Bool)

(assert (=> b!203083 m!313801))

(assert (=> b!203083 m!313757))

(declare-fun m!313803 () Bool)

(assert (=> b!203083 m!313803))

(assert (=> b!203083 m!313789))

(declare-fun m!313805 () Bool)

(assert (=> d!69379 m!313805))

(declare-fun m!313807 () Bool)

(assert (=> b!203081 m!313807))

(declare-fun m!313809 () Bool)

(assert (=> bm!3198 m!313809))

(declare-fun m!313811 () Bool)

(assert (=> b!203090 m!313811))

(declare-fun m!313813 () Bool)

(assert (=> b!203090 m!313813))

(declare-fun m!313815 () Bool)

(assert (=> b!203088 m!313815))

(assert (=> b!203088 m!313815))

(declare-fun m!313817 () Bool)

(assert (=> b!203088 m!313817))

(declare-fun m!313819 () Bool)

(assert (=> b!203086 m!313819))

(assert (=> b!203084 m!313813))

(assert (=> b!203084 m!313613))

(assert (=> b!202938 d!69379))

(declare-fun d!69427 () Bool)

(declare-fun e!139199 () Bool)

(assert (=> d!69427 e!139199))

(declare-fun res!170136 () Bool)

(assert (=> d!69427 (=> (not res!170136) (not e!139199))))

(declare-fun lt!316705 () (_ BitVec 64))

(declare-fun lt!316701 () (_ BitVec 64))

(declare-fun lt!316706 () (_ BitVec 64))

(assert (=> d!69427 (= res!170136 (= lt!316706 (bvsub lt!316701 lt!316705)))))

(assert (=> d!69427 (or (= (bvand lt!316701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316701 lt!316705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69427 (= lt!316705 (remainingBits!0 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316394)))) ((_ sign_extend 32) (currentByte!9486 (_2!9334 lt!316394))) ((_ sign_extend 32) (currentBit!9481 (_2!9334 lt!316394)))))))

(declare-fun lt!316702 () (_ BitVec 64))

(declare-fun lt!316703 () (_ BitVec 64))

(assert (=> d!69427 (= lt!316701 (bvmul lt!316702 lt!316703))))

(assert (=> d!69427 (or (= lt!316702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316703 (bvsdiv (bvmul lt!316702 lt!316703) lt!316702)))))

(assert (=> d!69427 (= lt!316703 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69427 (= lt!316702 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316394)))))))

(assert (=> d!69427 (= lt!316706 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9486 (_2!9334 lt!316394))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9481 (_2!9334 lt!316394)))))))

(assert (=> d!69427 (invariant!0 (currentBit!9481 (_2!9334 lt!316394)) (currentByte!9486 (_2!9334 lt!316394)) (size!4532 (buf!5037 (_2!9334 lt!316394))))))

(assert (=> d!69427 (= (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394))) lt!316706)))

(declare-fun b!203098 () Bool)

(declare-fun res!170135 () Bool)

(assert (=> b!203098 (=> (not res!170135) (not e!139199))))

(assert (=> b!203098 (= res!170135 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316706))))

(declare-fun b!203099 () Bool)

(declare-fun lt!316704 () (_ BitVec 64))

(assert (=> b!203099 (= e!139199 (bvsle lt!316706 (bvmul lt!316704 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203099 (or (= lt!316704 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316704 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316704)))))

(assert (=> b!203099 (= lt!316704 ((_ sign_extend 32) (size!4532 (buf!5037 (_2!9334 lt!316394)))))))

(assert (= (and d!69427 res!170136) b!203098))

(assert (= (and b!203098 res!170135) b!203099))

(declare-fun m!313821 () Bool)

(assert (=> d!69427 m!313821))

(declare-fun m!313823 () Bool)

(assert (=> d!69427 m!313823))

(assert (=> b!202932 d!69427))

(declare-fun d!69429 () Bool)

(declare-fun e!139200 () Bool)

(assert (=> d!69429 e!139200))

(declare-fun res!170138 () Bool)

(assert (=> d!69429 (=> (not res!170138) (not e!139200))))

(declare-fun lt!316711 () (_ BitVec 64))

(declare-fun lt!316707 () (_ BitVec 64))

(declare-fun lt!316712 () (_ BitVec 64))

(assert (=> d!69429 (= res!170138 (= lt!316712 (bvsub lt!316707 lt!316711)))))

(assert (=> d!69429 (or (= (bvand lt!316707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316711 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316707 lt!316711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69429 (= lt!316711 (remainingBits!0 ((_ sign_extend 32) (size!4532 (buf!5037 thiss!1204))) ((_ sign_extend 32) (currentByte!9486 thiss!1204)) ((_ sign_extend 32) (currentBit!9481 thiss!1204))))))

(declare-fun lt!316708 () (_ BitVec 64))

(declare-fun lt!316709 () (_ BitVec 64))

(assert (=> d!69429 (= lt!316707 (bvmul lt!316708 lt!316709))))

(assert (=> d!69429 (or (= lt!316708 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316709 (bvsdiv (bvmul lt!316708 lt!316709) lt!316708)))))

(assert (=> d!69429 (= lt!316709 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69429 (= lt!316708 ((_ sign_extend 32) (size!4532 (buf!5037 thiss!1204))))))

(assert (=> d!69429 (= lt!316712 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9486 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9481 thiss!1204))))))

(assert (=> d!69429 (invariant!0 (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204) (size!4532 (buf!5037 thiss!1204)))))

(assert (=> d!69429 (= (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204)) lt!316712)))

(declare-fun b!203100 () Bool)

(declare-fun res!170137 () Bool)

(assert (=> b!203100 (=> (not res!170137) (not e!139200))))

(assert (=> b!203100 (= res!170137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316712))))

(declare-fun b!203101 () Bool)

(declare-fun lt!316710 () (_ BitVec 64))

(assert (=> b!203101 (= e!139200 (bvsle lt!316712 (bvmul lt!316710 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203101 (or (= lt!316710 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316710 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316710)))))

(assert (=> b!203101 (= lt!316710 ((_ sign_extend 32) (size!4532 (buf!5037 thiss!1204))))))

(assert (= (and d!69429 res!170138) b!203100))

(assert (= (and b!203100 res!170137) b!203101))

(declare-fun m!313825 () Bool)

(assert (=> d!69429 m!313825))

(assert (=> d!69429 m!313625))

(assert (=> b!202932 d!69429))

(declare-fun b!203111 () Bool)

(declare-fun res!170150 () Bool)

(declare-fun e!139205 () Bool)

(assert (=> b!203111 (=> (not res!170150) (not e!139205))))

(declare-fun lt!316722 () (_ BitVec 64))

(declare-fun lt!316721 () (_ BitVec 64))

(declare-fun lt!316723 () tuple2!17364)

(assert (=> b!203111 (= res!170150 (= (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316723))) (currentByte!9486 (_2!9334 lt!316723)) (currentBit!9481 (_2!9334 lt!316723))) (bvadd lt!316722 lt!316721)))))

(assert (=> b!203111 (or (not (= (bvand lt!316722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316721 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316722 lt!316721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203111 (= lt!316721 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203111 (= lt!316722 (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204)))))

(declare-fun b!203112 () Bool)

(declare-fun res!170147 () Bool)

(assert (=> b!203112 (=> (not res!170147) (not e!139205))))

(assert (=> b!203112 (= res!170147 (isPrefixOf!0 thiss!1204 (_2!9334 lt!316723)))))

(declare-fun b!203113 () Bool)

(declare-fun e!139206 () Bool)

(assert (=> b!203113 (= e!139205 e!139206)))

(declare-fun res!170148 () Bool)

(assert (=> b!203113 (=> (not res!170148) (not e!139206))))

(declare-fun lt!316724 () tuple2!17366)

(assert (=> b!203113 (= res!170148 (and (= (_2!9335 lt!316724) lt!316397) (= (_1!9335 lt!316724) (_2!9334 lt!316723))))))

(assert (=> b!203113 (= lt!316724 (readBitPure!0 (readerFrom!0 (_2!9334 lt!316723) (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204))))))

(declare-fun d!69431 () Bool)

(assert (=> d!69431 e!139205))

(declare-fun res!170149 () Bool)

(assert (=> d!69431 (=> (not res!170149) (not e!139205))))

(assert (=> d!69431 (= res!170149 (= (size!4532 (buf!5037 thiss!1204)) (size!4532 (buf!5037 (_2!9334 lt!316723)))))))

(declare-fun choose!16 (BitStream!8172 Bool) tuple2!17364)

(assert (=> d!69431 (= lt!316723 (choose!16 thiss!1204 lt!316397))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69431 (validate_offset_bit!0 ((_ sign_extend 32) (size!4532 (buf!5037 thiss!1204))) ((_ sign_extend 32) (currentByte!9486 thiss!1204)) ((_ sign_extend 32) (currentBit!9481 thiss!1204)))))

(assert (=> d!69431 (= (appendBit!0 thiss!1204 lt!316397) lt!316723)))

(declare-fun b!203114 () Bool)

(assert (=> b!203114 (= e!139206 (= (bitIndex!0 (size!4532 (buf!5037 (_1!9335 lt!316724))) (currentByte!9486 (_1!9335 lt!316724)) (currentBit!9481 (_1!9335 lt!316724))) (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316723))) (currentByte!9486 (_2!9334 lt!316723)) (currentBit!9481 (_2!9334 lt!316723)))))))

(assert (= (and d!69431 res!170149) b!203111))

(assert (= (and b!203111 res!170150) b!203112))

(assert (= (and b!203112 res!170147) b!203113))

(assert (= (and b!203113 res!170148) b!203114))

(declare-fun m!313827 () Bool)

(assert (=> b!203111 m!313827))

(assert (=> b!203111 m!313615))

(declare-fun m!313829 () Bool)

(assert (=> b!203113 m!313829))

(assert (=> b!203113 m!313829))

(declare-fun m!313831 () Bool)

(assert (=> b!203113 m!313831))

(declare-fun m!313833 () Bool)

(assert (=> b!203114 m!313833))

(assert (=> b!203114 m!313827))

(declare-fun m!313835 () Bool)

(assert (=> d!69431 m!313835))

(declare-fun m!313837 () Bool)

(assert (=> d!69431 m!313837))

(declare-fun m!313839 () Bool)

(assert (=> b!203112 m!313839))

(assert (=> b!202932 d!69431))

(declare-fun d!69433 () Bool)

(assert (=> d!69433 (= (array_inv!4273 (buf!5037 thiss!1204)) (bvsge (size!4532 (buf!5037 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202937 d!69433))

(declare-fun d!69435 () Bool)

(assert (=> d!69435 (= (invariant!0 (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204) (size!4532 (buf!5037 thiss!1204))) (and (bvsge (currentBit!9481 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9481 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9486 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9486 thiss!1204) (size!4532 (buf!5037 thiss!1204))) (and (= (currentBit!9481 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9486 thiss!1204) (size!4532 (buf!5037 thiss!1204)))))))))

(assert (=> b!202936 d!69435))

(declare-fun d!69437 () Bool)

(declare-fun res!170153 () Bool)

(declare-fun e!139207 () Bool)

(assert (=> d!69437 (=> (not res!170153) (not e!139207))))

(assert (=> d!69437 (= res!170153 (= (size!4532 (buf!5037 thiss!1204)) (size!4532 (buf!5037 (_2!9334 lt!316394)))))))

(assert (=> d!69437 (= (isPrefixOf!0 thiss!1204 (_2!9334 lt!316394)) e!139207)))

(declare-fun b!203115 () Bool)

(declare-fun res!170151 () Bool)

(assert (=> b!203115 (=> (not res!170151) (not e!139207))))

(assert (=> b!203115 (= res!170151 (bvsle (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204)) (bitIndex!0 (size!4532 (buf!5037 (_2!9334 lt!316394))) (currentByte!9486 (_2!9334 lt!316394)) (currentBit!9481 (_2!9334 lt!316394)))))))

(declare-fun b!203116 () Bool)

(declare-fun e!139208 () Bool)

(assert (=> b!203116 (= e!139207 e!139208)))

(declare-fun res!170152 () Bool)

(assert (=> b!203116 (=> res!170152 e!139208)))

(assert (=> b!203116 (= res!170152 (= (size!4532 (buf!5037 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203117 () Bool)

(assert (=> b!203117 (= e!139208 (arrayBitRangesEq!0 (buf!5037 thiss!1204) (buf!5037 (_2!9334 lt!316394)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4532 (buf!5037 thiss!1204)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204))))))

(assert (= (and d!69437 res!170153) b!203115))

(assert (= (and b!203115 res!170151) b!203116))

(assert (= (and b!203116 (not res!170152)) b!203117))

(assert (=> b!203115 m!313615))

(assert (=> b!203115 m!313613))

(assert (=> b!203117 m!313615))

(assert (=> b!203117 m!313615))

(declare-fun m!313841 () Bool)

(assert (=> b!203117 m!313841))

(assert (=> b!202931 d!69437))

(declare-fun d!69439 () Bool)

(declare-fun e!139209 () Bool)

(assert (=> d!69439 e!139209))

(declare-fun res!170155 () Bool)

(assert (=> d!69439 (=> (not res!170155) (not e!139209))))

(declare-fun lt!316725 () (_ BitVec 64))

(declare-fun lt!316730 () (_ BitVec 64))

(declare-fun lt!316729 () (_ BitVec 64))

(assert (=> d!69439 (= res!170155 (= lt!316730 (bvsub lt!316725 lt!316729)))))

(assert (=> d!69439 (or (= (bvand lt!316725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316725 lt!316729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69439 (= lt!316729 (remainingBits!0 ((_ sign_extend 32) (size!4532 (buf!5037 (_1!9335 lt!316390)))) ((_ sign_extend 32) (currentByte!9486 (_1!9335 lt!316390))) ((_ sign_extend 32) (currentBit!9481 (_1!9335 lt!316390)))))))

(declare-fun lt!316726 () (_ BitVec 64))

(declare-fun lt!316727 () (_ BitVec 64))

(assert (=> d!69439 (= lt!316725 (bvmul lt!316726 lt!316727))))

(assert (=> d!69439 (or (= lt!316726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316727 (bvsdiv (bvmul lt!316726 lt!316727) lt!316726)))))

(assert (=> d!69439 (= lt!316727 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69439 (= lt!316726 ((_ sign_extend 32) (size!4532 (buf!5037 (_1!9335 lt!316390)))))))

(assert (=> d!69439 (= lt!316730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9486 (_1!9335 lt!316390))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9481 (_1!9335 lt!316390)))))))

(assert (=> d!69439 (invariant!0 (currentBit!9481 (_1!9335 lt!316390)) (currentByte!9486 (_1!9335 lt!316390)) (size!4532 (buf!5037 (_1!9335 lt!316390))))))

(assert (=> d!69439 (= (bitIndex!0 (size!4532 (buf!5037 (_1!9335 lt!316390))) (currentByte!9486 (_1!9335 lt!316390)) (currentBit!9481 (_1!9335 lt!316390))) lt!316730)))

(declare-fun b!203118 () Bool)

(declare-fun res!170154 () Bool)

(assert (=> b!203118 (=> (not res!170154) (not e!139209))))

(assert (=> b!203118 (= res!170154 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316730))))

(declare-fun b!203119 () Bool)

(declare-fun lt!316728 () (_ BitVec 64))

(assert (=> b!203119 (= e!139209 (bvsle lt!316730 (bvmul lt!316728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203119 (or (= lt!316728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316728)))))

(assert (=> b!203119 (= lt!316728 ((_ sign_extend 32) (size!4532 (buf!5037 (_1!9335 lt!316390)))))))

(assert (= (and d!69439 res!170155) b!203118))

(assert (= (and b!203118 res!170154) b!203119))

(declare-fun m!313843 () Bool)

(assert (=> d!69439 m!313843))

(declare-fun m!313845 () Bool)

(assert (=> d!69439 m!313845))

(assert (=> b!202930 d!69439))

(declare-fun d!69441 () Bool)

(assert (=> d!69441 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4532 (buf!5037 thiss!1204))) ((_ sign_extend 32) (currentByte!9486 thiss!1204)) ((_ sign_extend 32) (currentBit!9481 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4532 (buf!5037 thiss!1204))) ((_ sign_extend 32) (currentByte!9486 thiss!1204)) ((_ sign_extend 32) (currentBit!9481 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17116 () Bool)

(assert (= bs!17116 d!69441))

(assert (=> bs!17116 m!313825))

(assert (=> b!202935 d!69441))

(assert (=> b!202934 d!69427))

(assert (=> b!202934 d!69429))

(declare-fun d!69443 () Bool)

(declare-datatypes ((tuple2!17376 0))(
  ( (tuple2!17377 (_1!9340 Bool) (_2!9340 BitStream!8172)) )
))
(declare-fun lt!316733 () tuple2!17376)

(declare-fun readBit!0 (BitStream!8172) tuple2!17376)

(assert (=> d!69443 (= lt!316733 (readBit!0 (readerFrom!0 (_2!9334 lt!316394) (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204))))))

(assert (=> d!69443 (= (readBitPure!0 (readerFrom!0 (_2!9334 lt!316394) (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204))) (tuple2!17367 (_2!9340 lt!316733) (_1!9340 lt!316733)))))

(declare-fun bs!17117 () Bool)

(assert (= bs!17117 d!69443))

(assert (=> bs!17117 m!313603))

(declare-fun m!313847 () Bool)

(assert (=> bs!17117 m!313847))

(assert (=> b!202929 d!69443))

(declare-fun d!69445 () Bool)

(declare-fun e!139212 () Bool)

(assert (=> d!69445 e!139212))

(declare-fun res!170159 () Bool)

(assert (=> d!69445 (=> (not res!170159) (not e!139212))))

(assert (=> d!69445 (= res!170159 (invariant!0 (currentBit!9481 (_2!9334 lt!316394)) (currentByte!9486 (_2!9334 lt!316394)) (size!4532 (buf!5037 (_2!9334 lt!316394)))))))

(assert (=> d!69445 (= (readerFrom!0 (_2!9334 lt!316394) (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204)) (BitStream!8173 (buf!5037 (_2!9334 lt!316394)) (currentByte!9486 thiss!1204) (currentBit!9481 thiss!1204)))))

(declare-fun b!203122 () Bool)

(assert (=> b!203122 (= e!139212 (invariant!0 (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204) (size!4532 (buf!5037 (_2!9334 lt!316394)))))))

(assert (= (and d!69445 res!170159) b!203122))

(assert (=> d!69445 m!313823))

(declare-fun m!313849 () Bool)

(assert (=> b!203122 m!313849))

(assert (=> b!202929 d!69445))

(declare-fun d!69447 () Bool)

(assert (=> d!69447 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9481 thiss!1204) (currentByte!9486 thiss!1204) (size!4532 (buf!5037 thiss!1204))))))

(declare-fun bs!17118 () Bool)

(assert (= bs!17118 d!69447))

(assert (=> bs!17118 m!313625))

(assert (=> start!43046 d!69447))

(check-sat (not b!203114) (not b!203112) (not b!203088) (not b!203111) (not b!203083) (not b!203084) (not b!203092) (not b!203122) (not d!69447) (not d!69439) (not b!203081) (not b!203113) (not d!69427) (not b!203087) (not d!69377) (not b!203093) (not b!203079) (not d!69429) (not d!69379) (not b!202975) (not d!69431) (not b!202977) (not bm!3198) (not d!69443) (not b!203117) (not b!203115) (not b!203090) (not b!203086) (not d!69441) (not d!69445))
