; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43044 () Bool)

(assert start!43044)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!316356 () (_ BitVec 64))

(declare-fun e!139083 () Bool)

(declare-fun lt!316364 () (_ BitVec 64))

(declare-fun b!202899 () Bool)

(assert (=> b!202899 (= e!139083 (or (= lt!316364 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!316364 (bvand (bvsub lt!316356 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!202899 (= lt!316364 (bvand lt!316356 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!316362 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!202899 (= lt!316356 (bvadd lt!316362 ((_ sign_extend 32) nBits!348)))))

(declare-datatypes ((array!10298 0))(
  ( (array!10299 (arr!5461 (Array (_ BitVec 32) (_ BitVec 8))) (size!4531 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8170 0))(
  ( (BitStream!8171 (buf!5036 array!10298) (currentByte!9485 (_ BitVec 32)) (currentBit!9480 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8170)

(declare-datatypes ((Unit!14421 0))(
  ( (Unit!14422) )
))
(declare-datatypes ((tuple2!17360 0))(
  ( (tuple2!17361 (_1!9332 Unit!14421) (_2!9332 BitStream!8170)) )
))
(declare-fun lt!316354 () tuple2!17360)

(declare-fun isPrefixOf!0 (BitStream!8170 BitStream!8170) Bool)

(assert (=> b!202899 (isPrefixOf!0 thiss!1204 (_2!9332 lt!316354))))

(declare-fun lt!316358 () tuple2!17360)

(declare-fun lt!316355 () Unit!14421)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8170 BitStream!8170 BitStream!8170) Unit!14421)

(assert (=> b!202899 (= lt!316355 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9332 lt!316358) (_2!9332 lt!316354)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17360)

(assert (=> b!202899 (= lt!316354 (appendBitsLSBFirstLoopTR!0 (_2!9332 lt!316358) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202900 () Bool)

(declare-fun e!139080 () Bool)

(declare-datatypes ((tuple2!17362 0))(
  ( (tuple2!17363 (_1!9333 BitStream!8170) (_2!9333 Bool)) )
))
(declare-fun lt!316360 () tuple2!17362)

(declare-fun lt!316357 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202900 (= e!139080 (= (bitIndex!0 (size!4531 (buf!5036 (_1!9333 lt!316360))) (currentByte!9485 (_1!9333 lt!316360)) (currentBit!9480 (_1!9333 lt!316360))) lt!316357))))

(declare-fun res!169962 () Bool)

(declare-fun e!139077 () Bool)

(assert (=> start!43044 (=> (not res!169962) (not e!139077))))

(assert (=> start!43044 (= res!169962 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43044 e!139077))

(assert (=> start!43044 true))

(declare-fun e!139079 () Bool)

(declare-fun inv!12 (BitStream!8170) Bool)

(assert (=> start!43044 (and (inv!12 thiss!1204) e!139079)))

(declare-fun b!202901 () Bool)

(declare-fun e!139082 () Bool)

(declare-fun e!139081 () Bool)

(assert (=> b!202901 (= e!139082 e!139081)))

(declare-fun res!169959 () Bool)

(assert (=> b!202901 (=> (not res!169959) (not e!139081))))

(declare-fun lt!316363 () (_ BitVec 64))

(assert (=> b!202901 (= res!169959 (= lt!316357 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!316363)))))

(assert (=> b!202901 (= lt!316357 (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))))))

(assert (=> b!202901 (= lt!316363 (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204)))))

(declare-fun b!202902 () Bool)

(declare-fun res!169961 () Bool)

(assert (=> b!202902 (=> (not res!169961) (not e!139077))))

(assert (=> b!202902 (= res!169961 (not (= i!590 nBits!348)))))

(declare-fun b!202903 () Bool)

(declare-fun res!169960 () Bool)

(assert (=> b!202903 (=> (not res!169960) (not e!139077))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202903 (= res!169960 (validate_offset_bits!1 ((_ sign_extend 32) (size!4531 (buf!5036 thiss!1204))) ((_ sign_extend 32) (currentByte!9485 thiss!1204)) ((_ sign_extend 32) (currentBit!9480 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202904 () Bool)

(declare-fun res!169964 () Bool)

(assert (=> b!202904 (=> (not res!169964) (not e!139081))))

(assert (=> b!202904 (= res!169964 (isPrefixOf!0 thiss!1204 (_2!9332 lt!316358)))))

(declare-fun b!202905 () Bool)

(assert (=> b!202905 (= e!139077 (not e!139083))))

(declare-fun res!169958 () Bool)

(assert (=> b!202905 (=> res!169958 e!139083)))

(declare-fun lt!316361 () (_ BitVec 64))

(assert (=> b!202905 (= res!169958 (not (= lt!316362 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!316361))))))

(assert (=> b!202905 (= lt!316362 (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))))))

(assert (=> b!202905 (= lt!316361 (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204)))))

(assert (=> b!202905 e!139082))

(declare-fun res!169957 () Bool)

(assert (=> b!202905 (=> (not res!169957) (not e!139082))))

(assert (=> b!202905 (= res!169957 (= (size!4531 (buf!5036 thiss!1204)) (size!4531 (buf!5036 (_2!9332 lt!316358)))))))

(declare-fun lt!316359 () Bool)

(declare-fun appendBit!0 (BitStream!8170 Bool) tuple2!17360)

(assert (=> b!202905 (= lt!316358 (appendBit!0 thiss!1204 lt!316359))))

(assert (=> b!202905 (= lt!316359 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202906 () Bool)

(assert (=> b!202906 (= e!139081 e!139080)))

(declare-fun res!169956 () Bool)

(assert (=> b!202906 (=> (not res!169956) (not e!139080))))

(assert (=> b!202906 (= res!169956 (and (= (_2!9333 lt!316360) lt!316359) (= (_1!9333 lt!316360) (_2!9332 lt!316358))))))

(declare-fun readBitPure!0 (BitStream!8170) tuple2!17362)

(declare-fun readerFrom!0 (BitStream!8170 (_ BitVec 32) (_ BitVec 32)) BitStream!8170)

(assert (=> b!202906 (= lt!316360 (readBitPure!0 (readerFrom!0 (_2!9332 lt!316358) (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204))))))

(declare-fun b!202907 () Bool)

(declare-fun res!169963 () Bool)

(assert (=> b!202907 (=> (not res!169963) (not e!139077))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202907 (= res!169963 (invariant!0 (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204) (size!4531 (buf!5036 thiss!1204))))))

(declare-fun b!202908 () Bool)

(declare-fun array_inv!4272 (array!10298) Bool)

(assert (=> b!202908 (= e!139079 (array_inv!4272 (buf!5036 thiss!1204)))))

(assert (= (and start!43044 res!169962) b!202903))

(assert (= (and b!202903 res!169960) b!202907))

(assert (= (and b!202907 res!169963) b!202902))

(assert (= (and b!202902 res!169961) b!202905))

(assert (= (and b!202905 res!169957) b!202901))

(assert (= (and b!202901 res!169959) b!202904))

(assert (= (and b!202904 res!169964) b!202906))

(assert (= (and b!202906 res!169956) b!202900))

(assert (= (and b!202905 (not res!169958)) b!202899))

(assert (= start!43044 b!202908))

(declare-fun m!313575 () Bool)

(assert (=> b!202908 m!313575))

(declare-fun m!313577 () Bool)

(assert (=> b!202904 m!313577))

(declare-fun m!313579 () Bool)

(assert (=> b!202903 m!313579))

(declare-fun m!313581 () Bool)

(assert (=> b!202900 m!313581))

(declare-fun m!313583 () Bool)

(assert (=> b!202905 m!313583))

(declare-fun m!313585 () Bool)

(assert (=> b!202905 m!313585))

(declare-fun m!313587 () Bool)

(assert (=> b!202905 m!313587))

(assert (=> b!202901 m!313583))

(assert (=> b!202901 m!313585))

(declare-fun m!313589 () Bool)

(assert (=> start!43044 m!313589))

(declare-fun m!313591 () Bool)

(assert (=> b!202907 m!313591))

(declare-fun m!313593 () Bool)

(assert (=> b!202899 m!313593))

(declare-fun m!313595 () Bool)

(assert (=> b!202899 m!313595))

(declare-fun m!313597 () Bool)

(assert (=> b!202899 m!313597))

(declare-fun m!313599 () Bool)

(assert (=> b!202906 m!313599))

(assert (=> b!202906 m!313599))

(declare-fun m!313601 () Bool)

(assert (=> b!202906 m!313601))

(push 1)

(assert (not b!202907))

(assert (not start!43044))

(assert (not b!202905))

(assert (not b!202901))

(assert (not b!202900))

(assert (not b!202903))

(assert (not b!202908))

(assert (not b!202899))

(assert (not b!202906))

(assert (not b!202904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69381 () Bool)

(assert (=> d!69381 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204) (size!4531 (buf!5036 thiss!1204))))))

(declare-fun bs!17110 () Bool)

(assert (= bs!17110 d!69381))

(assert (=> bs!17110 m!313591))

(assert (=> start!43044 d!69381))

(declare-fun d!69383 () Bool)

(declare-fun res!170034 () Bool)

(declare-fun e!139136 () Bool)

(assert (=> d!69383 (=> (not res!170034) (not e!139136))))

(assert (=> d!69383 (= res!170034 (= (size!4531 (buf!5036 thiss!1204)) (size!4531 (buf!5036 (_2!9332 lt!316358)))))))

(assert (=> d!69383 (= (isPrefixOf!0 thiss!1204 (_2!9332 lt!316358)) e!139136)))

(declare-fun b!202984 () Bool)

(declare-fun res!170036 () Bool)

(assert (=> b!202984 (=> (not res!170036) (not e!139136))))

(assert (=> b!202984 (= res!170036 (bvsle (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204)) (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358)))))))

(declare-fun b!202985 () Bool)

(declare-fun e!139137 () Bool)

(assert (=> b!202985 (= e!139136 e!139137)))

(declare-fun res!170035 () Bool)

(assert (=> b!202985 (=> res!170035 e!139137)))

(assert (=> b!202985 (= res!170035 (= (size!4531 (buf!5036 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202986 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10298 array!10298 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202986 (= e!139137 (arrayBitRangesEq!0 (buf!5036 thiss!1204) (buf!5036 (_2!9332 lt!316358)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204))))))

(assert (= (and d!69383 res!170034) b!202984))

(assert (= (and b!202984 res!170036) b!202985))

(assert (= (and b!202985 (not res!170035)) b!202986))

(assert (=> b!202984 m!313585))

(assert (=> b!202984 m!313583))

(assert (=> b!202986 m!313585))

(assert (=> b!202986 m!313585))

(declare-fun m!313665 () Bool)

(assert (=> b!202986 m!313665))

(assert (=> b!202904 d!69383))

(declare-fun d!69385 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69385 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4531 (buf!5036 thiss!1204))) ((_ sign_extend 32) (currentByte!9485 thiss!1204)) ((_ sign_extend 32) (currentBit!9480 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4531 (buf!5036 thiss!1204))) ((_ sign_extend 32) (currentByte!9485 thiss!1204)) ((_ sign_extend 32) (currentBit!9480 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17111 () Bool)

(assert (= bs!17111 d!69385))

(declare-fun m!313667 () Bool)

(assert (=> bs!17111 m!313667))

(assert (=> b!202903 d!69385))

(declare-fun d!69387 () Bool)

(assert (=> d!69387 (= (array_inv!4272 (buf!5036 thiss!1204)) (bvsge (size!4531 (buf!5036 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202908 d!69387))

(declare-fun d!69389 () Bool)

(assert (=> d!69389 (= (invariant!0 (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204) (size!4531 (buf!5036 thiss!1204))) (and (bvsge (currentBit!9480 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9480 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9485 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9485 thiss!1204) (size!4531 (buf!5036 thiss!1204))) (and (= (currentBit!9480 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9485 thiss!1204) (size!4531 (buf!5036 thiss!1204)))))))))

(assert (=> b!202907 d!69389))

(declare-fun d!69391 () Bool)

(declare-fun e!139140 () Bool)

(assert (=> d!69391 e!139140))

(declare-fun res!170041 () Bool)

(assert (=> d!69391 (=> (not res!170041) (not e!139140))))

(declare-fun lt!316447 () (_ BitVec 64))

(declare-fun lt!316446 () (_ BitVec 64))

(declare-fun lt!316451 () (_ BitVec 64))

(assert (=> d!69391 (= res!170041 (= lt!316446 (bvsub lt!316447 lt!316451)))))

(assert (=> d!69391 (or (= (bvand lt!316447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316447 lt!316451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69391 (= lt!316451 (remainingBits!0 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!316358)))) ((_ sign_extend 32) (currentByte!9485 (_2!9332 lt!316358))) ((_ sign_extend 32) (currentBit!9480 (_2!9332 lt!316358)))))))

(declare-fun lt!316450 () (_ BitVec 64))

(declare-fun lt!316448 () (_ BitVec 64))

(assert (=> d!69391 (= lt!316447 (bvmul lt!316450 lt!316448))))

(assert (=> d!69391 (or (= lt!316450 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316448 (bvsdiv (bvmul lt!316450 lt!316448) lt!316450)))))

(assert (=> d!69391 (= lt!316448 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69391 (= lt!316450 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!316358)))))))

(assert (=> d!69391 (= lt!316446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9485 (_2!9332 lt!316358))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9480 (_2!9332 lt!316358)))))))

(assert (=> d!69391 (invariant!0 (currentBit!9480 (_2!9332 lt!316358)) (currentByte!9485 (_2!9332 lt!316358)) (size!4531 (buf!5036 (_2!9332 lt!316358))))))

(assert (=> d!69391 (= (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))) lt!316446)))

(declare-fun b!202991 () Bool)

(declare-fun res!170042 () Bool)

(assert (=> b!202991 (=> (not res!170042) (not e!139140))))

(assert (=> b!202991 (= res!170042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316446))))

(declare-fun b!202992 () Bool)

(declare-fun lt!316449 () (_ BitVec 64))

(assert (=> b!202992 (= e!139140 (bvsle lt!316446 (bvmul lt!316449 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202992 (or (= lt!316449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316449)))))

(assert (=> b!202992 (= lt!316449 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!316358)))))))

(assert (= (and d!69391 res!170041) b!202991))

(assert (= (and b!202991 res!170042) b!202992))

(declare-fun m!313669 () Bool)

(assert (=> d!69391 m!313669))

(declare-fun m!313671 () Bool)

(assert (=> d!69391 m!313671))

(assert (=> b!202901 d!69391))

(declare-fun d!69393 () Bool)

(declare-fun e!139141 () Bool)

(assert (=> d!69393 e!139141))

(declare-fun res!170043 () Bool)

(assert (=> d!69393 (=> (not res!170043) (not e!139141))))

(declare-fun lt!316452 () (_ BitVec 64))

(declare-fun lt!316457 () (_ BitVec 64))

(declare-fun lt!316453 () (_ BitVec 64))

(assert (=> d!69393 (= res!170043 (= lt!316452 (bvsub lt!316453 lt!316457)))))

(assert (=> d!69393 (or (= (bvand lt!316453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316457 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316453 lt!316457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69393 (= lt!316457 (remainingBits!0 ((_ sign_extend 32) (size!4531 (buf!5036 thiss!1204))) ((_ sign_extend 32) (currentByte!9485 thiss!1204)) ((_ sign_extend 32) (currentBit!9480 thiss!1204))))))

(declare-fun lt!316456 () (_ BitVec 64))

(declare-fun lt!316454 () (_ BitVec 64))

(assert (=> d!69393 (= lt!316453 (bvmul lt!316456 lt!316454))))

(assert (=> d!69393 (or (= lt!316456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316454 (bvsdiv (bvmul lt!316456 lt!316454) lt!316456)))))

(assert (=> d!69393 (= lt!316454 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69393 (= lt!316456 ((_ sign_extend 32) (size!4531 (buf!5036 thiss!1204))))))

(assert (=> d!69393 (= lt!316452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9485 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9480 thiss!1204))))))

(assert (=> d!69393 (invariant!0 (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204) (size!4531 (buf!5036 thiss!1204)))))

(assert (=> d!69393 (= (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204)) lt!316452)))

(declare-fun b!202993 () Bool)

(declare-fun res!170044 () Bool)

(assert (=> b!202993 (=> (not res!170044) (not e!139141))))

(assert (=> b!202993 (= res!170044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316452))))

(declare-fun b!202994 () Bool)

(declare-fun lt!316455 () (_ BitVec 64))

(assert (=> b!202994 (= e!139141 (bvsle lt!316452 (bvmul lt!316455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202994 (or (= lt!316455 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316455 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316455)))))

(assert (=> b!202994 (= lt!316455 ((_ sign_extend 32) (size!4531 (buf!5036 thiss!1204))))))

(assert (= (and d!69393 res!170043) b!202993))

(assert (= (and b!202993 res!170044) b!202994))

(assert (=> d!69393 m!313667))

(assert (=> d!69393 m!313591))

(assert (=> b!202901 d!69393))

(declare-fun d!69395 () Bool)

(declare-datatypes ((tuple2!17378 0))(
  ( (tuple2!17379 (_1!9341 Bool) (_2!9341 BitStream!8170)) )
))
(declare-fun lt!316460 () tuple2!17378)

(declare-fun readBit!0 (BitStream!8170) tuple2!17378)

(assert (=> d!69395 (= lt!316460 (readBit!0 (readerFrom!0 (_2!9332 lt!316358) (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204))))))

(assert (=> d!69395 (= (readBitPure!0 (readerFrom!0 (_2!9332 lt!316358) (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204))) (tuple2!17363 (_2!9341 lt!316460) (_1!9341 lt!316460)))))

(declare-fun bs!17112 () Bool)

(assert (= bs!17112 d!69395))

(assert (=> bs!17112 m!313599))

(declare-fun m!313673 () Bool)

(assert (=> bs!17112 m!313673))

(assert (=> b!202906 d!69395))

(declare-fun d!69397 () Bool)

(declare-fun e!139144 () Bool)

(assert (=> d!69397 e!139144))

(declare-fun res!170048 () Bool)

(assert (=> d!69397 (=> (not res!170048) (not e!139144))))

(assert (=> d!69397 (= res!170048 (invariant!0 (currentBit!9480 (_2!9332 lt!316358)) (currentByte!9485 (_2!9332 lt!316358)) (size!4531 (buf!5036 (_2!9332 lt!316358)))))))

(assert (=> d!69397 (= (readerFrom!0 (_2!9332 lt!316358) (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204)) (BitStream!8171 (buf!5036 (_2!9332 lt!316358)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204)))))

(declare-fun b!202997 () Bool)

(assert (=> b!202997 (= e!139144 (invariant!0 (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204) (size!4531 (buf!5036 (_2!9332 lt!316358)))))))

(assert (= (and d!69397 res!170048) b!202997))

(assert (=> d!69397 m!313671))

(declare-fun m!313677 () Bool)

(assert (=> b!202997 m!313677))

(assert (=> b!202906 d!69397))

(assert (=> b!202905 d!69391))

(assert (=> b!202905 d!69393))

(declare-fun b!203017 () Bool)

(declare-fun e!139153 () Bool)

(declare-fun e!139154 () Bool)

(assert (=> b!203017 (= e!139153 e!139154)))

(declare-fun res!170067 () Bool)

(assert (=> b!203017 (=> (not res!170067) (not e!139154))))

(declare-fun lt!316494 () tuple2!17360)

(declare-fun lt!316495 () tuple2!17362)

(assert (=> b!203017 (= res!170067 (and (= (_2!9333 lt!316495) lt!316359) (= (_1!9333 lt!316495) (_2!9332 lt!316494))))))

(assert (=> b!203017 (= lt!316495 (readBitPure!0 (readerFrom!0 (_2!9332 lt!316494) (currentBit!9480 thiss!1204) (currentByte!9485 thiss!1204))))))

(declare-fun d!69405 () Bool)

(assert (=> d!69405 e!139153))

(declare-fun res!170068 () Bool)

(assert (=> d!69405 (=> (not res!170068) (not e!139153))))

(assert (=> d!69405 (= res!170068 (= (size!4531 (buf!5036 thiss!1204)) (size!4531 (buf!5036 (_2!9332 lt!316494)))))))

(declare-fun choose!16 (BitStream!8170 Bool) tuple2!17360)

(assert (=> d!69405 (= lt!316494 (choose!16 thiss!1204 lt!316359))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69405 (validate_offset_bit!0 ((_ sign_extend 32) (size!4531 (buf!5036 thiss!1204))) ((_ sign_extend 32) (currentByte!9485 thiss!1204)) ((_ sign_extend 32) (currentBit!9480 thiss!1204)))))

(assert (=> d!69405 (= (appendBit!0 thiss!1204 lt!316359) lt!316494)))

(declare-fun b!203018 () Bool)

(assert (=> b!203018 (= e!139154 (= (bitIndex!0 (size!4531 (buf!5036 (_1!9333 lt!316495))) (currentByte!9485 (_1!9333 lt!316495)) (currentBit!9480 (_1!9333 lt!316495))) (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316494))) (currentByte!9485 (_2!9332 lt!316494)) (currentBit!9480 (_2!9332 lt!316494)))))))

