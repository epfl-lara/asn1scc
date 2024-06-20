; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41298 () Bool)

(assert start!41298)

(declare-fun b!193112 () Bool)

(declare-fun res!161382 () Bool)

(declare-fun e!132990 () Bool)

(assert (=> b!193112 (=> res!161382 e!132990)))

(declare-datatypes ((array!9972 0))(
  ( (array!9973 (arr!5328 (Array (_ BitVec 32) (_ BitVec 8))) (size!4398 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7904 0))(
  ( (BitStream!7905 (buf!4878 array!9972) (currentByte!9162 (_ BitVec 32)) (currentBit!9157 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13673 0))(
  ( (Unit!13674) )
))
(declare-datatypes ((tuple2!16716 0))(
  ( (tuple2!16717 (_1!9003 Unit!13673) (_2!9003 BitStream!7904)) )
))
(declare-fun lt!299938 () tuple2!16716)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193112 (= res!161382 (not (invariant!0 (currentBit!9157 (_2!9003 lt!299938)) (currentByte!9162 (_2!9003 lt!299938)) (size!4398 (buf!4878 (_2!9003 lt!299938))))))))

(declare-fun b!193114 () Bool)

(declare-fun res!161371 () Bool)

(declare-fun e!133001 () Bool)

(assert (=> b!193114 (=> (not res!161371) (not e!133001))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!16718 0))(
  ( (tuple2!16719 (_1!9004 BitStream!7904) (_2!9004 (_ BitVec 64))) )
))
(declare-fun lt!299951 () tuple2!16718)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193114 (= res!161371 (= (_2!9004 lt!299951) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!193115 () Bool)

(declare-fun e!132995 () Bool)

(assert (=> b!193115 (= e!132990 e!132995)))

(declare-fun res!161377 () Bool)

(assert (=> b!193115 (=> res!161377 e!132995)))

(declare-fun lt!299956 () tuple2!16718)

(declare-datatypes ((tuple2!16720 0))(
  ( (tuple2!16721 (_1!9005 BitStream!7904) (_2!9005 BitStream!7904)) )
))
(declare-fun lt!299944 () tuple2!16720)

(assert (=> b!193115 (= res!161377 (not (= (_1!9004 lt!299956) (_2!9005 lt!299944))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!299929 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16718)

(assert (=> b!193115 (= lt!299956 (readNBitsLSBFirstsLoopPure!0 (_1!9005 lt!299944) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299929))))

(declare-fun lt!299949 () tuple2!16716)

(declare-fun lt!299940 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193115 (validate_offset_bits!1 ((_ sign_extend 32) (size!4398 (buf!4878 (_2!9003 lt!299938)))) ((_ sign_extend 32) (currentByte!9162 (_2!9003 lt!299949))) ((_ sign_extend 32) (currentBit!9157 (_2!9003 lt!299949))) lt!299940)))

(declare-fun lt!299928 () Unit!13673)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7904 array!9972 (_ BitVec 64)) Unit!13673)

(assert (=> b!193115 (= lt!299928 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9003 lt!299949) (buf!4878 (_2!9003 lt!299938)) lt!299940))))

