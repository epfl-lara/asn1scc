; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43600 () Bool)

(assert start!43600)

(declare-fun b!206288 () Bool)

(declare-fun res!172962 () Bool)

(declare-fun e!141061 () Bool)

(assert (=> b!206288 (=> res!172962 e!141061)))

(declare-datatypes ((array!10383 0))(
  ( (array!10384 (arr!5493 (Array (_ BitVec 32) (_ BitVec 8))) (size!4563 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8234 0))(
  ( (BitStream!8235 (buf!5068 array!10383) (currentByte!9586 (_ BitVec 32)) (currentBit!9581 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8234)

(declare-datatypes ((Unit!14720 0))(
  ( (Unit!14721) )
))
(declare-datatypes ((tuple2!17624 0))(
  ( (tuple2!17625 (_1!9467 Unit!14720) (_2!9467 BitStream!8234)) )
))
(declare-fun lt!322478 () tuple2!17624)

(declare-fun isPrefixOf!0 (BitStream!8234 BitStream!8234) Bool)

(assert (=> b!206288 (= res!172962 (not (isPrefixOf!0 thiss!1204 (_2!9467 lt!322478))))))

(declare-fun b!206289 () Bool)

(declare-fun e!141059 () Bool)

(declare-fun e!141062 () Bool)

(assert (=> b!206289 (= e!141059 e!141062)))

(declare-fun res!172955 () Bool)

(assert (=> b!206289 (=> (not res!172955) (not e!141062))))

(declare-fun lt!322482 () (_ BitVec 64))

(declare-fun lt!322483 () (_ BitVec 64))

(assert (=> b!206289 (= res!172955 (= lt!322482 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322483)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206289 (= lt!322482 (bitIndex!0 (size!4563 (buf!5068 (_2!9467 lt!322478))) (currentByte!9586 (_2!9467 lt!322478)) (currentBit!9581 (_2!9467 lt!322478))))))

(assert (=> b!206289 (= lt!322483 (bitIndex!0 (size!4563 (buf!5068 thiss!1204)) (currentByte!9586 thiss!1204) (currentBit!9581 thiss!1204)))))

(declare-fun b!206290 () Bool)

(declare-fun e!141058 () Bool)

(declare-fun lt!322471 () tuple2!17624)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206290 (= e!141058 (invariant!0 (currentBit!9581 thiss!1204) (currentByte!9586 thiss!1204) (size!4563 (buf!5068 (_2!9467 lt!322471)))))))

(declare-fun b!206291 () Bool)

(declare-fun res!172968 () Bool)

(declare-fun e!141065 () Bool)

(assert (=> b!206291 (=> (not res!172968) (not e!141065))))

(assert (=> b!206291 (= res!172968 (invariant!0 (currentBit!9581 thiss!1204) (currentByte!9586 thiss!1204) (size!4563 (buf!5068 thiss!1204))))))

(declare-fun b!206292 () Bool)

(declare-fun res!172958 () Bool)

(assert (=> b!206292 (=> res!172958 e!141061)))

(declare-fun lt!322481 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!322480 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!206292 (= res!172958 (or (not (= (size!4563 (buf!5068 (_2!9467 lt!322471))) (size!4563 (buf!5068 thiss!1204)))) (not (= lt!322481 (bvsub (bvadd lt!322480 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206293 () Bool)

(declare-fun res!172965 () Bool)

(assert (=> b!206293 (=> res!172965 e!141061)))

(assert (=> b!206293 (= res!172965 (not (isPrefixOf!0 (_2!9467 lt!322478) (_2!9467 lt!322471))))))

(declare-fun b!206294 () Bool)

(declare-fun e!141064 () Bool)

(declare-datatypes ((tuple2!17626 0))(
  ( (tuple2!17627 (_1!9468 BitStream!8234) (_2!9468 Bool)) )
))
(declare-fun lt!322477 () tuple2!17626)

(declare-fun lt!322476 () tuple2!17626)

(assert (=> b!206294 (= e!141064 (= (_2!9468 lt!322477) (_2!9468 lt!322476)))))

(declare-fun b!206295 () Bool)

(declare-fun res!172961 () Bool)

(assert (=> b!206295 (=> (not res!172961) (not e!141065))))

(assert (=> b!206295 (= res!172961 (not (= i!590 nBits!348)))))

(declare-fun b!206296 () Bool)

(declare-fun res!172957 () Bool)

(assert (=> b!206296 (=> (not res!172957) (not e!141065))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206296 (= res!172957 (validate_offset_bits!1 ((_ sign_extend 32) (size!4563 (buf!5068 thiss!1204))) ((_ sign_extend 32) (currentByte!9586 thiss!1204)) ((_ sign_extend 32) (currentBit!9581 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206297 () Bool)

(declare-fun e!141060 () Bool)

(declare-fun array_inv!4304 (array!10383) Bool)

(assert (=> b!206297 (= e!141060 (array_inv!4304 (buf!5068 thiss!1204)))))

(declare-fun b!206299 () Bool)

(declare-fun res!172969 () Bool)

(assert (=> b!206299 (=> (not res!172969) (not e!141062))))

(assert (=> b!206299 (= res!172969 (isPrefixOf!0 thiss!1204 (_2!9467 lt!322478)))))

(declare-fun b!206300 () Bool)

(declare-fun res!172960 () Bool)

(assert (=> b!206300 (=> res!172960 e!141061)))

(assert (=> b!206300 (= res!172960 (not (invariant!0 (currentBit!9581 (_2!9467 lt!322471)) (currentByte!9586 (_2!9467 lt!322471)) (size!4563 (buf!5068 (_2!9467 lt!322471))))))))

(declare-fun b!206301 () Bool)

(declare-fun e!141066 () Bool)

(assert (=> b!206301 (= e!141062 e!141066)))

(declare-fun res!172956 () Bool)

(assert (=> b!206301 (=> (not res!172956) (not e!141066))))

(declare-fun lt!322472 () tuple2!17626)

(declare-fun lt!322469 () Bool)

(assert (=> b!206301 (= res!172956 (and (= (_2!9468 lt!322472) lt!322469) (= (_1!9468 lt!322472) (_2!9467 lt!322478))))))

(declare-fun readBitPure!0 (BitStream!8234) tuple2!17626)

(declare-fun readerFrom!0 (BitStream!8234 (_ BitVec 32) (_ BitVec 32)) BitStream!8234)

(assert (=> b!206301 (= lt!322472 (readBitPure!0 (readerFrom!0 (_2!9467 lt!322478) (currentBit!9581 thiss!1204) (currentByte!9586 thiss!1204))))))

(declare-fun b!206302 () Bool)

(declare-fun e!141063 () Bool)

(assert (=> b!206302 (= e!141063 e!141061)))

(declare-fun res!172967 () Bool)

(assert (=> b!206302 (=> res!172967 e!141061)))

(declare-fun lt!322474 () (_ BitVec 64))

(assert (=> b!206302 (= res!172967 (not (= lt!322481 (bvsub (bvsub (bvadd lt!322474 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206302 (= lt!322481 (bitIndex!0 (size!4563 (buf!5068 (_2!9467 lt!322471))) (currentByte!9586 (_2!9467 lt!322471)) (currentBit!9581 (_2!9467 lt!322471))))))

(assert (=> b!206302 (isPrefixOf!0 thiss!1204 (_2!9467 lt!322471))))

(declare-fun lt!322479 () Unit!14720)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8234 BitStream!8234 BitStream!8234) Unit!14720)

(assert (=> b!206302 (= lt!322479 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9467 lt!322478) (_2!9467 lt!322471)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8234 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17624)

(assert (=> b!206302 (= lt!322471 (appendBitsLSBFirstLoopTR!0 (_2!9467 lt!322478) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206303 () Bool)

(assert (=> b!206303 (= e!141066 (= (bitIndex!0 (size!4563 (buf!5068 (_1!9468 lt!322472))) (currentByte!9586 (_1!9468 lt!322472)) (currentBit!9581 (_1!9468 lt!322472))) lt!322482))))

(declare-fun b!206304 () Bool)

(assert (=> b!206304 (= e!141065 (not e!141063))))

(declare-fun res!172970 () Bool)

(assert (=> b!206304 (=> res!172970 e!141063)))

(assert (=> b!206304 (= res!172970 (not (= lt!322474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322480))))))

(assert (=> b!206304 (= lt!322474 (bitIndex!0 (size!4563 (buf!5068 (_2!9467 lt!322478))) (currentByte!9586 (_2!9467 lt!322478)) (currentBit!9581 (_2!9467 lt!322478))))))

(assert (=> b!206304 (= lt!322480 (bitIndex!0 (size!4563 (buf!5068 thiss!1204)) (currentByte!9586 thiss!1204) (currentBit!9581 thiss!1204)))))

(assert (=> b!206304 e!141059))

(declare-fun res!172959 () Bool)

(assert (=> b!206304 (=> (not res!172959) (not e!141059))))

(assert (=> b!206304 (= res!172959 (= (size!4563 (buf!5068 thiss!1204)) (size!4563 (buf!5068 (_2!9467 lt!322478)))))))

(declare-fun appendBit!0 (BitStream!8234 Bool) tuple2!17624)

(assert (=> b!206304 (= lt!322478 (appendBit!0 thiss!1204 lt!322469))))

(assert (=> b!206304 (= lt!322469 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!172963 () Bool)

(assert (=> start!43600 (=> (not res!172963) (not e!141065))))

(assert (=> start!43600 (= res!172963 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43600 e!141065))

(assert (=> start!43600 true))

(declare-fun inv!12 (BitStream!8234) Bool)

(assert (=> start!43600 (and (inv!12 thiss!1204) e!141060)))

(declare-fun b!206298 () Bool)

(assert (=> b!206298 (= e!141061 (= (size!4563 (buf!5068 thiss!1204)) (size!4563 (buf!5068 (_2!9467 lt!322471)))))))

(declare-datatypes ((tuple2!17628 0))(
  ( (tuple2!17629 (_1!9469 BitStream!8234) (_2!9469 BitStream!8234)) )
))
(declare-fun lt!322475 () tuple2!17628)

(assert (=> b!206298 (= (_2!9468 (readBitPure!0 (_1!9469 lt!322475))) lt!322469)))

(declare-fun lt!322484 () tuple2!17628)

(declare-fun reader!0 (BitStream!8234 BitStream!8234) tuple2!17628)

(assert (=> b!206298 (= lt!322484 (reader!0 (_2!9467 lt!322478) (_2!9467 lt!322471)))))

(assert (=> b!206298 (= lt!322475 (reader!0 thiss!1204 (_2!9467 lt!322471)))))

(assert (=> b!206298 e!141064))

(declare-fun res!172964 () Bool)

(assert (=> b!206298 (=> (not res!172964) (not e!141064))))

(assert (=> b!206298 (= res!172964 (= (bitIndex!0 (size!4563 (buf!5068 (_1!9468 lt!322477))) (currentByte!9586 (_1!9468 lt!322477)) (currentBit!9581 (_1!9468 lt!322477))) (bitIndex!0 (size!4563 (buf!5068 (_1!9468 lt!322476))) (currentByte!9586 (_1!9468 lt!322476)) (currentBit!9581 (_1!9468 lt!322476)))))))

(declare-fun lt!322473 () Unit!14720)

(declare-fun lt!322470 () BitStream!8234)

(declare-fun readBitPrefixLemma!0 (BitStream!8234 BitStream!8234) Unit!14720)

(assert (=> b!206298 (= lt!322473 (readBitPrefixLemma!0 lt!322470 (_2!9467 lt!322471)))))

(assert (=> b!206298 (= lt!322476 (readBitPure!0 (BitStream!8235 (buf!5068 (_2!9467 lt!322471)) (currentByte!9586 thiss!1204) (currentBit!9581 thiss!1204))))))

(assert (=> b!206298 (= lt!322477 (readBitPure!0 lt!322470))))

(assert (=> b!206298 e!141058))

(declare-fun res!172966 () Bool)

(assert (=> b!206298 (=> (not res!172966) (not e!141058))))

(assert (=> b!206298 (= res!172966 (invariant!0 (currentBit!9581 thiss!1204) (currentByte!9586 thiss!1204) (size!4563 (buf!5068 (_2!9467 lt!322478)))))))

(assert (=> b!206298 (= lt!322470 (BitStream!8235 (buf!5068 (_2!9467 lt!322478)) (currentByte!9586 thiss!1204) (currentBit!9581 thiss!1204)))))

(assert (= (and start!43600 res!172963) b!206296))

(assert (= (and b!206296 res!172957) b!206291))

(assert (= (and b!206291 res!172968) b!206295))

(assert (= (and b!206295 res!172961) b!206304))

(assert (= (and b!206304 res!172959) b!206289))

(assert (= (and b!206289 res!172955) b!206299))

(assert (= (and b!206299 res!172969) b!206301))

(assert (= (and b!206301 res!172956) b!206303))

(assert (= (and b!206304 (not res!172970)) b!206302))

(assert (= (and b!206302 (not res!172967)) b!206300))

(assert (= (and b!206300 (not res!172960)) b!206292))

(assert (= (and b!206292 (not res!172958)) b!206293))

(assert (= (and b!206293 (not res!172965)) b!206288))

(assert (= (and b!206288 (not res!172962)) b!206298))

(assert (= (and b!206298 res!172966) b!206290))

(assert (= (and b!206298 res!172964) b!206294))

(assert (= start!43600 b!206297))

(declare-fun m!317841 () Bool)

(assert (=> b!206300 m!317841))

(declare-fun m!317843 () Bool)

(assert (=> b!206302 m!317843))

(declare-fun m!317845 () Bool)

(assert (=> b!206302 m!317845))

(declare-fun m!317847 () Bool)

(assert (=> b!206302 m!317847))

(declare-fun m!317849 () Bool)

(assert (=> b!206302 m!317849))

(declare-fun m!317851 () Bool)

(assert (=> b!206301 m!317851))

(assert (=> b!206301 m!317851))

(declare-fun m!317853 () Bool)

(assert (=> b!206301 m!317853))

(declare-fun m!317855 () Bool)

(assert (=> b!206296 m!317855))

(declare-fun m!317857 () Bool)

(assert (=> b!206298 m!317857))

(declare-fun m!317859 () Bool)

(assert (=> b!206298 m!317859))

(declare-fun m!317861 () Bool)

(assert (=> b!206298 m!317861))

(declare-fun m!317863 () Bool)

(assert (=> b!206298 m!317863))

(declare-fun m!317865 () Bool)

(assert (=> b!206298 m!317865))

(declare-fun m!317867 () Bool)

(assert (=> b!206298 m!317867))

(declare-fun m!317869 () Bool)

(assert (=> b!206298 m!317869))

(declare-fun m!317871 () Bool)

(assert (=> b!206298 m!317871))

(declare-fun m!317873 () Bool)

(assert (=> b!206298 m!317873))

(declare-fun m!317875 () Bool)

(assert (=> b!206304 m!317875))

(declare-fun m!317877 () Bool)

(assert (=> b!206304 m!317877))

(declare-fun m!317879 () Bool)

(assert (=> b!206304 m!317879))

(declare-fun m!317881 () Bool)

(assert (=> b!206297 m!317881))

(assert (=> b!206289 m!317875))

(assert (=> b!206289 m!317877))

(declare-fun m!317883 () Bool)

(assert (=> b!206299 m!317883))

(declare-fun m!317885 () Bool)

(assert (=> b!206293 m!317885))

(declare-fun m!317887 () Bool)

(assert (=> start!43600 m!317887))

(assert (=> b!206288 m!317883))

(declare-fun m!317889 () Bool)

(assert (=> b!206303 m!317889))

(declare-fun m!317891 () Bool)

(assert (=> b!206291 m!317891))

(declare-fun m!317893 () Bool)

(assert (=> b!206290 m!317893))

(push 1)

(assert (not b!206298))

(assert (not b!206291))

(assert (not b!206300))

(assert (not b!206297))

(assert (not b!206301))

(assert (not b!206303))

(assert (not b!206290))

(assert (not b!206304))

(assert (not b!206299))

(assert (not b!206296))

(assert (not b!206302))

(assert (not start!43600))

(assert (not b!206288))

(assert (not b!206289))

(assert (not b!206293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