(declare-fun b!203016 () Bool)

(declare-fun res!170065 () Bool)

(assert (=> b!203016 (=> (not res!170065) (not e!139153))))

(assert (=> b!203016 (= res!170065 (isPrefixOf!0 thiss!1204 (_2!9332 lt!316494)))))

(declare-fun b!203015 () Bool)

(declare-fun res!170066 () Bool)

(assert (=> b!203015 (=> (not res!170066) (not e!139153))))

(declare-fun lt!316496 () (_ BitVec 64))

(declare-fun lt!316493 () (_ BitVec 64))

(assert (=> b!203015 (= res!170066 (= (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316494))) (currentByte!9485 (_2!9332 lt!316494)) (currentBit!9480 (_2!9332 lt!316494))) (bvadd lt!316496 lt!316493)))))

(assert (=> b!203015 (or (not (= (bvand lt!316496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316493 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316496 lt!316493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203015 (= lt!316493 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203015 (= lt!316496 (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204)))))

(assert (= (and d!69405 res!170068) b!203015))

(assert (= (and b!203015 res!170066) b!203016))

(assert (= (and b!203016 res!170065) b!203017))

(assert (= (and b!203017 res!170067) b!203018))

(declare-fun m!313683 () Bool)

(assert (=> d!69405 m!313683))

(declare-fun m!313685 () Bool)

(assert (=> d!69405 m!313685))

(declare-fun m!313687 () Bool)

(assert (=> b!203018 m!313687))

(declare-fun m!313689 () Bool)

(assert (=> b!203018 m!313689))

(assert (=> b!203015 m!313689))

(assert (=> b!203015 m!313585))

(declare-fun m!313691 () Bool)

(assert (=> b!203017 m!313691))

(assert (=> b!203017 m!313691))

(declare-fun m!313693 () Bool)

(assert (=> b!203017 m!313693))

(declare-fun m!313695 () Bool)

(assert (=> b!203016 m!313695))

(assert (=> b!202905 d!69405))

(declare-fun d!69413 () Bool)

(declare-fun e!139155 () Bool)

(assert (=> d!69413 e!139155))

(declare-fun res!170069 () Bool)

(assert (=> d!69413 (=> (not res!170069) (not e!139155))))

(declare-fun lt!316502 () (_ BitVec 64))

(declare-fun lt!316498 () (_ BitVec 64))

(declare-fun lt!316497 () (_ BitVec 64))

(assert (=> d!69413 (= res!170069 (= lt!316497 (bvsub lt!316498 lt!316502)))))

(assert (=> d!69413 (or (= (bvand lt!316498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316498 lt!316502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69413 (= lt!316502 (remainingBits!0 ((_ sign_extend 32) (size!4531 (buf!5036 (_1!9333 lt!316360)))) ((_ sign_extend 32) (currentByte!9485 (_1!9333 lt!316360))) ((_ sign_extend 32) (currentBit!9480 (_1!9333 lt!316360)))))))

(declare-fun lt!316501 () (_ BitVec 64))

(declare-fun lt!316499 () (_ BitVec 64))

(assert (=> d!69413 (= lt!316498 (bvmul lt!316501 lt!316499))))

(assert (=> d!69413 (or (= lt!316501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!316499 (bvsdiv (bvmul lt!316501 lt!316499) lt!316501)))))

(assert (=> d!69413 (= lt!316499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69413 (= lt!316501 ((_ sign_extend 32) (size!4531 (buf!5036 (_1!9333 lt!316360)))))))

(assert (=> d!69413 (= lt!316497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9485 (_1!9333 lt!316360))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9480 (_1!9333 lt!316360)))))))

(assert (=> d!69413 (invariant!0 (currentBit!9480 (_1!9333 lt!316360)) (currentByte!9485 (_1!9333 lt!316360)) (size!4531 (buf!5036 (_1!9333 lt!316360))))))

(assert (=> d!69413 (= (bitIndex!0 (size!4531 (buf!5036 (_1!9333 lt!316360))) (currentByte!9485 (_1!9333 lt!316360)) (currentBit!9480 (_1!9333 lt!316360))) lt!316497)))

(declare-fun b!203019 () Bool)

(declare-fun res!170070 () Bool)

(assert (=> b!203019 (=> (not res!170070) (not e!139155))))

(assert (=> b!203019 (= res!170070 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!316497))))

(declare-fun b!203020 () Bool)

(declare-fun lt!316500 () (_ BitVec 64))

(assert (=> b!203020 (= e!139155 (bvsle lt!316497 (bvmul lt!316500 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203020 (or (= lt!316500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!316500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!316500)))))

(assert (=> b!203020 (= lt!316500 ((_ sign_extend 32) (size!4531 (buf!5036 (_1!9333 lt!316360)))))))

(assert (= (and d!69413 res!170069) b!203019))

(assert (= (and b!203019 res!170070) b!203020))

(declare-fun m!313697 () Bool)

(assert (=> d!69413 m!313697))

(declare-fun m!313699 () Bool)

(assert (=> d!69413 m!313699))

(assert (=> b!202900 d!69413))

(declare-fun d!69415 () Bool)

(declare-fun res!170071 () Bool)

(declare-fun e!139156 () Bool)

(assert (=> d!69415 (=> (not res!170071) (not e!139156))))

(assert (=> d!69415 (= res!170071 (= (size!4531 (buf!5036 thiss!1204)) (size!4531 (buf!5036 (_2!9332 lt!316354)))))))

(assert (=> d!69415 (= (isPrefixOf!0 thiss!1204 (_2!9332 lt!316354)) e!139156)))

(declare-fun b!203021 () Bool)

(declare-fun res!170073 () Bool)

(assert (=> b!203021 (=> (not res!170073) (not e!139156))))

(assert (=> b!203021 (= res!170073 (bvsle (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204)) (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316354))) (currentByte!9485 (_2!9332 lt!316354)) (currentBit!9480 (_2!9332 lt!316354)))))))

(declare-fun b!203022 () Bool)

(declare-fun e!139157 () Bool)

(assert (=> b!203022 (= e!139156 e!139157)))

(declare-fun res!170072 () Bool)

(assert (=> b!203022 (=> res!170072 e!139157)))

(assert (=> b!203022 (= res!170072 (= (size!4531 (buf!5036 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203023 () Bool)

(assert (=> b!203023 (= e!139157 (arrayBitRangesEq!0 (buf!5036 thiss!1204) (buf!5036 (_2!9332 lt!316354)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4531 (buf!5036 thiss!1204)) (currentByte!9485 thiss!1204) (currentBit!9480 thiss!1204))))))

(assert (= (and d!69415 res!170071) b!203021))

(assert (= (and b!203021 res!170073) b!203022))

(assert (= (and b!203022 (not res!170072)) b!203023))

(assert (=> b!203021 m!313585))

(declare-fun m!313701 () Bool)

(assert (=> b!203021 m!313701))

(assert (=> b!203023 m!313585))

(assert (=> b!203023 m!313585))

(declare-fun m!313703 () Bool)

(assert (=> b!203023 m!313703))

(assert (=> b!202899 d!69415))

(declare-fun d!69417 () Bool)

(assert (=> d!69417 (isPrefixOf!0 thiss!1204 (_2!9332 lt!316354))))

(declare-fun lt!316505 () Unit!14421)

(declare-fun choose!30 (BitStream!8170 BitStream!8170 BitStream!8170) Unit!14421)

(assert (=> d!69417 (= lt!316505 (choose!30 thiss!1204 (_2!9332 lt!316358) (_2!9332 lt!316354)))))

(assert (=> d!69417 (isPrefixOf!0 thiss!1204 (_2!9332 lt!316358))))

(assert (=> d!69417 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9332 lt!316358) (_2!9332 lt!316354)) lt!316505)))

(declare-fun bs!17114 () Bool)

(assert (= bs!17114 d!69417))

(assert (=> bs!17114 m!313593))

(declare-fun m!313705 () Bool)

(assert (=> bs!17114 m!313705))

(assert (=> bs!17114 m!313577))

(assert (=> b!202899 d!69417))

(declare-fun b!203211 () Bool)

(declare-fun e!139272 () Bool)

(declare-datatypes ((tuple2!17384 0))(
  ( (tuple2!17385 (_1!9344 BitStream!8170) (_2!9344 (_ BitVec 64))) )
))
(declare-fun lt!317045 () tuple2!17384)

(declare-datatypes ((tuple2!17386 0))(
  ( (tuple2!17387 (_1!9345 BitStream!8170) (_2!9345 BitStream!8170)) )
))
(declare-fun lt!317032 () tuple2!17386)

(assert (=> b!203211 (= e!139272 (= (_1!9344 lt!317045) (_2!9345 lt!317032)))))

(declare-fun b!203212 () Bool)

(declare-fun e!139264 () Bool)

(declare-fun lt!317054 () (_ BitVec 64))

(assert (=> b!203212 (= e!139264 (validate_offset_bits!1 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!316358)))) ((_ sign_extend 32) (currentByte!9485 (_2!9332 lt!316358))) ((_ sign_extend 32) (currentBit!9480 (_2!9332 lt!316358))) lt!317054))))