(assert (=> b!193115 (= lt!299940 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!299933 () (_ BitVec 64))

(declare-datatypes ((tuple2!16722 0))(
  ( (tuple2!16723 (_1!9006 BitStream!7904) (_2!9006 Bool)) )
))
(declare-fun lt!299932 () tuple2!16722)

(declare-fun lt!299936 () (_ BitVec 64))

(assert (=> b!193115 (= lt!299929 (bvor lt!299936 (ite (_2!9006 lt!299932) lt!299933 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!299930 () tuple2!16720)

(assert (=> b!193115 (= lt!299951 (readNBitsLSBFirstsLoopPure!0 (_1!9005 lt!299930) nBits!348 i!590 lt!299936))))

(declare-fun thiss!1204 () BitStream!7904)

(declare-fun lt!299948 () (_ BitVec 64))

(assert (=> b!193115 (validate_offset_bits!1 ((_ sign_extend 32) (size!4398 (buf!4878 (_2!9003 lt!299938)))) ((_ sign_extend 32) (currentByte!9162 thiss!1204)) ((_ sign_extend 32) (currentBit!9157 thiss!1204)) lt!299948)))

(declare-fun lt!299954 () Unit!13673)

(assert (=> b!193115 (= lt!299954 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4878 (_2!9003 lt!299938)) lt!299948))))

(assert (=> b!193115 (= lt!299936 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!299952 () Bool)

(assert (=> b!193115 (= (_2!9006 lt!299932) lt!299952)))

(declare-fun readBitPure!0 (BitStream!7904) tuple2!16722)

(assert (=> b!193115 (= lt!299932 (readBitPure!0 (_1!9005 lt!299930)))))

(declare-fun reader!0 (BitStream!7904 BitStream!7904) tuple2!16720)

(assert (=> b!193115 (= lt!299944 (reader!0 (_2!9003 lt!299949) (_2!9003 lt!299938)))))

(assert (=> b!193115 (= lt!299930 (reader!0 thiss!1204 (_2!9003 lt!299938)))))

(declare-fun e!132988 () Bool)

(assert (=> b!193115 e!132988))

(declare-fun res!161366 () Bool)

(assert (=> b!193115 (=> (not res!161366) (not e!132988))))

(declare-fun lt!299942 () tuple2!16722)

(declare-fun lt!299947 () tuple2!16722)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193115 (= res!161366 (= (bitIndex!0 (size!4398 (buf!4878 (_1!9006 lt!299942))) (currentByte!9162 (_1!9006 lt!299942)) (currentBit!9157 (_1!9006 lt!299942))) (bitIndex!0 (size!4398 (buf!4878 (_1!9006 lt!299947))) (currentByte!9162 (_1!9006 lt!299947)) (currentBit!9157 (_1!9006 lt!299947)))))))

(declare-fun lt!299945 () Unit!13673)

(declare-fun lt!299931 () BitStream!7904)

(declare-fun readBitPrefixLemma!0 (BitStream!7904 BitStream!7904) Unit!13673)

(assert (=> b!193115 (= lt!299945 (readBitPrefixLemma!0 lt!299931 (_2!9003 lt!299938)))))

(assert (=> b!193115 (= lt!299947 (readBitPure!0 (BitStream!7905 (buf!4878 (_2!9003 lt!299938)) (currentByte!9162 thiss!1204) (currentBit!9157 thiss!1204))))))

(assert (=> b!193115 (= lt!299942 (readBitPure!0 lt!299931))))

(declare-fun e!132987 () Bool)

(assert (=> b!193115 e!132987))

(declare-fun res!161375 () Bool)

(assert (=> b!193115 (=> (not res!161375) (not e!132987))))

(assert (=> b!193115 (= res!161375 (invariant!0 (currentBit!9157 thiss!1204) (currentByte!9162 thiss!1204) (size!4398 (buf!4878 (_2!9003 lt!299949)))))))

(assert (=> b!193115 (= lt!299931 (BitStream!7905 (buf!4878 (_2!9003 lt!299949)) (currentByte!9162 thiss!1204) (currentBit!9157 thiss!1204)))))

(declare-fun b!193116 () Bool)

(declare-fun res!161378 () Bool)

(declare-fun e!132991 () Bool)

(assert (=> b!193116 (=> res!161378 e!132991)))

(assert (=> b!193116 (= res!161378 (not (= (bitIndex!0 (size!4398 (buf!4878 (_1!9004 lt!299951))) (currentByte!9162 (_1!9004 lt!299951)) (currentBit!9157 (_1!9004 lt!299951))) (bitIndex!0 (size!4398 (buf!4878 (_2!9005 lt!299930))) (currentByte!9162 (_2!9005 lt!299930)) (currentBit!9157 (_2!9005 lt!299930))))))))

(declare-fun b!193117 () Bool)

(declare-fun e!132992 () Bool)

(declare-fun e!132999 () Bool)

(assert (=> b!193117 (= e!132992 (not e!132999))))

(declare-fun res!161362 () Bool)

(assert (=> b!193117 (=> res!161362 e!132999)))

(declare-fun lt!299939 () (_ BitVec 64))

(declare-fun lt!299955 () (_ BitVec 64))

(assert (=> b!193117 (= res!161362 (not (= lt!299939 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299955))))))

(assert (=> b!193117 (= lt!299939 (bitIndex!0 (size!4398 (buf!4878 (_2!9003 lt!299949))) (currentByte!9162 (_2!9003 lt!299949)) (currentBit!9157 (_2!9003 lt!299949))))))

(assert (=> b!193117 (= lt!299955 (bitIndex!0 (size!4398 (buf!4878 thiss!1204)) (currentByte!9162 thiss!1204) (currentBit!9157 thiss!1204)))))

(declare-fun e!132998 () Bool)

(assert (=> b!193117 e!132998))

(declare-fun res!161365 () Bool)

(assert (=> b!193117 (=> (not res!161365) (not e!132998))))

(assert (=> b!193117 (= res!161365 (= (size!4398 (buf!4878 thiss!1204)) (size!4398 (buf!4878 (_2!9003 lt!299949)))))))

(declare-fun appendBit!0 (BitStream!7904 Bool) tuple2!16716)

(assert (=> b!193117 (= lt!299949 (appendBit!0 thiss!1204 lt!299952))))

(assert (=> b!193117 (= lt!299952 (not (= (bvand v!189 lt!299933) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193117 (= lt!299933 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!193118 () Bool)

(assert (=> b!193118 (= e!132991 true)))

(assert (=> b!193118 e!133001))

(declare-fun res!161376 () Bool)

(assert (=> b!193118 (=> (not res!161376) (not e!133001))))

(assert (=> b!193118 (= res!161376 (= (size!4398 (buf!4878 thiss!1204)) (size!4398 (buf!4878 (_2!9003 lt!299938)))))))

(declare-fun b!193119 () Bool)

(declare-fun e!132997 () Bool)

(declare-fun array_inv!4139 (array!9972) Bool)

(assert (=> b!193119 (= e!132997 (array_inv!4139 (buf!4878 thiss!1204)))))

(declare-fun res!161379 () Bool)

(declare-fun e!132996 () Bool)

(assert (=> start!41298 (=> (not res!161379) (not e!132996))))

(assert (=> start!41298 (= res!161379 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41298 e!132996))

(assert (=> start!41298 true))

(declare-fun inv!12 (BitStream!7904) Bool)

(assert (=> start!41298 (and (inv!12 thiss!1204) e!132997)))

(declare-fun b!193113 () Bool)

(declare-fun e!133000 () Bool)

(declare-fun lt!299943 () tuple2!16722)

(declare-fun lt!299935 () (_ BitVec 64))

(assert (=> b!193113 (= e!133000 (= (bitIndex!0 (size!4398 (buf!4878 (_1!9006 lt!299943))) (currentByte!9162 (_1!9006 lt!299943)) (currentBit!9157 (_1!9006 lt!299943))) lt!299935))))

(declare-fun b!193120 () Bool)

(assert (=> b!193120 (= e!133001 (= (_1!9004 lt!299951) (_2!9005 lt!299930)))))

(declare-fun b!193121 () Bool)

(assert (=> b!193121 (= e!132988 (= (_2!9006 lt!299942) (_2!9006 lt!299947)))))

(declare-fun b!193122 () Bool)

(declare-fun e!132989 () Bool)

(declare-fun lt!299934 () BitStream!7904)

(assert (=> b!193122 (= e!132989 (and (= lt!299955 (bvsub lt!299939 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9005 lt!299944) lt!299934)) (= (_2!9004 lt!299951) (_2!9004 lt!299956)))))))

(declare-fun b!193123 () Bool)

(assert (=> b!193123 (= e!132987 (invariant!0 (currentBit!9157 thiss!1204) (currentByte!9162 thiss!1204) (size!4398 (buf!4878 (_2!9003 lt!299938)))))))

(declare-fun b!193124 () Bool)

(declare-fun e!132993 () Bool)

(assert (=> b!193124 (= e!132993 e!133000)))

(declare-fun res!161370 () Bool)

(assert (=> b!193124 (=> (not res!161370) (not e!133000))))

(assert (=> b!193124 (= res!161370 (and (= (_2!9006 lt!299943) lt!299952) (= (_1!9006 lt!299943) (_2!9003 lt!299949))))))

(declare-fun readerFrom!0 (BitStream!7904 (_ BitVec 32) (_ BitVec 32)) BitStream!7904)

(assert (=> b!193124 (= lt!299943 (readBitPure!0 (readerFrom!0 (_2!9003 lt!299949) (currentBit!9157 thiss!1204) (currentByte!9162 thiss!1204))))))

(declare-fun b!193125 () Bool)

(declare-fun res!161374 () Bool)

(assert (=> b!193125 (=> (not res!161374) (not e!132992))))

(assert (=> b!193125 (= res!161374 (not (= i!590 nBits!348)))))

(declare-fun b!193126 () Bool)

(declare-fun res!161380 () Bool)

(assert (=> b!193126 (=> (not res!161380) (not e!132989))))

(declare-fun lt!299937 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7904 (_ BitVec 64)) BitStream!7904)

(assert (=> b!193126 (= res!161380 (= (_1!9005 lt!299944) (withMovedBitIndex!0 (_2!9005 lt!299944) (bvsub lt!299939 lt!299937))))))

(declare-fun b!193127 () Bool)

(declare-fun res!161373 () Bool)

(assert (=> b!193127 (=> res!161373 e!132990)))

(assert (=> b!193127 (= res!161373 (or (not (= (size!4398 (buf!4878 (_2!9003 lt!299938))) (size!4398 (buf!4878 thiss!1204)))) (not (= lt!299937 (bvsub (bvadd lt!299955 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!193128 () Bool)

(assert (=> b!193128 (= e!132999 e!132990)))

(declare-fun res!161363 () Bool)

(assert (=> b!193128 (=> res!161363 e!132990)))

(assert (=> b!193128 (= res!161363 (not (= lt!299937 (bvsub (bvsub (bvadd lt!299939 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!193128 (= lt!299937 (bitIndex!0 (size!4398 (buf!4878 (_2!9003 lt!299938))) (currentByte!9162 (_2!9003 lt!299938)) (currentBit!9157 (_2!9003 lt!299938))))))

(declare-fun isPrefixOf!0 (BitStream!7904 BitStream!7904) Bool)

(assert (=> b!193128 (isPrefixOf!0 thiss!1204 (_2!9003 lt!299938))))

(declare-fun lt!299946 () Unit!13673)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7904 BitStream!7904 BitStream!7904) Unit!13673)

(assert (=> b!193128 (= lt!299946 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9003 lt!299949) (_2!9003 lt!299938)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7904 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16716)

(assert (=> b!193128 (= lt!299938 (appendBitsLSBFirstLoopTR!0 (_2!9003 lt!299949) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!193129 () Bool)

(assert (=> b!193129 (= e!132996 e!132992)))

(declare-fun res!161381 () Bool)

(assert (=> b!193129 (=> (not res!161381) (not e!132992))))

(assert (=> b!193129 (= res!161381 (validate_offset_bits!1 ((_ sign_extend 32) (size!4398 (buf!4878 thiss!1204))) ((_ sign_extend 32) (currentByte!9162 thiss!1204)) ((_ sign_extend 32) (currentBit!9157 thiss!1204)) lt!299948))))

(assert (=> b!193129 (= lt!299948 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!193130 () Bool)

(declare-fun res!161372 () Bool)

(assert (=> b!193130 (=> (not res!161372) (not e!132989))))

(assert (=> b!193130 (= res!161372 (= (_1!9005 lt!299930) (withMovedBitIndex!0 (_2!9005 lt!299930) (bvsub lt!299955 lt!299937))))))

(declare-fun b!193131 () Bool)

(assert (=> b!193131 (= e!132995 e!132991)))

(declare-fun res!161368 () Bool)

(assert (=> b!193131 (=> res!161368 e!132991)))

(assert (=> b!193131 (= res!161368 (not (= (_1!9005 lt!299944) lt!299934)))))

(assert (=> b!193131 e!132989))

(declare-fun res!161367 () Bool)

(assert (=> b!193131 (=> (not res!161367) (not e!132989))))

(declare-fun lt!299941 () tuple2!16718)

(assert (=> b!193131 (= res!161367 (and (= (_2!9004 lt!299951) (_2!9004 lt!299941)) (= (_1!9004 lt!299951) (_1!9004 lt!299941))))))

(declare-fun lt!299953 () Unit!13673)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13673)

(assert (=> b!193131 (= lt!299953 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9005 lt!299930) nBits!348 i!590 lt!299936))))

(assert (=> b!193131 (= lt!299941 (readNBitsLSBFirstsLoopPure!0 lt!299934 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299929))))

(assert (=> b!193131 (= lt!299934 (withMovedBitIndex!0 (_1!9005 lt!299930) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!193132 () Bool)

(declare-fun res!161369 () Bool)

(assert (=> b!193132 (=> (not res!161369) (not e!132993))))

(assert (=> b!193132 (= res!161369 (isPrefixOf!0 thiss!1204 (_2!9003 lt!299949)))))

(declare-fun b!193133 () Bool)

(declare-fun res!161359 () Bool)

(assert (=> b!193133 (=> (not res!161359) (not e!132992))))

(assert (=> b!193133 (= res!161359 (invariant!0 (currentBit!9157 thiss!1204) (currentByte!9162 thiss!1204) (size!4398 (buf!4878 thiss!1204))))))

(declare-fun b!193134 () Bool)

(assert (=> b!193134 (= e!132998 e!132993)))

(declare-fun res!161361 () Bool)

(assert (=> b!193134 (=> (not res!161361) (not e!132993))))

(declare-fun lt!299950 () (_ BitVec 64))

(assert (=> b!193134 (= res!161361 (= lt!299935 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299950)))))

(assert (=> b!193134 (= lt!299935 (bitIndex!0 (size!4398 (buf!4878 (_2!9003 lt!299949))) (currentByte!9162 (_2!9003 lt!299949)) (currentBit!9157 (_2!9003 lt!299949))))))

(assert (=> b!193134 (= lt!299950 (bitIndex!0 (size!4398 (buf!4878 thiss!1204)) (currentByte!9162 thiss!1204) (currentBit!9157 thiss!1204)))))

(declare-fun b!193135 () Bool)

(declare-fun res!161360 () Bool)

(assert (=> b!193135 (=> res!161360 e!132990)))

(assert (=> b!193135 (= res!161360 (not (isPrefixOf!0 (_2!9003 lt!299949) (_2!9003 lt!299938))))))

(declare-fun b!193136 () Bool)

(declare-fun res!161364 () Bool)

(assert (=> b!193136 (=> res!161364 e!132990)))

(assert (=> b!193136 (= res!161364 (not (isPrefixOf!0 thiss!1204 (_2!9003 lt!299949))))))

(assert (= (and start!41298 res!161379) b!193129))

(assert (= (and b!193129 res!161381) b!193133))

(assert (= (and b!193133 res!161359) b!193125))

(assert (= (and b!193125 res!161374) b!193117))

(assert (= (and b!193117 res!161365) b!193134))

(assert (= (and b!193134 res!161361) b!193132))

(assert (= (and b!193132 res!161369) b!193124))

(assert (= (and b!193124 res!161370) b!193113))

(assert (= (and b!193117 (not res!161362)) b!193128))

(assert (= (and b!193128 (not res!161363)) b!193112))

(assert (= (and b!193112 (not res!161382)) b!193127))

(assert (= (and b!193127 (not res!161373)) b!193135))

(assert (= (and b!193135 (not res!161360)) b!193136))

(assert (= (and b!193136 (not res!161364)) b!193115))

(assert (= (and b!193115 res!161375) b!193123))

(assert (= (and b!193115 res!161366) b!193121))

(assert (= (and b!193115 (not res!161377)) b!193131))

(assert (= (and b!193131 res!161367) b!193130))

(assert (= (and b!193130 res!161372) b!193126))

(assert (= (and b!193126 res!161380) b!193122))

(assert (= (and b!193131 (not res!161368)) b!193116))

(assert (= (and b!193116 (not res!161378)) b!193118))

(assert (= (and b!193118 res!161376) b!193114))

(assert (= (and b!193114 res!161371) b!193120))

(assert (= start!41298 b!193119))

(declare-fun m!299363 () Bool)

(assert (=> b!193112 m!299363))

(declare-fun m!299365 () Bool)

(assert (=> b!193119 m!299365))

(declare-fun m!299367 () Bool)

(assert (=> b!193113 m!299367))

(declare-fun m!299369 () Bool)

(assert (=> b!193134 m!299369))

(declare-fun m!299371 () Bool)

(assert (=> b!193134 m!299371))

(declare-fun m!299373 () Bool)

(assert (=> b!193132 m!299373))

(declare-fun m!299375 () Bool)

(assert (=> b!193128 m!299375))

(declare-fun m!299377 () Bool)

(assert (=> b!193128 m!299377))

(declare-fun m!299379 () Bool)

(assert (=> b!193128 m!299379))

(declare-fun m!299381 () Bool)

(assert (=> b!193128 m!299381))

(declare-fun m!299383 () Bool)

(assert (=> b!193126 m!299383))

(declare-fun m!299385 () Bool)

(assert (=> start!41298 m!299385))

(declare-fun m!299387 () Bool)

(assert (=> b!193116 m!299387))

(declare-fun m!299389 () Bool)

(assert (=> b!193116 m!299389))

(assert (=> b!193136 m!299373))

(assert (=> b!193117 m!299369))

(assert (=> b!193117 m!299371))

(declare-fun m!299391 () Bool)

(assert (=> b!193117 m!299391))

(declare-fun m!299393 () Bool)

(assert (=> b!193114 m!299393))

(declare-fun m!299395 () Bool)

(assert (=> b!193135 m!299395))

(declare-fun m!299397 () Bool)

(assert (=> b!193133 m!299397))

(declare-fun m!299399 () Bool)

(assert (=> b!193115 m!299399))

(declare-fun m!299401 () Bool)

(assert (=> b!193115 m!299401))

(declare-fun m!299403 () Bool)

(assert (=> b!193115 m!299403))

(declare-fun m!299405 () Bool)

(assert (=> b!193115 m!299405))

(declare-fun m!299407 () Bool)

(assert (=> b!193115 m!299407))

(declare-fun m!299409 () Bool)

(assert (=> b!193115 m!299409))

(declare-fun m!299411 () Bool)

(assert (=> b!193115 m!299411))

(declare-fun m!299413 () Bool)

(assert (=> b!193115 m!299413))

(declare-fun m!299415 () Bool)

(assert (=> b!193115 m!299415))

(declare-fun m!299417 () Bool)

(assert (=> b!193115 m!299417))

(declare-fun m!299419 () Bool)

(assert (=> b!193115 m!299419))

(declare-fun m!299421 () Bool)

(assert (=> b!193115 m!299421))

(declare-fun m!299423 () Bool)

(assert (=> b!193115 m!299423))

(declare-fun m!299425 () Bool)

(assert (=> b!193115 m!299425))

(declare-fun m!299427 () Bool)

(assert (=> b!193115 m!299427))

(declare-fun m!299429 () Bool)

(assert (=> b!193115 m!299429))

(declare-fun m!299431 () Bool)

(assert (=> b!193124 m!299431))

(assert (=> b!193124 m!299431))

(declare-fun m!299433 () Bool)

(assert (=> b!193124 m!299433))

(declare-fun m!299435 () Bool)

(assert (=> b!193123 m!299435))

(declare-fun m!299437 () Bool)

(assert (=> b!193131 m!299437))

(declare-fun m!299439 () Bool)

(assert (=> b!193131 m!299439))

(declare-fun m!299441 () Bool)

(assert (=> b!193131 m!299441))

(declare-fun m!299443 () Bool)

(assert (=> b!193130 m!299443))

(declare-fun m!299445 () Bool)

(assert (=> b!193129 m!299445))

(push 1)

(assert (not b!193116))

(assert (not b!193129))

(assert (not b!193136))

(assert (not b!193114))

(assert (not b!193133))

(assert (not b!193112))

(assert (not b!193123))

(assert (not b!193131))

(assert (not b!193135))

(assert (not b!193113))

(assert (not b!193124))

(assert (not b!193132))

(assert (not b!193119))

(assert (not b!193130))

(assert (not b!193117))

(assert (not b!193134))

(assert (not b!193126))

(assert (not start!41298))

(assert (not b!193128))

(assert (not b!193115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