(declare-fun c!10079 () Bool)

(declare-fun bm!3204 () Bool)

(declare-fun lt!317034 () tuple2!17360)

(declare-fun call!3207 () Bool)

(assert (=> bm!3204 (= call!3207 (isPrefixOf!0 (_2!9332 lt!316358) (ite c!10079 (_2!9332 lt!316358) (_2!9332 lt!317034))))))

(declare-fun b!203213 () Bool)

(declare-fun e!139268 () (_ BitVec 64))

(assert (=> b!203213 (= e!139268 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!203214 () Bool)

(declare-fun e!139270 () Bool)

(declare-fun lt!317028 () tuple2!17362)

(declare-fun lt!317067 () tuple2!17360)

(assert (=> b!203214 (= e!139270 (= (bitIndex!0 (size!4531 (buf!5036 (_1!9333 lt!317028))) (currentByte!9485 (_1!9333 lt!317028)) (currentBit!9480 (_1!9333 lt!317028))) (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317067))) (currentByte!9485 (_2!9332 lt!317067)) (currentBit!9480 (_2!9332 lt!317067)))))))

(declare-fun b!203215 () Bool)

(declare-fun res!170237 () Bool)

(declare-fun e!139267 () Bool)

(assert (=> b!203215 (=> (not res!170237) (not e!139267))))

(declare-fun lt!317072 () tuple2!17360)

(assert (=> b!203215 (= res!170237 (isPrefixOf!0 (_2!9332 lt!316358) (_2!9332 lt!317072)))))

(declare-fun b!203216 () Bool)

(declare-fun e!139265 () Bool)

(assert (=> b!203216 (= e!139267 e!139265)))

(declare-fun res!170229 () Bool)

(assert (=> b!203216 (=> (not res!170229) (not e!139265))))

(declare-fun lt!317061 () tuple2!17384)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203216 (= res!170229 (= (_2!9344 lt!317061) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!317070 () tuple2!17386)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17384)

(assert (=> b!203216 (= lt!317061 (readNBitsLSBFirstsLoopPure!0 (_1!9345 lt!317070) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!317033 () Unit!14421)

(declare-fun lt!317047 () Unit!14421)

(assert (=> b!203216 (= lt!317033 lt!317047)))

(assert (=> b!203216 (validate_offset_bits!1 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!317072)))) ((_ sign_extend 32) (currentByte!9485 (_2!9332 lt!316358))) ((_ sign_extend 32) (currentBit!9480 (_2!9332 lt!316358))) lt!317054)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8170 array!10298 (_ BitVec 64)) Unit!14421)

(assert (=> b!203216 (= lt!317047 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9332 lt!316358) (buf!5036 (_2!9332 lt!317072)) lt!317054))))

(assert (=> b!203216 e!139264))

(declare-fun res!170235 () Bool)

(assert (=> b!203216 (=> (not res!170235) (not e!139264))))

(assert (=> b!203216 (= res!170235 (and (= (size!4531 (buf!5036 (_2!9332 lt!316358))) (size!4531 (buf!5036 (_2!9332 lt!317072)))) (bvsge lt!317054 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203216 (= lt!317054 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203216 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8170 BitStream!8170) tuple2!17386)

(assert (=> b!203216 (= lt!317070 (reader!0 (_2!9332 lt!316358) (_2!9332 lt!317072)))))

(declare-fun b!203217 () Bool)

(declare-fun e!139271 () tuple2!17360)

(declare-fun Unit!14438 () Unit!14421)

(assert (=> b!203217 (= e!139271 (tuple2!17361 Unit!14438 (_2!9332 lt!316358)))))

(declare-fun lt!317076 () Unit!14421)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8170) Unit!14421)

(assert (=> b!203217 (= lt!317076 (lemmaIsPrefixRefl!0 (_2!9332 lt!316358)))))

(assert (=> b!203217 call!3207))

(declare-fun lt!317059 () Unit!14421)

(assert (=> b!203217 (= lt!317059 lt!317076)))

(declare-fun b!203218 () Bool)

(declare-fun res!170234 () Bool)

(assert (=> b!203218 (=> (not res!170234) (not e!139267))))

(assert (=> b!203218 (= res!170234 (= (size!4531 (buf!5036 (_2!9332 lt!316358))) (size!4531 (buf!5036 (_2!9332 lt!317072)))))))

(declare-fun b!203219 () Bool)

(assert (=> b!203219 (= lt!317028 (readBitPure!0 (readerFrom!0 (_2!9332 lt!317067) (currentBit!9480 (_2!9332 lt!316358)) (currentByte!9485 (_2!9332 lt!316358)))))))

(declare-fun lt!317046 () Bool)

(declare-fun res!170232 () Bool)

(assert (=> b!203219 (= res!170232 (and (= (_2!9333 lt!317028) lt!317046) (= (_1!9333 lt!317028) (_2!9332 lt!317067))))))

(assert (=> b!203219 (=> (not res!170232) (not e!139270))))

(declare-fun e!139269 () Bool)

(assert (=> b!203219 (= e!139269 e!139270)))

(declare-fun b!203220 () Bool)

(declare-fun res!170233 () Bool)

(assert (=> b!203220 (= res!170233 (isPrefixOf!0 (_2!9332 lt!316358) (_2!9332 lt!317067)))))

(assert (=> b!203220 (=> (not res!170233) (not e!139269))))

(declare-fun b!203221 () Bool)

(declare-fun res!170230 () Bool)

(assert (=> b!203221 (=> (not res!170230) (not e!139267))))

(declare-fun lt!317075 () (_ BitVec 64))

(declare-fun lt!317065 () (_ BitVec 64))

(assert (=> b!203221 (= res!170230 (= (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317072))) (currentByte!9485 (_2!9332 lt!317072)) (currentBit!9480 (_2!9332 lt!317072))) (bvsub lt!317065 lt!317075)))))

(assert (=> b!203221 (or (= (bvand lt!317065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317065 lt!317075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203221 (= lt!317075 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!317062 () (_ BitVec 64))

(declare-fun lt!317042 () (_ BitVec 64))

(assert (=> b!203221 (= lt!317065 (bvadd lt!317062 lt!317042))))

(assert (=> b!203221 (or (not (= (bvand lt!317062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317042 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317062 lt!317042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203221 (= lt!317042 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203221 (= lt!317062 (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))))))

(declare-fun b!203222 () Bool)

(declare-fun res!170236 () Bool)

(assert (=> b!203222 (= res!170236 (= (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317067))) (currentByte!9485 (_2!9332 lt!317067)) (currentBit!9480 (_2!9332 lt!317067))) (bvadd (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!203222 (=> (not res!170236) (not e!139269))))

(declare-fun d!69419 () Bool)

(assert (=> d!69419 e!139267))

(declare-fun res!170239 () Bool)

(assert (=> d!69419 (=> (not res!170239) (not e!139267))))

(assert (=> d!69419 (= res!170239 (invariant!0 (currentBit!9480 (_2!9332 lt!317072)) (currentByte!9485 (_2!9332 lt!317072)) (size!4531 (buf!5036 (_2!9332 lt!317072)))))))

(assert (=> d!69419 (= lt!317072 e!139271)))

(assert (=> d!69419 (= c!10079 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69419 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69419 (= (appendBitsLSBFirstLoopTR!0 (_2!9332 lt!316358) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!317072)))

(declare-fun b!203223 () Bool)

(assert (=> b!203223 (= e!139271 (tuple2!17361 (_1!9332 lt!317034) (_2!9332 lt!317034)))))

(assert (=> b!203223 (= lt!317046 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203223 (= lt!317067 (appendBit!0 (_2!9332 lt!316358) lt!317046))))

(declare-fun res!170238 () Bool)

(assert (=> b!203223 (= res!170238 (= (size!4531 (buf!5036 (_2!9332 lt!316358))) (size!4531 (buf!5036 (_2!9332 lt!317067)))))))

(assert (=> b!203223 (=> (not res!170238) (not e!139269))))

(assert (=> b!203223 e!139269))

(declare-fun lt!317048 () tuple2!17360)

(assert (=> b!203223 (= lt!317048 lt!317067)))

(assert (=> b!203223 (= lt!317034 (appendBitsLSBFirstLoopTR!0 (_2!9332 lt!317048) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!317063 () Unit!14421)

(assert (=> b!203223 (= lt!317063 (lemmaIsPrefixTransitive!0 (_2!9332 lt!316358) (_2!9332 lt!317048) (_2!9332 lt!317034)))))

(assert (=> b!203223 call!3207))

(declare-fun lt!317023 () Unit!14421)

(assert (=> b!203223 (= lt!317023 lt!317063)))

(assert (=> b!203223 (invariant!0 (currentBit!9480 (_2!9332 lt!316358)) (currentByte!9485 (_2!9332 lt!316358)) (size!4531 (buf!5036 (_2!9332 lt!317048))))))

(declare-fun lt!317039 () BitStream!8170)

(assert (=> b!203223 (= lt!317039 (BitStream!8171 (buf!5036 (_2!9332 lt!317048)) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))))))

(assert (=> b!203223 (invariant!0 (currentBit!9480 lt!317039) (currentByte!9485 lt!317039) (size!4531 (buf!5036 (_2!9332 lt!317034))))))

(declare-fun lt!317025 () BitStream!8170)

(assert (=> b!203223 (= lt!317025 (BitStream!8171 (buf!5036 (_2!9332 lt!317034)) (currentByte!9485 lt!317039) (currentBit!9480 lt!317039)))))

(declare-fun lt!317057 () tuple2!17362)

(assert (=> b!203223 (= lt!317057 (readBitPure!0 lt!317039))))

(declare-fun lt!317051 () tuple2!17362)

(assert (=> b!203223 (= lt!317051 (readBitPure!0 lt!317025))))

(declare-fun lt!317060 () Unit!14421)

(declare-fun readBitPrefixLemma!0 (BitStream!8170 BitStream!8170) Unit!14421)

(assert (=> b!203223 (= lt!317060 (readBitPrefixLemma!0 lt!317039 (_2!9332 lt!317034)))))

(declare-fun res!170240 () Bool)

(assert (=> b!203223 (= res!170240 (= (bitIndex!0 (size!4531 (buf!5036 (_1!9333 lt!317057))) (currentByte!9485 (_1!9333 lt!317057)) (currentBit!9480 (_1!9333 lt!317057))) (bitIndex!0 (size!4531 (buf!5036 (_1!9333 lt!317051))) (currentByte!9485 (_1!9333 lt!317051)) (currentBit!9480 (_1!9333 lt!317051)))))))

(declare-fun e!139266 () Bool)

(assert (=> b!203223 (=> (not res!170240) (not e!139266))))

(assert (=> b!203223 e!139266))

(declare-fun lt!317069 () Unit!14421)

(assert (=> b!203223 (= lt!317069 lt!317060)))

(declare-fun lt!317050 () tuple2!17386)

(assert (=> b!203223 (= lt!317050 (reader!0 (_2!9332 lt!316358) (_2!9332 lt!317034)))))

(declare-fun lt!317078 () tuple2!17386)

(assert (=> b!203223 (= lt!317078 (reader!0 (_2!9332 lt!317048) (_2!9332 lt!317034)))))

(declare-fun lt!317030 () tuple2!17362)

(assert (=> b!203223 (= lt!317030 (readBitPure!0 (_1!9345 lt!317050)))))

(assert (=> b!203223 (= (_2!9333 lt!317030) lt!317046)))

(declare-fun lt!317074 () Unit!14421)

(declare-fun Unit!14440 () Unit!14421)

(assert (=> b!203223 (= lt!317074 Unit!14440)))

(declare-fun lt!317064 () (_ BitVec 64))

(assert (=> b!203223 (= lt!317064 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317077 () (_ BitVec 64))

(assert (=> b!203223 (= lt!317077 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317056 () Unit!14421)

(assert (=> b!203223 (= lt!317056 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9332 lt!316358) (buf!5036 (_2!9332 lt!317034)) lt!317077))))

(assert (=> b!203223 (validate_offset_bits!1 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!317034)))) ((_ sign_extend 32) (currentByte!9485 (_2!9332 lt!316358))) ((_ sign_extend 32) (currentBit!9480 (_2!9332 lt!316358))) lt!317077)))

(declare-fun lt!317027 () Unit!14421)

(assert (=> b!203223 (= lt!317027 lt!317056)))

(declare-fun lt!317043 () tuple2!17384)

(assert (=> b!203223 (= lt!317043 (readNBitsLSBFirstsLoopPure!0 (_1!9345 lt!317050) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317064))))

(declare-fun lt!317068 () (_ BitVec 64))

(assert (=> b!203223 (= lt!317068 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!317026 () Unit!14421)

(assert (=> b!203223 (= lt!317026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9332 lt!317048) (buf!5036 (_2!9332 lt!317034)) lt!317068))))

(assert (=> b!203223 (validate_offset_bits!1 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!317034)))) ((_ sign_extend 32) (currentByte!9485 (_2!9332 lt!317048))) ((_ sign_extend 32) (currentBit!9480 (_2!9332 lt!317048))) lt!317068)))

(declare-fun lt!317041 () Unit!14421)

(assert (=> b!203223 (= lt!317041 lt!317026)))

(declare-fun lt!317052 () tuple2!17384)

(assert (=> b!203223 (= lt!317052 (readNBitsLSBFirstsLoopPure!0 (_1!9345 lt!317078) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317064 (ite (_2!9333 lt!317030) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!317038 () tuple2!17384)

(assert (=> b!203223 (= lt!317038 (readNBitsLSBFirstsLoopPure!0 (_1!9345 lt!317050) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317064))))

(declare-fun c!10078 () Bool)

(assert (=> b!203223 (= c!10078 (_2!9333 (readBitPure!0 (_1!9345 lt!317050))))))

(declare-fun lt!317044 () tuple2!17384)

(declare-fun withMovedBitIndex!0 (BitStream!8170 (_ BitVec 64)) BitStream!8170)

(assert (=> b!203223 (= lt!317044 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9345 lt!317050) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317064 e!139268)))))

(declare-fun lt!317066 () Unit!14421)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14421)

(assert (=> b!203223 (= lt!317066 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9345 lt!317050) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317064))))

(assert (=> b!203223 (and (= (_2!9344 lt!317038) (_2!9344 lt!317044)) (= (_1!9344 lt!317038) (_1!9344 lt!317044)))))

(declare-fun lt!317035 () Unit!14421)

(assert (=> b!203223 (= lt!317035 lt!317066)))

(assert (=> b!203223 (= (_1!9345 lt!317050) (withMovedBitIndex!0 (_2!9345 lt!317050) (bvsub (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))) (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317034))) (currentByte!9485 (_2!9332 lt!317034)) (currentBit!9480 (_2!9332 lt!317034))))))))

(declare-fun lt!317055 () Unit!14421)

(declare-fun Unit!14441 () Unit!14421)

(assert (=> b!203223 (= lt!317055 Unit!14441)))

(assert (=> b!203223 (= (_1!9345 lt!317078) (withMovedBitIndex!0 (_2!9345 lt!317078) (bvsub (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317048))) (currentByte!9485 (_2!9332 lt!317048)) (currentBit!9480 (_2!9332 lt!317048))) (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317034))) (currentByte!9485 (_2!9332 lt!317034)) (currentBit!9480 (_2!9332 lt!317034))))))))

(declare-fun lt!317031 () Unit!14421)

(declare-fun Unit!14442 () Unit!14421)

(assert (=> b!203223 (= lt!317031 Unit!14442)))

(assert (=> b!203223 (= (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))) (bvsub (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317048))) (currentByte!9485 (_2!9332 lt!317048)) (currentBit!9480 (_2!9332 lt!317048))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!317024 () Unit!14421)

(declare-fun Unit!14443 () Unit!14421)

(assert (=> b!203223 (= lt!317024 Unit!14443)))

(assert (=> b!203223 (= (_2!9344 lt!317043) (_2!9344 lt!317052))))

(declare-fun lt!317029 () Unit!14421)

(declare-fun Unit!14444 () Unit!14421)

(assert (=> b!203223 (= lt!317029 Unit!14444)))

(assert (=> b!203223 (invariant!0 (currentBit!9480 (_2!9332 lt!317034)) (currentByte!9485 (_2!9332 lt!317034)) (size!4531 (buf!5036 (_2!9332 lt!317034))))))

(declare-fun lt!317040 () Unit!14421)

(declare-fun Unit!14445 () Unit!14421)

(assert (=> b!203223 (= lt!317040 Unit!14445)))

(assert (=> b!203223 (= (size!4531 (buf!5036 (_2!9332 lt!316358))) (size!4531 (buf!5036 (_2!9332 lt!317034))))))

(declare-fun lt!317049 () Unit!14421)

(declare-fun Unit!14446 () Unit!14421)

(assert (=> b!203223 (= lt!317049 Unit!14446)))

(assert (=> b!203223 (= (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!317034))) (currentByte!9485 (_2!9332 lt!317034)) (currentBit!9480 (_2!9332 lt!317034))) (bvsub (bvadd (bitIndex!0 (size!4531 (buf!5036 (_2!9332 lt!316358))) (currentByte!9485 (_2!9332 lt!316358)) (currentBit!9480 (_2!9332 lt!316358))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317053 () Unit!14421)

(declare-fun Unit!14448 () Unit!14421)

(assert (=> b!203223 (= lt!317053 Unit!14448)))

(declare-fun lt!317058 () Unit!14421)

(declare-fun Unit!14449 () Unit!14421)

(assert (=> b!203223 (= lt!317058 Unit!14449)))

(assert (=> b!203223 (= lt!317032 (reader!0 (_2!9332 lt!316358) (_2!9332 lt!317034)))))

(declare-fun lt!317071 () (_ BitVec 64))

(assert (=> b!203223 (= lt!317071 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317073 () Unit!14421)

(assert (=> b!203223 (= lt!317073 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9332 lt!316358) (buf!5036 (_2!9332 lt!317034)) lt!317071))))

(assert (=> b!203223 (validate_offset_bits!1 ((_ sign_extend 32) (size!4531 (buf!5036 (_2!9332 lt!317034)))) ((_ sign_extend 32) (currentByte!9485 (_2!9332 lt!316358))) ((_ sign_extend 32) (currentBit!9480 (_2!9332 lt!316358))) lt!317071)))

(declare-fun lt!317036 () Unit!14421)

(assert (=> b!203223 (= lt!317036 lt!317073)))

(assert (=> b!203223 (= lt!317045 (readNBitsLSBFirstsLoopPure!0 (_1!9345 lt!317032) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170231 () Bool)

(assert (=> b!203223 (= res!170231 (= (_2!9344 lt!317045) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!203223 (=> (not res!170231) (not e!139272))))

(assert (=> b!203223 e!139272))

(declare-fun lt!317037 () Unit!14421)

(declare-fun Unit!14450 () Unit!14421)

(assert (=> b!203223 (= lt!317037 Unit!14450)))

(declare-fun b!203224 () Bool)

(assert (=> b!203224 (= e!139265 (= (_1!9344 lt!317061) (_2!9345 lt!317070)))))

(declare-fun b!203225 () Bool)

(assert (=> b!203225 (= e!139266 (= (_2!9333 lt!317057) (_2!9333 lt!317051)))))

(declare-fun b!203226 () Bool)

(assert (=> b!203226 (= e!139268 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!69419 c!10079) b!203217))

(assert (= (and d!69419 (not c!10079)) b!203223))

(assert (= (and b!203223 res!170238) b!203222))

(assert (= (and b!203222 res!170236) b!203220))

(assert (= (and b!203220 res!170233) b!203219))

(assert (= (and b!203219 res!170232) b!203214))

(assert (= (and b!203223 res!170240) b!203225))

(assert (= (and b!203223 c!10078) b!203213))

(assert (= (and b!203223 (not c!10078)) b!203226))

(assert (= (and b!203223 res!170231) b!203211))

(assert (= (or b!203217 b!203223) bm!3204))

(assert (= (and d!69419 res!170239) b!203218))

(assert (= (and b!203218 res!170234) b!203221))

(assert (= (and b!203221 res!170230) b!203215))

(assert (= (and b!203215 res!170237) b!203216))

(assert (= (and b!203216 res!170235) b!203212))

(assert (= (and b!203216 res!170229) b!203224))

(declare-fun m!313955 () Bool)

(assert (=> b!203221 m!313955))

(assert (=> b!203221 m!313583))

(declare-fun m!313957 () Bool)

(assert (=> b!203222 m!313957))

(assert (=> b!203222 m!313583))

(declare-fun m!313959 () Bool)

(assert (=> bm!3204 m!313959))

(declare-fun m!313961 () Bool)

(assert (=> b!203217 m!313961))

(declare-fun m!313963 () Bool)

(assert (=> d!69419 m!313963))

(declare-fun m!313965 () Bool)

(assert (=> b!203216 m!313965))

(declare-fun m!313967 () Bool)

(assert (=> b!203216 m!313967))

(declare-fun m!313969 () Bool)

(assert (=> b!203216 m!313969))

(declare-fun m!313971 () Bool)

(assert (=> b!203216 m!313971))

(declare-fun m!313973 () Bool)

(assert (=> b!203216 m!313973))

(declare-fun m!313975 () Bool)

(assert (=> b!203216 m!313975))

(declare-fun m!313977 () Bool)

(assert (=> b!203219 m!313977))

(assert (=> b!203219 m!313977))

(declare-fun m!313979 () Bool)

(assert (=> b!203219 m!313979))

(declare-fun m!313981 () Bool)

(assert (=> b!203215 m!313981))

(declare-fun m!313983 () Bool)

(assert (=> b!203223 m!313983))

(declare-fun m!313985 () Bool)

(assert (=> b!203223 m!313985))

(declare-fun m!313987 () Bool)

(assert (=> b!203223 m!313987))

(declare-fun m!313989 () Bool)

(assert (=> b!203223 m!313989))

(declare-fun m!313991 () Bool)

(assert (=> b!203223 m!313991))

(declare-fun m!313993 () Bool)

(assert (=> b!203223 m!313993))

(declare-fun m!313995 () Bool)

(assert (=> b!203223 m!313995))

(declare-fun m!313997 () Bool)

(assert (=> b!203223 m!313997))

(declare-fun m!313999 () Bool)

(assert (=> b!203223 m!313999))

(declare-fun m!314001 () Bool)

(assert (=> b!203223 m!314001))

(declare-fun m!314003 () Bool)

(assert (=> b!203223 m!314003))

(declare-fun m!314005 () Bool)

(assert (=> b!203223 m!314005))

(assert (=> b!203223 m!313975))

(declare-fun m!314007 () Bool)

(assert (=> b!203223 m!314007))

(assert (=> b!203223 m!313997))

(declare-fun m!314009 () Bool)

(assert (=> b!203223 m!314009))

(declare-fun m!314011 () Bool)

(assert (=> b!203223 m!314011))

(assert (=> b!203223 m!313967))

(declare-fun m!314013 () Bool)

(assert (=> b!203223 m!314013))

(declare-fun m!314015 () Bool)

(assert (=> b!203223 m!314015))

(declare-fun m!314017 () Bool)

(assert (=> b!203223 m!314017))

(declare-fun m!314019 () Bool)

(assert (=> b!203223 m!314019))

(declare-fun m!314021 () Bool)

(assert (=> b!203223 m!314021))

(declare-fun m!314023 () Bool)

(assert (=> b!203223 m!314023))

(declare-fun m!314025 () Bool)

(assert (=> b!203223 m!314025))

(declare-fun m!314027 () Bool)

(assert (=> b!203223 m!314027))

(declare-fun m!314029 () Bool)

(assert (=> b!203223 m!314029))

(declare-fun m!314031 () Bool)

(assert (=> b!203223 m!314031))

(declare-fun m!314033 () Bool)

(assert (=> b!203223 m!314033))

(declare-fun m!314035 () Bool)

(assert (=> b!203223 m!314035))

(declare-fun m!314037 () Bool)

(assert (=> b!203223 m!314037))

(declare-fun m!314039 () Bool)

(assert (=> b!203223 m!314039))

(assert (=> b!203223 m!313583))

(declare-fun m!314041 () Bool)

(assert (=> b!203223 m!314041))

(declare-fun m!314043 () Bool)

(assert (=> b!203214 m!314043))

(assert (=> b!203214 m!313957))

(declare-fun m!314045 () Bool)

(assert (=> b!203212 m!314045))

(declare-fun m!314047 () Bool)

(assert (=> b!203220 m!314047))

(assert (=> b!202899 d!69419))

(push 1)

(assert (not b!203219))

(assert (not b!203016))

(assert (not d!69391))

(assert (not d!69395))

(assert (not b!203217))

(assert (not d!69385))

(assert (not b!203222))

(assert (not b!203216))

(assert (not b!203221))

(assert (not b!202997))

(assert (not d!69381))

(assert (not b!203215))

(assert (not d!69393))

(assert (not d!69405))

(assert (not d!69413))

(assert (not b!203214))

(assert (not d!69417))

(assert (not b!202986))

(assert (not b!203018))

(assert (not d!69397))

(assert (not b!203223))

(assert (not b!202984))

(assert (not b!203021))

(assert (not d!69419))

(assert (not bm!3204))

(assert (not b!203023))

(assert (not b!203220))

(assert (not b!203212))

(assert (not b!203017))

(assert (not b!203015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

