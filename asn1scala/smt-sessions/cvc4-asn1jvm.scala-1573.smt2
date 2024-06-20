; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44572 () Bool)

(assert start!44572)

(declare-fun b!213100 () Bool)

(declare-fun e!145191 () Bool)

(declare-fun e!145186 () Bool)

(assert (=> b!213100 (= e!145191 e!145186)))

(declare-fun res!179087 () Bool)

(assert (=> b!213100 (=> (not res!179087) (not e!145186))))

(declare-datatypes ((array!10545 0))(
  ( (array!10546 (arr!5562 (Array (_ BitVec 32) (_ BitVec 8))) (size!4632 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8372 0))(
  ( (BitStream!8373 (buf!5161 array!10545) (currentByte!9727 (_ BitVec 32)) (currentBit!9722 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15170 0))(
  ( (Unit!15171) )
))
(declare-datatypes ((tuple2!18258 0))(
  ( (tuple2!18259 (_1!9784 Unit!15170) (_2!9784 BitStream!8372)) )
))
(declare-fun lt!335926 () tuple2!18258)

(declare-fun lt!335920 () Bool)

(declare-datatypes ((tuple2!18260 0))(
  ( (tuple2!18261 (_1!9785 BitStream!8372) (_2!9785 Bool)) )
))
(declare-fun lt!335930 () tuple2!18260)

(assert (=> b!213100 (= res!179087 (and (= (_2!9785 lt!335930) lt!335920) (= (_1!9785 lt!335930) (_2!9784 lt!335926))))))

(declare-fun thiss!1204 () BitStream!8372)

(declare-fun readBitPure!0 (BitStream!8372) tuple2!18260)

(declare-fun readerFrom!0 (BitStream!8372 (_ BitVec 32) (_ BitVec 32)) BitStream!8372)

(assert (=> b!213100 (= lt!335930 (readBitPure!0 (readerFrom!0 (_2!9784 lt!335926) (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204))))))

(declare-fun b!213101 () Bool)

(declare-fun res!179095 () Bool)

(declare-fun e!145196 () Bool)

(assert (=> b!213101 (=> res!179095 e!145196)))

(declare-fun isPrefixOf!0 (BitStream!8372 BitStream!8372) Bool)

(assert (=> b!213101 (= res!179095 (not (isPrefixOf!0 thiss!1204 (_2!9784 lt!335926))))))

(declare-fun lt!335916 () (_ BitVec 64))

(declare-fun e!145198 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!335928 () (_ BitVec 64))

(declare-fun b!213102 () Bool)

(assert (=> b!213102 (= e!145198 (or (not (= lt!335916 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!335916 (bvand lt!335928 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!335922 () (_ BitVec 64))

(assert (=> b!213102 (= lt!335916 (bvand lt!335922 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335931 () tuple2!18258)

(assert (=> b!213102 (= (size!4632 (buf!5161 thiss!1204)) (size!4632 (buf!5161 (_2!9784 lt!335931))))))

(declare-fun b!213103 () Bool)

(declare-fun lt!335929 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213103 (= e!145186 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!335930))) (currentByte!9727 (_1!9785 lt!335930)) (currentBit!9722 (_1!9785 lt!335930))) lt!335929))))

(declare-fun b!213104 () Bool)

(declare-fun res!179085 () Bool)

(assert (=> b!213104 (=> (not res!179085) (not e!145191))))

(assert (=> b!213104 (= res!179085 (isPrefixOf!0 thiss!1204 (_2!9784 lt!335926)))))

(declare-fun res!179101 () Bool)

(declare-fun e!145194 () Bool)

(assert (=> start!44572 (=> (not res!179101) (not e!145194))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!44572 (= res!179101 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44572 e!145194))

(assert (=> start!44572 true))

(declare-fun e!145193 () Bool)

(declare-fun inv!12 (BitStream!8372) Bool)

(assert (=> start!44572 (and (inv!12 thiss!1204) e!145193)))

(declare-fun b!213105 () Bool)

(declare-fun res!179096 () Bool)

(declare-fun e!145188 () Bool)

(assert (=> b!213105 (=> (not res!179096) (not e!145188))))

(declare-datatypes ((tuple2!18262 0))(
  ( (tuple2!18263 (_1!9786 BitStream!8372) (_2!9786 BitStream!8372)) )
))
(declare-fun lt!335935 () tuple2!18262)

(declare-fun lt!335927 () (_ BitVec 64))

(declare-fun lt!335942 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8372 (_ BitVec 64)) BitStream!8372)

(assert (=> b!213105 (= res!179096 (= (_1!9786 lt!335935) (withMovedBitIndex!0 (_2!9786 lt!335935) (bvsub lt!335942 lt!335927))))))

(declare-fun b!213106 () Bool)

(declare-fun res!179080 () Bool)

(declare-fun e!145197 () Bool)

(assert (=> b!213106 (=> res!179080 e!145197)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!213106 (= res!179080 (not (invariant!0 (currentBit!9722 (_2!9784 lt!335931)) (currentByte!9727 (_2!9784 lt!335931)) (size!4632 (buf!5161 (_2!9784 lt!335931))))))))

(declare-fun b!213107 () Bool)

(assert (=> b!213107 (= e!145197 e!145196)))

(declare-fun res!179088 () Bool)

(assert (=> b!213107 (=> res!179088 e!145196)))

(assert (=> b!213107 (= res!179088 (not (= lt!335927 (bvsub lt!335928 ((_ sign_extend 32) i!590)))))))

(assert (=> b!213107 (= lt!335928 (bvadd lt!335922 ((_ sign_extend 32) nBits!348)))))

(declare-datatypes ((tuple2!18264 0))(
  ( (tuple2!18265 (_1!9787 BitStream!8372) (_2!9787 (_ BitVec 64))) )
))
(declare-fun lt!335919 () tuple2!18264)

(declare-fun lt!335940 () BitStream!8372)

(declare-fun lt!335936 () tuple2!18264)

(declare-fun b!213108 () Bool)

(assert (=> b!213108 (= e!145188 (and (= lt!335922 (bvsub lt!335942 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9786 lt!335935) lt!335940)) (= (_2!9787 lt!335936) (_2!9787 lt!335919)))))))

(declare-fun b!213109 () Bool)

(declare-fun e!145195 () Bool)

(assert (=> b!213109 (= e!145195 e!145191)))

(declare-fun res!179097 () Bool)

(assert (=> b!213109 (=> (not res!179097) (not e!145191))))

(declare-fun lt!335939 () (_ BitVec 64))

(assert (=> b!213109 (= res!179097 (= lt!335929 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335939)))))

(assert (=> b!213109 (= lt!335929 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))))))

(assert (=> b!213109 (= lt!335939 (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(declare-fun b!213110 () Bool)

(declare-fun e!145189 () Bool)

(assert (=> b!213110 (= e!145189 (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335931)))))))

(declare-fun b!213111 () Bool)

(declare-fun e!145199 () Bool)

(declare-fun e!145192 () Bool)

(assert (=> b!213111 (= e!145199 (not e!145192))))

(declare-fun res!179081 () Bool)

(assert (=> b!213111 (=> res!179081 e!145192)))

(assert (=> b!213111 (= res!179081 (not (= lt!335942 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335922))))))

(assert (=> b!213111 (= lt!335942 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))))))

(assert (=> b!213111 (= lt!335922 (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(assert (=> b!213111 e!145195))

(declare-fun res!179091 () Bool)

(assert (=> b!213111 (=> (not res!179091) (not e!145195))))

(assert (=> b!213111 (= res!179091 (= (size!4632 (buf!5161 thiss!1204)) (size!4632 (buf!5161 (_2!9784 lt!335926)))))))

(declare-fun appendBit!0 (BitStream!8372 Bool) tuple2!18258)

(assert (=> b!213111 (= lt!335926 (appendBit!0 thiss!1204 lt!335920))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!335941 () (_ BitVec 64))

(assert (=> b!213111 (= lt!335920 (not (= (bvand v!189 lt!335941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213111 (= lt!335941 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!213112 () Bool)

(declare-fun e!145187 () Bool)

(declare-fun lt!335938 () tuple2!18260)

(declare-fun lt!335933 () tuple2!18260)

(assert (=> b!213112 (= e!145187 (= (_2!9785 lt!335938) (_2!9785 lt!335933)))))

(declare-fun b!213113 () Bool)

(declare-fun res!179089 () Bool)

(assert (=> b!213113 (=> (not res!179089) (not e!145199))))

(assert (=> b!213113 (= res!179089 (not (= i!590 nBits!348)))))

(declare-fun b!213114 () Bool)

(assert (=> b!213114 (= e!145192 e!145197)))

(declare-fun res!179094 () Bool)

(assert (=> b!213114 (=> res!179094 e!145197)))

(assert (=> b!213114 (= res!179094 (not (= lt!335927 (bvsub (bvsub (bvadd lt!335942 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!213114 (= lt!335927 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335931))) (currentByte!9727 (_2!9784 lt!335931)) (currentBit!9722 (_2!9784 lt!335931))))))

(assert (=> b!213114 (isPrefixOf!0 thiss!1204 (_2!9784 lt!335931))))

(declare-fun lt!335918 () Unit!15170)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8372 BitStream!8372 BitStream!8372) Unit!15170)

(assert (=> b!213114 (= lt!335918 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9784 lt!335926) (_2!9784 lt!335931)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18258)

(assert (=> b!213114 (= lt!335931 (appendBitsLSBFirstLoopTR!0 (_2!9784 lt!335926) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!213115 () Bool)

(declare-fun res!179084 () Bool)

(assert (=> b!213115 (=> res!179084 e!145196)))

(assert (=> b!213115 (= res!179084 (not (isPrefixOf!0 (_2!9784 lt!335926) (_2!9784 lt!335931))))))

(declare-fun b!213116 () Bool)

(declare-fun res!179100 () Bool)

(assert (=> b!213116 (=> res!179100 e!145198)))

(declare-fun lt!335932 () tuple2!18262)

(assert (=> b!213116 (= res!179100 (not (= (bitIndex!0 (size!4632 (buf!5161 (_1!9787 lt!335936))) (currentByte!9727 (_1!9787 lt!335936)) (currentBit!9722 (_1!9787 lt!335936))) (bitIndex!0 (size!4632 (buf!5161 (_2!9786 lt!335932))) (currentByte!9727 (_2!9786 lt!335932)) (currentBit!9722 (_2!9786 lt!335932))))))))

(declare-fun b!213117 () Bool)

(declare-fun e!145200 () Bool)

(assert (=> b!213117 (= e!145196 e!145200)))

(declare-fun res!179098 () Bool)

(assert (=> b!213117 (=> res!179098 e!145200)))

(assert (=> b!213117 (= res!179098 (not (= (_1!9787 lt!335919) (_2!9786 lt!335935))))))

(declare-fun lt!335925 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18264)

(assert (=> b!213117 (= lt!335919 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!335935) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335925))))

(declare-fun lt!335923 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213117 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926))) lt!335923)))

(declare-fun lt!335944 () Unit!15170)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8372 array!10545 (_ BitVec 64)) Unit!15170)

(assert (=> b!213117 (= lt!335944 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9784 lt!335926) (buf!5161 (_2!9784 lt!335931)) lt!335923))))

(assert (=> b!213117 (= lt!335923 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!335945 () tuple2!18260)

(declare-fun lt!335917 () (_ BitVec 64))

(assert (=> b!213117 (= lt!335925 (bvor lt!335917 (ite (_2!9785 lt!335945) lt!335941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213117 (= lt!335936 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!335932) nBits!348 i!590 lt!335917))))

(declare-fun lt!335934 () (_ BitVec 64))

(assert (=> b!213117 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204)) lt!335934)))

(declare-fun lt!335943 () Unit!15170)

(assert (=> b!213117 (= lt!335943 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5161 (_2!9784 lt!335931)) lt!335934))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213117 (= lt!335917 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!213117 (= (_2!9785 lt!335945) lt!335920)))

(assert (=> b!213117 (= lt!335945 (readBitPure!0 (_1!9786 lt!335932)))))

(declare-fun reader!0 (BitStream!8372 BitStream!8372) tuple2!18262)

(assert (=> b!213117 (= lt!335935 (reader!0 (_2!9784 lt!335926) (_2!9784 lt!335931)))))

(assert (=> b!213117 (= lt!335932 (reader!0 thiss!1204 (_2!9784 lt!335931)))))

(assert (=> b!213117 e!145187))

(declare-fun res!179090 () Bool)

(assert (=> b!213117 (=> (not res!179090) (not e!145187))))

(assert (=> b!213117 (= res!179090 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!335938))) (currentByte!9727 (_1!9785 lt!335938)) (currentBit!9722 (_1!9785 lt!335938))) (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!335933))) (currentByte!9727 (_1!9785 lt!335933)) (currentBit!9722 (_1!9785 lt!335933)))))))

(declare-fun lt!335915 () Unit!15170)

(declare-fun lt!335924 () BitStream!8372)

(declare-fun readBitPrefixLemma!0 (BitStream!8372 BitStream!8372) Unit!15170)

(assert (=> b!213117 (= lt!335915 (readBitPrefixLemma!0 lt!335924 (_2!9784 lt!335931)))))

(assert (=> b!213117 (= lt!335933 (readBitPure!0 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204))))))

(assert (=> b!213117 (= lt!335938 (readBitPure!0 lt!335924))))

(assert (=> b!213117 e!145189))

(declare-fun res!179099 () Bool)

(assert (=> b!213117 (=> (not res!179099) (not e!145189))))

(assert (=> b!213117 (= res!179099 (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335926)))))))

(assert (=> b!213117 (= lt!335924 (BitStream!8373 (buf!5161 (_2!9784 lt!335926)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(declare-fun b!213118 () Bool)

(declare-fun res!179102 () Bool)

(assert (=> b!213118 (=> res!179102 e!145197)))

(assert (=> b!213118 (= res!179102 (not (= (size!4632 (buf!5161 (_2!9784 lt!335931))) (size!4632 (buf!5161 thiss!1204)))))))

(declare-fun b!213119 () Bool)

(declare-fun res!179086 () Bool)

(assert (=> b!213119 (=> (not res!179086) (not e!145199))))

(assert (=> b!213119 (= res!179086 (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 thiss!1204))))))

(declare-fun b!213120 () Bool)

(declare-fun array_inv!4373 (array!10545) Bool)

(assert (=> b!213120 (= e!145193 (array_inv!4373 (buf!5161 thiss!1204)))))

(declare-fun b!213121 () Bool)

(assert (=> b!213121 (= e!145194 e!145199)))

(declare-fun res!179082 () Bool)

(assert (=> b!213121 (=> (not res!179082) (not e!145199))))

(assert (=> b!213121 (= res!179082 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 thiss!1204))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204)) lt!335934))))

(assert (=> b!213121 (= lt!335934 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!213122 () Bool)

(assert (=> b!213122 (= e!145200 e!145198)))

(declare-fun res!179083 () Bool)

(assert (=> b!213122 (=> res!179083 e!145198)))

(assert (=> b!213122 (= res!179083 (not (= (_1!9786 lt!335935) lt!335940)))))

(assert (=> b!213122 e!145188))

(declare-fun res!179092 () Bool)

(assert (=> b!213122 (=> (not res!179092) (not e!145188))))

(declare-fun lt!335921 () tuple2!18264)

(assert (=> b!213122 (= res!179092 (and (= (_2!9787 lt!335936) (_2!9787 lt!335921)) (= (_1!9787 lt!335936) (_1!9787 lt!335921))))))

(declare-fun lt!335937 () Unit!15170)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15170)

(assert (=> b!213122 (= lt!335937 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9786 lt!335932) nBits!348 i!590 lt!335917))))

(assert (=> b!213122 (= lt!335921 (readNBitsLSBFirstsLoopPure!0 lt!335940 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335925))))

(assert (=> b!213122 (= lt!335940 (withMovedBitIndex!0 (_1!9786 lt!335932) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!213123 () Bool)

(declare-fun res!179093 () Bool)

(assert (=> b!213123 (=> (not res!179093) (not e!145188))))

(assert (=> b!213123 (= res!179093 (= (_1!9786 lt!335932) (withMovedBitIndex!0 (_2!9786 lt!335932) (bvsub lt!335922 lt!335927))))))

(assert (= (and start!44572 res!179101) b!213121))

(assert (= (and b!213121 res!179082) b!213119))

(assert (= (and b!213119 res!179086) b!213113))

(assert (= (and b!213113 res!179089) b!213111))

(assert (= (and b!213111 res!179091) b!213109))

(assert (= (and b!213109 res!179097) b!213104))

(assert (= (and b!213104 res!179085) b!213100))

(assert (= (and b!213100 res!179087) b!213103))

(assert (= (and b!213111 (not res!179081)) b!213114))

(assert (= (and b!213114 (not res!179094)) b!213106))

(assert (= (and b!213106 (not res!179080)) b!213118))

(assert (= (and b!213118 (not res!179102)) b!213107))

(assert (= (and b!213107 (not res!179088)) b!213115))

(assert (= (and b!213115 (not res!179084)) b!213101))

(assert (= (and b!213101 (not res!179095)) b!213117))

(assert (= (and b!213117 res!179099) b!213110))

(assert (= (and b!213117 res!179090) b!213112))

(assert (= (and b!213117 (not res!179098)) b!213122))

(assert (= (and b!213122 res!179092) b!213123))

(assert (= (and b!213123 res!179093) b!213105))

(assert (= (and b!213105 res!179096) b!213108))

(assert (= (and b!213122 (not res!179083)) b!213116))

(assert (= (and b!213116 (not res!179100)) b!213102))

(assert (= start!44572 b!213120))

(declare-fun m!328283 () Bool)

(assert (=> b!213114 m!328283))

(declare-fun m!328285 () Bool)

(assert (=> b!213114 m!328285))

(declare-fun m!328287 () Bool)

(assert (=> b!213114 m!328287))

(declare-fun m!328289 () Bool)

(assert (=> b!213114 m!328289))

(declare-fun m!328291 () Bool)

(assert (=> b!213110 m!328291))

(declare-fun m!328293 () Bool)

(assert (=> b!213111 m!328293))

(declare-fun m!328295 () Bool)

(assert (=> b!213111 m!328295))

(declare-fun m!328297 () Bool)

(assert (=> b!213111 m!328297))

(declare-fun m!328299 () Bool)

(assert (=> b!213119 m!328299))

(declare-fun m!328301 () Bool)

(assert (=> b!213116 m!328301))

(declare-fun m!328303 () Bool)

(assert (=> b!213116 m!328303))

(declare-fun m!328305 () Bool)

(assert (=> b!213101 m!328305))

(assert (=> b!213109 m!328293))

(assert (=> b!213109 m!328295))

(declare-fun m!328307 () Bool)

(assert (=> b!213106 m!328307))

(assert (=> b!213104 m!328305))

(declare-fun m!328309 () Bool)

(assert (=> b!213120 m!328309))

(declare-fun m!328311 () Bool)

(assert (=> b!213103 m!328311))

(declare-fun m!328313 () Bool)

(assert (=> b!213123 m!328313))

(declare-fun m!328315 () Bool)

(assert (=> b!213105 m!328315))

(declare-fun m!328317 () Bool)

(assert (=> b!213121 m!328317))

(declare-fun m!328319 () Bool)

(assert (=> b!213100 m!328319))

(assert (=> b!213100 m!328319))

(declare-fun m!328321 () Bool)

(assert (=> b!213100 m!328321))

(declare-fun m!328323 () Bool)

(assert (=> start!44572 m!328323))

(declare-fun m!328325 () Bool)

(assert (=> b!213115 m!328325))

(declare-fun m!328327 () Bool)

(assert (=> b!213117 m!328327))

(declare-fun m!328329 () Bool)

(assert (=> b!213117 m!328329))

(declare-fun m!328331 () Bool)

(assert (=> b!213117 m!328331))

(declare-fun m!328333 () Bool)

(assert (=> b!213117 m!328333))

(declare-fun m!328335 () Bool)

(assert (=> b!213117 m!328335))

(declare-fun m!328337 () Bool)

(assert (=> b!213117 m!328337))

(declare-fun m!328339 () Bool)

(assert (=> b!213117 m!328339))

(declare-fun m!328341 () Bool)

(assert (=> b!213117 m!328341))

(declare-fun m!328343 () Bool)

(assert (=> b!213117 m!328343))

(declare-fun m!328345 () Bool)

(assert (=> b!213117 m!328345))

(declare-fun m!328347 () Bool)

(assert (=> b!213117 m!328347))

(declare-fun m!328349 () Bool)

(assert (=> b!213117 m!328349))

(declare-fun m!328351 () Bool)

(assert (=> b!213117 m!328351))

(declare-fun m!328353 () Bool)

(assert (=> b!213117 m!328353))

(declare-fun m!328355 () Bool)

(assert (=> b!213117 m!328355))

(declare-fun m!328357 () Bool)

(assert (=> b!213117 m!328357))

(declare-fun m!328359 () Bool)

(assert (=> b!213122 m!328359))

(declare-fun m!328361 () Bool)

(assert (=> b!213122 m!328361))

(declare-fun m!328363 () Bool)

(assert (=> b!213122 m!328363))

(push 1)

(assert (not b!213116))

(assert (not b!213123))

(assert (not b!213120))

(assert (not b!213100))

(assert (not b!213121))

(assert (not b!213111))

(assert (not b!213105))

(assert (not b!213114))

(assert (not b!213101))

(assert (not b!213109))

(assert (not b!213106))

(assert (not b!213119))

(assert (not b!213104))

(assert (not start!44572))

(assert (not b!213110))

(assert (not b!213115))

(assert (not b!213117))

(assert (not b!213122))

(assert (not b!213103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72057 () Bool)

(declare-fun res!179186 () Bool)

(declare-fun e!145255 () Bool)

(assert (=> d!72057 (=> (not res!179186) (not e!145255))))

(assert (=> d!72057 (= res!179186 (= (size!4632 (buf!5161 thiss!1204)) (size!4632 (buf!5161 (_2!9784 lt!335926)))))))

(assert (=> d!72057 (= (isPrefixOf!0 thiss!1204 (_2!9784 lt!335926)) e!145255)))

(declare-fun b!213214 () Bool)

(declare-fun res!179187 () Bool)

(assert (=> b!213214 (=> (not res!179187) (not e!145255))))

(assert (=> b!213214 (= res!179187 (bvsle (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)) (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926)))))))

(declare-fun b!213215 () Bool)

(declare-fun e!145256 () Bool)

(assert (=> b!213215 (= e!145255 e!145256)))

(declare-fun res!179185 () Bool)

(assert (=> b!213215 (=> res!179185 e!145256)))

(assert (=> b!213215 (= res!179185 (= (size!4632 (buf!5161 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213216 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10545 array!10545 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213216 (= e!145256 (arrayBitRangesEq!0 (buf!5161 thiss!1204) (buf!5161 (_2!9784 lt!335926)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204))))))

(assert (= (and d!72057 res!179186) b!213214))

(assert (= (and b!213214 res!179187) b!213215))

(assert (= (and b!213215 (not res!179185)) b!213216))

(assert (=> b!213214 m!328295))

(assert (=> b!213214 m!328293))

(assert (=> b!213216 m!328295))

(assert (=> b!213216 m!328295))

(declare-fun m!328551 () Bool)

(assert (=> b!213216 m!328551))

(assert (=> b!213101 d!72057))

(declare-fun d!72059 () Bool)

(declare-fun e!145259 () Bool)

(assert (=> d!72059 e!145259))

(declare-fun res!179190 () Bool)

(assert (=> d!72059 (=> (not res!179190) (not e!145259))))

(declare-fun lt!336209 () (_ BitVec 64))

(declare-fun lt!336208 () BitStream!8372)

(assert (=> d!72059 (= res!179190 (= (bvadd lt!336209 (bvsub lt!335922 lt!335927)) (bitIndex!0 (size!4632 (buf!5161 lt!336208)) (currentByte!9727 lt!336208) (currentBit!9722 lt!336208))))))

(assert (=> d!72059 (or (not (= (bvand lt!336209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335922 lt!335927) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336209 (bvsub lt!335922 lt!335927)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72059 (= lt!336209 (bitIndex!0 (size!4632 (buf!5161 (_2!9786 lt!335932))) (currentByte!9727 (_2!9786 lt!335932)) (currentBit!9722 (_2!9786 lt!335932))))))

(declare-fun moveBitIndex!0 (BitStream!8372 (_ BitVec 64)) tuple2!18258)

(assert (=> d!72059 (= lt!336208 (_2!9784 (moveBitIndex!0 (_2!9786 lt!335932) (bvsub lt!335922 lt!335927))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8372 (_ BitVec 64)) Bool)

(assert (=> d!72059 (moveBitIndexPrecond!0 (_2!9786 lt!335932) (bvsub lt!335922 lt!335927))))

(assert (=> d!72059 (= (withMovedBitIndex!0 (_2!9786 lt!335932) (bvsub lt!335922 lt!335927)) lt!336208)))

(declare-fun b!213219 () Bool)

(assert (=> b!213219 (= e!145259 (= (size!4632 (buf!5161 (_2!9786 lt!335932))) (size!4632 (buf!5161 lt!336208))))))

(assert (= (and d!72059 res!179190) b!213219))

(declare-fun m!328553 () Bool)

(assert (=> d!72059 m!328553))

(assert (=> d!72059 m!328303))

(declare-fun m!328555 () Bool)

(assert (=> d!72059 m!328555))

(declare-fun m!328557 () Bool)

(assert (=> d!72059 m!328557))

(assert (=> b!213123 d!72059))

(declare-fun d!72061 () Bool)

(declare-fun e!145271 () Bool)

(assert (=> d!72061 e!145271))

(declare-fun res!179212 () Bool)

(assert (=> d!72061 (=> (not res!179212) (not e!145271))))

(declare-fun lt!336244 () (_ BitVec 64))

(declare-fun lt!336246 () (_ BitVec 64))

(declare-fun lt!336243 () (_ BitVec 64))

(assert (=> d!72061 (= res!179212 (= lt!336243 (bvsub lt!336244 lt!336246)))))

(assert (=> d!72061 (or (= (bvand lt!336244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336246 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336244 lt!336246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72061 (= lt!336246 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335930)))) ((_ sign_extend 32) (currentByte!9727 (_1!9785 lt!335930))) ((_ sign_extend 32) (currentBit!9722 (_1!9785 lt!335930)))))))

(declare-fun lt!336245 () (_ BitVec 64))

(declare-fun lt!336248 () (_ BitVec 64))

(assert (=> d!72061 (= lt!336244 (bvmul lt!336245 lt!336248))))

(assert (=> d!72061 (or (= lt!336245 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336248 (bvsdiv (bvmul lt!336245 lt!336248) lt!336245)))))

(assert (=> d!72061 (= lt!336248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72061 (= lt!336245 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335930)))))))

(assert (=> d!72061 (= lt!336243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 (_1!9785 lt!335930))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 (_1!9785 lt!335930)))))))

(assert (=> d!72061 (invariant!0 (currentBit!9722 (_1!9785 lt!335930)) (currentByte!9727 (_1!9785 lt!335930)) (size!4632 (buf!5161 (_1!9785 lt!335930))))))

(assert (=> d!72061 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!335930))) (currentByte!9727 (_1!9785 lt!335930)) (currentBit!9722 (_1!9785 lt!335930))) lt!336243)))

(declare-fun b!213242 () Bool)

(declare-fun res!179213 () Bool)

(assert (=> b!213242 (=> (not res!179213) (not e!145271))))

(assert (=> b!213242 (= res!179213 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336243))))

(declare-fun b!213243 () Bool)

(declare-fun lt!336247 () (_ BitVec 64))

(assert (=> b!213243 (= e!145271 (bvsle lt!336243 (bvmul lt!336247 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213243 (or (= lt!336247 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336247 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336247)))))

(assert (=> b!213243 (= lt!336247 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335930)))))))

(assert (= (and d!72061 res!179212) b!213242))

(assert (= (and b!213242 res!179213) b!213243))

(declare-fun m!328579 () Bool)

(assert (=> d!72061 m!328579))

(declare-fun m!328581 () Bool)

(assert (=> d!72061 m!328581))

(assert (=> b!213103 d!72061))

(declare-fun d!72071 () Bool)

(declare-fun e!145272 () Bool)

(assert (=> d!72071 e!145272))

(declare-fun res!179214 () Bool)

(assert (=> d!72071 (=> (not res!179214) (not e!145272))))

(declare-fun lt!336249 () (_ BitVec 64))

(declare-fun lt!336252 () (_ BitVec 64))

(declare-fun lt!336250 () (_ BitVec 64))

(assert (=> d!72071 (= res!179214 (= lt!336249 (bvsub lt!336250 lt!336252)))))

(assert (=> d!72071 (or (= (bvand lt!336250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336250 lt!336252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72071 (= lt!336252 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335931))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335931)))))))

(declare-fun lt!336251 () (_ BitVec 64))

(declare-fun lt!336254 () (_ BitVec 64))

(assert (=> d!72071 (= lt!336250 (bvmul lt!336251 lt!336254))))

(assert (=> d!72071 (or (= lt!336251 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336254 (bvsdiv (bvmul lt!336251 lt!336254) lt!336251)))))

(assert (=> d!72071 (= lt!336254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72071 (= lt!336251 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))))))

(assert (=> d!72071 (= lt!336249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335931))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335931)))))))

(assert (=> d!72071 (invariant!0 (currentBit!9722 (_2!9784 lt!335931)) (currentByte!9727 (_2!9784 lt!335931)) (size!4632 (buf!5161 (_2!9784 lt!335931))))))

(assert (=> d!72071 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335931))) (currentByte!9727 (_2!9784 lt!335931)) (currentBit!9722 (_2!9784 lt!335931))) lt!336249)))

(declare-fun b!213244 () Bool)

(declare-fun res!179215 () Bool)

(assert (=> b!213244 (=> (not res!179215) (not e!145272))))

(assert (=> b!213244 (= res!179215 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336249))))

(declare-fun b!213245 () Bool)

(declare-fun lt!336253 () (_ BitVec 64))

(assert (=> b!213245 (= e!145272 (bvsle lt!336249 (bvmul lt!336253 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213245 (or (= lt!336253 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336253 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336253)))))

(assert (=> b!213245 (= lt!336253 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))))))

(assert (= (and d!72071 res!179214) b!213244))

(assert (= (and b!213244 res!179215) b!213245))

(declare-fun m!328583 () Bool)

(assert (=> d!72071 m!328583))

(assert (=> d!72071 m!328307))

(assert (=> b!213114 d!72071))

(declare-fun d!72073 () Bool)

(declare-fun res!179217 () Bool)

(declare-fun e!145273 () Bool)

(assert (=> d!72073 (=> (not res!179217) (not e!145273))))

(assert (=> d!72073 (= res!179217 (= (size!4632 (buf!5161 thiss!1204)) (size!4632 (buf!5161 (_2!9784 lt!335931)))))))

(assert (=> d!72073 (= (isPrefixOf!0 thiss!1204 (_2!9784 lt!335931)) e!145273)))

(declare-fun b!213246 () Bool)

(declare-fun res!179218 () Bool)

(assert (=> b!213246 (=> (not res!179218) (not e!145273))))

(assert (=> b!213246 (= res!179218 (bvsle (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)) (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335931))) (currentByte!9727 (_2!9784 lt!335931)) (currentBit!9722 (_2!9784 lt!335931)))))))

(declare-fun b!213247 () Bool)

(declare-fun e!145274 () Bool)

(assert (=> b!213247 (= e!145273 e!145274)))

(declare-fun res!179216 () Bool)

(assert (=> b!213247 (=> res!179216 e!145274)))

(assert (=> b!213247 (= res!179216 (= (size!4632 (buf!5161 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213248 () Bool)

(assert (=> b!213248 (= e!145274 (arrayBitRangesEq!0 (buf!5161 thiss!1204) (buf!5161 (_2!9784 lt!335931)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204))))))

(assert (= (and d!72073 res!179217) b!213246))

(assert (= (and b!213246 res!179218) b!213247))

(assert (= (and b!213247 (not res!179216)) b!213248))

(assert (=> b!213246 m!328295))

(assert (=> b!213246 m!328283))

(assert (=> b!213248 m!328295))

(assert (=> b!213248 m!328295))

(declare-fun m!328585 () Bool)

(assert (=> b!213248 m!328585))

(assert (=> b!213114 d!72073))

(declare-fun d!72075 () Bool)

(assert (=> d!72075 (isPrefixOf!0 thiss!1204 (_2!9784 lt!335931))))

(declare-fun lt!336257 () Unit!15170)

(declare-fun choose!30 (BitStream!8372 BitStream!8372 BitStream!8372) Unit!15170)

(assert (=> d!72075 (= lt!336257 (choose!30 thiss!1204 (_2!9784 lt!335926) (_2!9784 lt!335931)))))

(assert (=> d!72075 (isPrefixOf!0 thiss!1204 (_2!9784 lt!335926))))

(assert (=> d!72075 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9784 lt!335926) (_2!9784 lt!335931)) lt!336257)))

(declare-fun bs!17682 () Bool)

(assert (= bs!17682 d!72075))

(assert (=> bs!17682 m!328285))

(declare-fun m!328587 () Bool)

(assert (=> bs!17682 m!328587))

(assert (=> bs!17682 m!328305))

(assert (=> b!213114 d!72075))

(declare-fun b!213377 () Bool)

(declare-fun res!179321 () Bool)

(declare-fun lt!336736 () tuple2!18258)

(assert (=> b!213377 (= res!179321 (isPrefixOf!0 (_2!9784 lt!335926) (_2!9784 lt!336736)))))

(declare-fun e!145351 () Bool)

(assert (=> b!213377 (=> (not res!179321) (not e!145351))))

(declare-fun b!213378 () Bool)

(declare-fun e!145350 () Bool)

(declare-fun e!145355 () Bool)

(assert (=> b!213378 (= e!145350 e!145355)))

(declare-fun res!179320 () Bool)

(assert (=> b!213378 (=> (not res!179320) (not e!145355))))

(declare-fun lt!336751 () tuple2!18264)

(assert (=> b!213378 (= res!179320 (= (_2!9787 lt!336751) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!336739 () tuple2!18262)

(assert (=> b!213378 (= lt!336751 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!336739) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!336752 () Unit!15170)

(declare-fun lt!336746 () Unit!15170)

(assert (=> b!213378 (= lt!336752 lt!336746)))

(declare-fun lt!336714 () tuple2!18258)

(declare-fun lt!336758 () (_ BitVec 64))

(assert (=> b!213378 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!336714)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926))) lt!336758)))

(assert (=> b!213378 (= lt!336746 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9784 lt!335926) (buf!5161 (_2!9784 lt!336714)) lt!336758))))

(declare-fun e!145352 () Bool)

(assert (=> b!213378 e!145352))

(declare-fun res!179324 () Bool)

(assert (=> b!213378 (=> (not res!179324) (not e!145352))))

(assert (=> b!213378 (= res!179324 (and (= (size!4632 (buf!5161 (_2!9784 lt!335926))) (size!4632 (buf!5161 (_2!9784 lt!336714)))) (bvsge lt!336758 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213378 (= lt!336758 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!213378 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!213378 (= lt!336739 (reader!0 (_2!9784 lt!335926) (_2!9784 lt!336714)))))

(declare-fun b!213379 () Bool)

(assert (=> b!213379 (= e!145355 (= (_1!9787 lt!336751) (_2!9786 lt!336739)))))

(declare-fun d!72077 () Bool)

(assert (=> d!72077 e!145350))

(declare-fun res!179327 () Bool)

(assert (=> d!72077 (=> (not res!179327) (not e!145350))))

(assert (=> d!72077 (= res!179327 (invariant!0 (currentBit!9722 (_2!9784 lt!336714)) (currentByte!9727 (_2!9784 lt!336714)) (size!4632 (buf!5161 (_2!9784 lt!336714)))))))

(declare-fun e!145349 () tuple2!18258)

(assert (=> d!72077 (= lt!336714 e!145349)))

(declare-fun c!10470 () Bool)

(assert (=> d!72077 (= c!10470 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72077 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72077 (= (appendBitsLSBFirstLoopTR!0 (_2!9784 lt!335926) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!336714)))

(declare-fun b!213380 () Bool)

(declare-fun Unit!15185 () Unit!15170)

(assert (=> b!213380 (= e!145349 (tuple2!18259 Unit!15185 (_2!9784 lt!335926)))))

(declare-fun lt!336759 () Unit!15170)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8372) Unit!15170)

(assert (=> b!213380 (= lt!336759 (lemmaIsPrefixRefl!0 (_2!9784 lt!335926)))))

(declare-fun call!3351 () Bool)

(assert (=> b!213380 call!3351))

(declare-fun lt!336749 () Unit!15170)

(assert (=> b!213380 (= lt!336749 lt!336759)))

(declare-fun b!213381 () Bool)

(declare-fun e!145353 () (_ BitVec 64))

(assert (=> b!213381 (= e!145353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!213382 () Bool)

(declare-fun res!179325 () Bool)

(assert (=> b!213382 (= res!179325 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336736))) (currentByte!9727 (_2!9784 lt!336736)) (currentBit!9722 (_2!9784 lt!336736))) (bvadd (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!213382 (=> (not res!179325) (not e!145351))))

(declare-fun b!213383 () Bool)

(declare-fun e!145347 () Bool)

(declare-fun lt!336745 () tuple2!18260)

(declare-fun lt!336729 () tuple2!18260)

(assert (=> b!213383 (= e!145347 (= (_2!9785 lt!336745) (_2!9785 lt!336729)))))

(declare-fun b!213384 () Bool)

(declare-fun lt!336726 () tuple2!18258)

(assert (=> b!213384 (= e!145349 (tuple2!18259 (_1!9784 lt!336726) (_2!9784 lt!336726)))))

(declare-fun lt!336748 () Bool)

(assert (=> b!213384 (= lt!336748 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213384 (= lt!336736 (appendBit!0 (_2!9784 lt!335926) lt!336748))))

(declare-fun res!179319 () Bool)

(assert (=> b!213384 (= res!179319 (= (size!4632 (buf!5161 (_2!9784 lt!335926))) (size!4632 (buf!5161 (_2!9784 lt!336736)))))))

(assert (=> b!213384 (=> (not res!179319) (not e!145351))))

(assert (=> b!213384 e!145351))

(declare-fun lt!336725 () tuple2!18258)

(assert (=> b!213384 (= lt!336725 lt!336736)))

(assert (=> b!213384 (= lt!336726 (appendBitsLSBFirstLoopTR!0 (_2!9784 lt!336725) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!336757 () Unit!15170)

(assert (=> b!213384 (= lt!336757 (lemmaIsPrefixTransitive!0 (_2!9784 lt!335926) (_2!9784 lt!336725) (_2!9784 lt!336726)))))

(assert (=> b!213384 call!3351))

(declare-fun lt!336713 () Unit!15170)

(assert (=> b!213384 (= lt!336713 lt!336757)))

(assert (=> b!213384 (invariant!0 (currentBit!9722 (_2!9784 lt!335926)) (currentByte!9727 (_2!9784 lt!335926)) (size!4632 (buf!5161 (_2!9784 lt!336725))))))

(declare-fun lt!336728 () BitStream!8372)

(assert (=> b!213384 (= lt!336728 (BitStream!8373 (buf!5161 (_2!9784 lt!336725)) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))))))

(assert (=> b!213384 (invariant!0 (currentBit!9722 lt!336728) (currentByte!9727 lt!336728) (size!4632 (buf!5161 (_2!9784 lt!336726))))))

(declare-fun lt!336764 () BitStream!8372)

(assert (=> b!213384 (= lt!336764 (BitStream!8373 (buf!5161 (_2!9784 lt!336726)) (currentByte!9727 lt!336728) (currentBit!9722 lt!336728)))))

(assert (=> b!213384 (= lt!336745 (readBitPure!0 lt!336728))))

(assert (=> b!213384 (= lt!336729 (readBitPure!0 lt!336764))))

(declare-fun lt!336717 () Unit!15170)

(assert (=> b!213384 (= lt!336717 (readBitPrefixLemma!0 lt!336728 (_2!9784 lt!336726)))))

(declare-fun res!179323 () Bool)

(assert (=> b!213384 (= res!179323 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!336745))) (currentByte!9727 (_1!9785 lt!336745)) (currentBit!9722 (_1!9785 lt!336745))) (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!336729))) (currentByte!9727 (_1!9785 lt!336729)) (currentBit!9722 (_1!9785 lt!336729)))))))

(assert (=> b!213384 (=> (not res!179323) (not e!145347))))

(assert (=> b!213384 e!145347))

(declare-fun lt!336762 () Unit!15170)

(assert (=> b!213384 (= lt!336762 lt!336717)))

(declare-fun lt!336719 () tuple2!18262)

(assert (=> b!213384 (= lt!336719 (reader!0 (_2!9784 lt!335926) (_2!9784 lt!336726)))))

(declare-fun lt!336755 () tuple2!18262)

(assert (=> b!213384 (= lt!336755 (reader!0 (_2!9784 lt!336725) (_2!9784 lt!336726)))))

(declare-fun lt!336724 () tuple2!18260)

(assert (=> b!213384 (= lt!336724 (readBitPure!0 (_1!9786 lt!336719)))))

(assert (=> b!213384 (= (_2!9785 lt!336724) lt!336748)))

(declare-fun lt!336712 () Unit!15170)

(declare-fun Unit!15187 () Unit!15170)

(assert (=> b!213384 (= lt!336712 Unit!15187)))

(declare-fun lt!336744 () (_ BitVec 64))

(assert (=> b!213384 (= lt!336744 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336743 () (_ BitVec 64))

(assert (=> b!213384 (= lt!336743 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336722 () Unit!15170)

(assert (=> b!213384 (= lt!336722 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9784 lt!335926) (buf!5161 (_2!9784 lt!336726)) lt!336743))))

(assert (=> b!213384 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!336726)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926))) lt!336743)))

(declare-fun lt!336710 () Unit!15170)

(assert (=> b!213384 (= lt!336710 lt!336722)))

(declare-fun lt!336741 () tuple2!18264)

(assert (=> b!213384 (= lt!336741 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!336719) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336744))))

(declare-fun lt!336737 () (_ BitVec 64))

(assert (=> b!213384 (= lt!336737 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!336718 () Unit!15170)

(assert (=> b!213384 (= lt!336718 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9784 lt!336725) (buf!5161 (_2!9784 lt!336726)) lt!336737))))

(assert (=> b!213384 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!336726)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!336725))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!336725))) lt!336737)))

(declare-fun lt!336750 () Unit!15170)

(assert (=> b!213384 (= lt!336750 lt!336718)))

(declare-fun lt!336733 () tuple2!18264)

(assert (=> b!213384 (= lt!336733 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!336755) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!336744 (ite (_2!9785 lt!336724) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!336747 () tuple2!18264)

(assert (=> b!213384 (= lt!336747 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!336719) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336744))))

(declare-fun c!10469 () Bool)

(assert (=> b!213384 (= c!10469 (_2!9785 (readBitPure!0 (_1!9786 lt!336719))))))

(declare-fun lt!336721 () tuple2!18264)

(assert (=> b!213384 (= lt!336721 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9786 lt!336719) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!336744 e!145353)))))

(declare-fun lt!336715 () Unit!15170)

(assert (=> b!213384 (= lt!336715 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9786 lt!336719) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336744))))

(assert (=> b!213384 (and (= (_2!9787 lt!336747) (_2!9787 lt!336721)) (= (_1!9787 lt!336747) (_1!9787 lt!336721)))))

(declare-fun lt!336760 () Unit!15170)

(assert (=> b!213384 (= lt!336760 lt!336715)))

(assert (=> b!213384 (= (_1!9786 lt!336719) (withMovedBitIndex!0 (_2!9786 lt!336719) (bvsub (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))) (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336726))) (currentByte!9727 (_2!9784 lt!336726)) (currentBit!9722 (_2!9784 lt!336726))))))))

(declare-fun lt!336756 () Unit!15170)

(declare-fun Unit!15196 () Unit!15170)

(assert (=> b!213384 (= lt!336756 Unit!15196)))

(assert (=> b!213384 (= (_1!9786 lt!336755) (withMovedBitIndex!0 (_2!9786 lt!336755) (bvsub (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336725))) (currentByte!9727 (_2!9784 lt!336725)) (currentBit!9722 (_2!9784 lt!336725))) (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336726))) (currentByte!9727 (_2!9784 lt!336726)) (currentBit!9722 (_2!9784 lt!336726))))))))

(declare-fun lt!336716 () Unit!15170)

(declare-fun Unit!15197 () Unit!15170)

(assert (=> b!213384 (= lt!336716 Unit!15197)))

(assert (=> b!213384 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))) (bvsub (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336725))) (currentByte!9727 (_2!9784 lt!336725)) (currentBit!9722 (_2!9784 lt!336725))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!336735 () Unit!15170)

(declare-fun Unit!15199 () Unit!15170)

(assert (=> b!213384 (= lt!336735 Unit!15199)))

(assert (=> b!213384 (= (_2!9787 lt!336741) (_2!9787 lt!336733))))

(declare-fun lt!336720 () Unit!15170)

(declare-fun Unit!15200 () Unit!15170)

(assert (=> b!213384 (= lt!336720 Unit!15200)))

(assert (=> b!213384 (invariant!0 (currentBit!9722 (_2!9784 lt!336726)) (currentByte!9727 (_2!9784 lt!336726)) (size!4632 (buf!5161 (_2!9784 lt!336726))))))

(declare-fun lt!336734 () Unit!15170)

(declare-fun Unit!15201 () Unit!15170)

(assert (=> b!213384 (= lt!336734 Unit!15201)))

(assert (=> b!213384 (= (size!4632 (buf!5161 (_2!9784 lt!335926))) (size!4632 (buf!5161 (_2!9784 lt!336726))))))

(declare-fun lt!336763 () Unit!15170)

(declare-fun Unit!15202 () Unit!15170)

(assert (=> b!213384 (= lt!336763 Unit!15202)))

(assert (=> b!213384 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336726))) (currentByte!9727 (_2!9784 lt!336726)) (currentBit!9722 (_2!9784 lt!336726))) (bvsub (bvadd (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336730 () Unit!15170)

(declare-fun Unit!15204 () Unit!15170)

(assert (=> b!213384 (= lt!336730 Unit!15204)))

(declare-fun lt!336727 () Unit!15170)

(declare-fun Unit!15205 () Unit!15170)

(assert (=> b!213384 (= lt!336727 Unit!15205)))

(declare-fun lt!336709 () tuple2!18262)

(assert (=> b!213384 (= lt!336709 (reader!0 (_2!9784 lt!335926) (_2!9784 lt!336726)))))

(declare-fun lt!336731 () (_ BitVec 64))

(assert (=> b!213384 (= lt!336731 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336742 () Unit!15170)

(assert (=> b!213384 (= lt!336742 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9784 lt!335926) (buf!5161 (_2!9784 lt!336726)) lt!336731))))

(assert (=> b!213384 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!336726)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926))) lt!336731)))

(declare-fun lt!336723 () Unit!15170)

(assert (=> b!213384 (= lt!336723 lt!336742)))

(declare-fun lt!336711 () tuple2!18264)

(assert (=> b!213384 (= lt!336711 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!336709) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!179317 () Bool)

(assert (=> b!213384 (= res!179317 (= (_2!9787 lt!336711) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!145348 () Bool)

(assert (=> b!213384 (=> (not res!179317) (not e!145348))))

(assert (=> b!213384 e!145348))

(declare-fun lt!336754 () Unit!15170)

(declare-fun Unit!15206 () Unit!15170)

(assert (=> b!213384 (= lt!336754 Unit!15206)))

(declare-fun bm!3348 () Bool)

(assert (=> bm!3348 (= call!3351 (isPrefixOf!0 (_2!9784 lt!335926) (ite c!10470 (_2!9784 lt!335926) (_2!9784 lt!336726))))))

(declare-fun b!213385 () Bool)

(declare-fun res!179318 () Bool)

(assert (=> b!213385 (=> (not res!179318) (not e!145350))))

(assert (=> b!213385 (= res!179318 (= (size!4632 (buf!5161 (_2!9784 lt!335926))) (size!4632 (buf!5161 (_2!9784 lt!336714)))))))

(declare-fun b!213386 () Bool)

(declare-fun res!179316 () Bool)

(assert (=> b!213386 (=> (not res!179316) (not e!145350))))

(assert (=> b!213386 (= res!179316 (isPrefixOf!0 (_2!9784 lt!335926) (_2!9784 lt!336714)))))

(declare-fun b!213387 () Bool)

(declare-fun e!145354 () Bool)

(declare-fun lt!336761 () tuple2!18260)

(assert (=> b!213387 (= e!145354 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!336761))) (currentByte!9727 (_1!9785 lt!336761)) (currentBit!9722 (_1!9785 lt!336761))) (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336736))) (currentByte!9727 (_2!9784 lt!336736)) (currentBit!9722 (_2!9784 lt!336736)))))))

(declare-fun b!213388 () Bool)

(assert (=> b!213388 (= e!145352 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335926)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926))) lt!336758))))

(declare-fun b!213389 () Bool)

(assert (=> b!213389 (= lt!336761 (readBitPure!0 (readerFrom!0 (_2!9784 lt!336736) (currentBit!9722 (_2!9784 lt!335926)) (currentByte!9727 (_2!9784 lt!335926)))))))

(declare-fun res!179326 () Bool)

(assert (=> b!213389 (= res!179326 (and (= (_2!9785 lt!336761) lt!336748) (= (_1!9785 lt!336761) (_2!9784 lt!336736))))))

(assert (=> b!213389 (=> (not res!179326) (not e!145354))))

(assert (=> b!213389 (= e!145351 e!145354)))

(declare-fun b!213390 () Bool)

(assert (=> b!213390 (= e!145353 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!213391 () Bool)

(assert (=> b!213391 (= e!145348 (= (_1!9787 lt!336711) (_2!9786 lt!336709)))))

(declare-fun b!213392 () Bool)

(declare-fun res!179322 () Bool)

(assert (=> b!213392 (=> (not res!179322) (not e!145350))))

(declare-fun lt!336753 () (_ BitVec 64))

(declare-fun lt!336738 () (_ BitVec 64))

(assert (=> b!213392 (= res!179322 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!336714))) (currentByte!9727 (_2!9784 lt!336714)) (currentBit!9722 (_2!9784 lt!336714))) (bvsub lt!336738 lt!336753)))))

(assert (=> b!213392 (or (= (bvand lt!336738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336753 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336738 lt!336753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213392 (= lt!336753 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!336732 () (_ BitVec 64))

(declare-fun lt!336740 () (_ BitVec 64))

(assert (=> b!213392 (= lt!336738 (bvadd lt!336732 lt!336740))))

(assert (=> b!213392 (or (not (= (bvand lt!336732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336740 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336732 lt!336740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213392 (= lt!336740 ((_ sign_extend 32) nBits!348))))

(assert (=> b!213392 (= lt!336732 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))))))

(assert (= (and d!72077 c!10470) b!213380))

(assert (= (and d!72077 (not c!10470)) b!213384))

(assert (= (and b!213384 res!179319) b!213382))

(assert (= (and b!213382 res!179325) b!213377))

(assert (= (and b!213377 res!179321) b!213389))

(assert (= (and b!213389 res!179326) b!213387))

(assert (= (and b!213384 res!179323) b!213383))

(assert (= (and b!213384 c!10469) b!213390))

(assert (= (and b!213384 (not c!10469)) b!213381))

(assert (= (and b!213384 res!179317) b!213391))

(assert (= (or b!213380 b!213384) bm!3348))

(assert (= (and d!72077 res!179327) b!213385))

(assert (= (and b!213385 res!179318) b!213392))

(assert (= (and b!213392 res!179322) b!213386))

(assert (= (and b!213386 res!179316) b!213378))

(assert (= (and b!213378 res!179324) b!213388))

(assert (= (and b!213378 res!179320) b!213379))

(declare-fun m!328777 () Bool)

(assert (=> b!213380 m!328777))

(declare-fun m!328779 () Bool)

(assert (=> b!213377 m!328779))

(declare-fun m!328781 () Bool)

(assert (=> b!213378 m!328781))

(declare-fun m!328783 () Bool)

(assert (=> b!213378 m!328783))

(declare-fun m!328785 () Bool)

(assert (=> b!213378 m!328785))

(declare-fun m!328789 () Bool)

(assert (=> b!213378 m!328789))

(declare-fun m!328793 () Bool)

(assert (=> b!213378 m!328793))

(declare-fun m!328795 () Bool)

(assert (=> b!213378 m!328795))

(declare-fun m!328799 () Bool)

(assert (=> bm!3348 m!328799))

(declare-fun m!328801 () Bool)

(assert (=> b!213392 m!328801))

(assert (=> b!213392 m!328293))

(declare-fun m!328803 () Bool)

(assert (=> d!72077 m!328803))

(declare-fun m!328805 () Bool)

(assert (=> b!213388 m!328805))

(declare-fun m!328807 () Bool)

(assert (=> b!213387 m!328807))

(declare-fun m!328809 () Bool)

(assert (=> b!213387 m!328809))

(declare-fun m!328811 () Bool)

(assert (=> b!213384 m!328811))

(declare-fun m!328813 () Bool)

(assert (=> b!213384 m!328813))

(assert (=> b!213384 m!328781))

(declare-fun m!328815 () Bool)

(assert (=> b!213384 m!328815))

(declare-fun m!328817 () Bool)

(assert (=> b!213384 m!328817))

(declare-fun m!328819 () Bool)

(assert (=> b!213384 m!328819))

(declare-fun m!328821 () Bool)

(assert (=> b!213384 m!328821))

(declare-fun m!328823 () Bool)

(assert (=> b!213384 m!328823))

(declare-fun m!328825 () Bool)

(assert (=> b!213384 m!328825))

(declare-fun m!328827 () Bool)

(assert (=> b!213384 m!328827))

(declare-fun m!328829 () Bool)

(assert (=> b!213384 m!328829))

(declare-fun m!328831 () Bool)

(assert (=> b!213384 m!328831))

(declare-fun m!328833 () Bool)

(assert (=> b!213384 m!328833))

(declare-fun m!328835 () Bool)

(assert (=> b!213384 m!328835))

(declare-fun m!328837 () Bool)

(assert (=> b!213384 m!328837))

(declare-fun m!328839 () Bool)

(assert (=> b!213384 m!328839))

(declare-fun m!328841 () Bool)

(assert (=> b!213384 m!328841))

(declare-fun m!328843 () Bool)

(assert (=> b!213384 m!328843))

(assert (=> b!213384 m!328795))

(declare-fun m!328845 () Bool)

(assert (=> b!213384 m!328845))

(assert (=> b!213384 m!328293))

(declare-fun m!328847 () Bool)

(assert (=> b!213384 m!328847))

(declare-fun m!328849 () Bool)

(assert (=> b!213384 m!328849))

(declare-fun m!328851 () Bool)

(assert (=> b!213384 m!328851))

(declare-fun m!328853 () Bool)

(assert (=> b!213384 m!328853))

(assert (=> b!213384 m!328815))

(declare-fun m!328855 () Bool)

(assert (=> b!213384 m!328855))

(declare-fun m!328857 () Bool)

(assert (=> b!213384 m!328857))

(declare-fun m!328859 () Bool)

(assert (=> b!213384 m!328859))

(declare-fun m!328861 () Bool)

(assert (=> b!213384 m!328861))

(declare-fun m!328863 () Bool)

(assert (=> b!213384 m!328863))

(declare-fun m!328865 () Bool)

(assert (=> b!213384 m!328865))

(declare-fun m!328867 () Bool)

(assert (=> b!213384 m!328867))

(declare-fun m!328869 () Bool)

(assert (=> b!213384 m!328869))

(declare-fun m!328871 () Bool)

(assert (=> b!213389 m!328871))

(assert (=> b!213389 m!328871))

(declare-fun m!328873 () Bool)

(assert (=> b!213389 m!328873))

(assert (=> b!213382 m!328809))

(assert (=> b!213382 m!328293))

(declare-fun m!328875 () Bool)

(assert (=> b!213386 m!328875))

(assert (=> b!213114 d!72077))

(assert (=> b!213104 d!72057))

(declare-fun d!72101 () Bool)

(declare-fun res!179335 () Bool)

(declare-fun e!145360 () Bool)

(assert (=> d!72101 (=> (not res!179335) (not e!145360))))

(assert (=> d!72101 (= res!179335 (= (size!4632 (buf!5161 (_2!9784 lt!335926))) (size!4632 (buf!5161 (_2!9784 lt!335931)))))))

(assert (=> d!72101 (= (isPrefixOf!0 (_2!9784 lt!335926) (_2!9784 lt!335931)) e!145360)))

(declare-fun b!213398 () Bool)

(declare-fun res!179336 () Bool)

(assert (=> b!213398 (=> (not res!179336) (not e!145360))))

(assert (=> b!213398 (= res!179336 (bvsle (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))) (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335931))) (currentByte!9727 (_2!9784 lt!335931)) (currentBit!9722 (_2!9784 lt!335931)))))))

(declare-fun b!213399 () Bool)

(declare-fun e!145361 () Bool)

(assert (=> b!213399 (= e!145360 e!145361)))

(declare-fun res!179334 () Bool)

(assert (=> b!213399 (=> res!179334 e!145361)))

(assert (=> b!213399 (= res!179334 (= (size!4632 (buf!5161 (_2!9784 lt!335926))) #b00000000000000000000000000000000))))

(declare-fun b!213400 () Bool)

(assert (=> b!213400 (= e!145361 (arrayBitRangesEq!0 (buf!5161 (_2!9784 lt!335926)) (buf!5161 (_2!9784 lt!335931)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926)))))))

(assert (= (and d!72101 res!179335) b!213398))

(assert (= (and b!213398 res!179336) b!213399))

(assert (= (and b!213399 (not res!179334)) b!213400))

(assert (=> b!213398 m!328293))

(assert (=> b!213398 m!328283))

(assert (=> b!213400 m!328293))

(assert (=> b!213400 m!328293))

(declare-fun m!328877 () Bool)

(assert (=> b!213400 m!328877))

(assert (=> b!213115 d!72101))

(declare-fun d!72103 () Bool)

(declare-fun e!145364 () Bool)

(assert (=> d!72103 e!145364))

(declare-fun res!179339 () Bool)

(assert (=> d!72103 (=> (not res!179339) (not e!145364))))

(declare-fun lt!336772 () BitStream!8372)

(declare-fun lt!336773 () (_ BitVec 64))

(assert (=> d!72103 (= res!179339 (= (bvadd lt!336773 (bvsub lt!335942 lt!335927)) (bitIndex!0 (size!4632 (buf!5161 lt!336772)) (currentByte!9727 lt!336772) (currentBit!9722 lt!336772))))))

(assert (=> d!72103 (or (not (= (bvand lt!336773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335942 lt!335927) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336773 (bvsub lt!335942 lt!335927)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72103 (= lt!336773 (bitIndex!0 (size!4632 (buf!5161 (_2!9786 lt!335935))) (currentByte!9727 (_2!9786 lt!335935)) (currentBit!9722 (_2!9786 lt!335935))))))

(assert (=> d!72103 (= lt!336772 (_2!9784 (moveBitIndex!0 (_2!9786 lt!335935) (bvsub lt!335942 lt!335927))))))

(assert (=> d!72103 (moveBitIndexPrecond!0 (_2!9786 lt!335935) (bvsub lt!335942 lt!335927))))

(assert (=> d!72103 (= (withMovedBitIndex!0 (_2!9786 lt!335935) (bvsub lt!335942 lt!335927)) lt!336772)))

(declare-fun b!213403 () Bool)

(assert (=> b!213403 (= e!145364 (= (size!4632 (buf!5161 (_2!9786 lt!335935))) (size!4632 (buf!5161 lt!336772))))))

(assert (= (and d!72103 res!179339) b!213403))

(declare-fun m!328879 () Bool)

(assert (=> d!72103 m!328879))

(declare-fun m!328881 () Bool)

(assert (=> d!72103 m!328881))

(declare-fun m!328883 () Bool)

(assert (=> d!72103 m!328883))

(declare-fun m!328885 () Bool)

(assert (=> d!72103 m!328885))

(assert (=> b!213105 d!72103))

(declare-fun d!72105 () Bool)

(declare-fun e!145366 () Bool)

(assert (=> d!72105 e!145366))

(declare-fun res!179341 () Bool)

(assert (=> d!72105 (=> (not res!179341) (not e!145366))))

(declare-fun lt!336775 () (_ BitVec 64))

(declare-fun lt!336777 () (_ BitVec 64))

(declare-fun lt!336774 () (_ BitVec 64))

(assert (=> d!72105 (= res!179341 (= lt!336774 (bvsub lt!336775 lt!336777)))))

(assert (=> d!72105 (or (= (bvand lt!336775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336777 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336775 lt!336777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72105 (= lt!336777 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9787 lt!335936)))) ((_ sign_extend 32) (currentByte!9727 (_1!9787 lt!335936))) ((_ sign_extend 32) (currentBit!9722 (_1!9787 lt!335936)))))))

(declare-fun lt!336776 () (_ BitVec 64))

(declare-fun lt!336779 () (_ BitVec 64))

(assert (=> d!72105 (= lt!336775 (bvmul lt!336776 lt!336779))))

(assert (=> d!72105 (or (= lt!336776 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336779 (bvsdiv (bvmul lt!336776 lt!336779) lt!336776)))))

(assert (=> d!72105 (= lt!336779 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72105 (= lt!336776 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9787 lt!335936)))))))

(assert (=> d!72105 (= lt!336774 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 (_1!9787 lt!335936))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 (_1!9787 lt!335936)))))))

(assert (=> d!72105 (invariant!0 (currentBit!9722 (_1!9787 lt!335936)) (currentByte!9727 (_1!9787 lt!335936)) (size!4632 (buf!5161 (_1!9787 lt!335936))))))

(assert (=> d!72105 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9787 lt!335936))) (currentByte!9727 (_1!9787 lt!335936)) (currentBit!9722 (_1!9787 lt!335936))) lt!336774)))

(declare-fun b!213405 () Bool)

(declare-fun res!179342 () Bool)

(assert (=> b!213405 (=> (not res!179342) (not e!145366))))

(assert (=> b!213405 (= res!179342 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336774))))

(declare-fun b!213406 () Bool)

(declare-fun lt!336778 () (_ BitVec 64))

(assert (=> b!213406 (= e!145366 (bvsle lt!336774 (bvmul lt!336778 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213406 (or (= lt!336778 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336778 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336778)))))

(assert (=> b!213406 (= lt!336778 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9787 lt!335936)))))))

(assert (= (and d!72105 res!179341) b!213405))

(assert (= (and b!213405 res!179342) b!213406))

(declare-fun m!328887 () Bool)

(assert (=> d!72105 m!328887))

(declare-fun m!328889 () Bool)

(assert (=> d!72105 m!328889))

(assert (=> b!213116 d!72105))

(declare-fun d!72109 () Bool)

(declare-fun e!145369 () Bool)

(assert (=> d!72109 e!145369))

(declare-fun res!179346 () Bool)

(assert (=> d!72109 (=> (not res!179346) (not e!145369))))

(declare-fun lt!336781 () (_ BitVec 64))

(declare-fun lt!336783 () (_ BitVec 64))

(declare-fun lt!336780 () (_ BitVec 64))

(assert (=> d!72109 (= res!179346 (= lt!336780 (bvsub lt!336781 lt!336783)))))

(assert (=> d!72109 (or (= (bvand lt!336781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336781 lt!336783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72109 (= lt!336783 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9786 lt!335932)))) ((_ sign_extend 32) (currentByte!9727 (_2!9786 lt!335932))) ((_ sign_extend 32) (currentBit!9722 (_2!9786 lt!335932)))))))

(declare-fun lt!336782 () (_ BitVec 64))

(declare-fun lt!336785 () (_ BitVec 64))

(assert (=> d!72109 (= lt!336781 (bvmul lt!336782 lt!336785))))

(assert (=> d!72109 (or (= lt!336782 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336785 (bvsdiv (bvmul lt!336782 lt!336785) lt!336782)))))

(assert (=> d!72109 (= lt!336785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72109 (= lt!336782 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9786 lt!335932)))))))

(assert (=> d!72109 (= lt!336780 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 (_2!9786 lt!335932))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 (_2!9786 lt!335932)))))))

(assert (=> d!72109 (invariant!0 (currentBit!9722 (_2!9786 lt!335932)) (currentByte!9727 (_2!9786 lt!335932)) (size!4632 (buf!5161 (_2!9786 lt!335932))))))

(assert (=> d!72109 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9786 lt!335932))) (currentByte!9727 (_2!9786 lt!335932)) (currentBit!9722 (_2!9786 lt!335932))) lt!336780)))

(declare-fun b!213410 () Bool)

(declare-fun res!179347 () Bool)

(assert (=> b!213410 (=> (not res!179347) (not e!145369))))

(assert (=> b!213410 (= res!179347 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336780))))

(declare-fun b!213411 () Bool)

(declare-fun lt!336784 () (_ BitVec 64))

(assert (=> b!213411 (= e!145369 (bvsle lt!336780 (bvmul lt!336784 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213411 (or (= lt!336784 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336784 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336784)))))

(assert (=> b!213411 (= lt!336784 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9786 lt!335932)))))))

(assert (= (and d!72109 res!179346) b!213410))

(assert (= (and b!213410 res!179347) b!213411))

(declare-fun m!328891 () Bool)

(assert (=> d!72109 m!328891))

(declare-fun m!328893 () Bool)

(assert (=> d!72109 m!328893))

(assert (=> b!213116 d!72109))

(declare-fun d!72111 () Bool)

(assert (=> d!72111 (= (invariant!0 (currentBit!9722 (_2!9784 lt!335931)) (currentByte!9727 (_2!9784 lt!335931)) (size!4632 (buf!5161 (_2!9784 lt!335931)))) (and (bvsge (currentBit!9722 (_2!9784 lt!335931)) #b00000000000000000000000000000000) (bvslt (currentBit!9722 (_2!9784 lt!335931)) #b00000000000000000000000000001000) (bvsge (currentByte!9727 (_2!9784 lt!335931)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9727 (_2!9784 lt!335931)) (size!4632 (buf!5161 (_2!9784 lt!335931)))) (and (= (currentBit!9722 (_2!9784 lt!335931)) #b00000000000000000000000000000000) (= (currentByte!9727 (_2!9784 lt!335931)) (size!4632 (buf!5161 (_2!9784 lt!335931))))))))))

(assert (=> b!213106 d!72111))

(declare-fun d!72115 () Bool)

(declare-datatypes ((tuple2!18274 0))(
  ( (tuple2!18275 (_1!9792 Bool) (_2!9792 BitStream!8372)) )
))
(declare-fun lt!336796 () tuple2!18274)

(declare-fun readBit!0 (BitStream!8372) tuple2!18274)

(assert (=> d!72115 (= lt!336796 (readBit!0 lt!335924))))

(assert (=> d!72115 (= (readBitPure!0 lt!335924) (tuple2!18261 (_2!9792 lt!336796) (_1!9792 lt!336796)))))

(declare-fun bs!17686 () Bool)

(assert (= bs!17686 d!72115))

(declare-fun m!328897 () Bool)

(assert (=> bs!17686 m!328897))

(assert (=> b!213117 d!72115))

(declare-fun d!72117 () Bool)

(declare-fun e!145375 () Bool)

(assert (=> d!72117 e!145375))

(declare-fun res!179353 () Bool)

(assert (=> d!72117 (=> (not res!179353) (not e!145375))))

(declare-fun lt!336814 () tuple2!18260)

(declare-fun lt!336812 () tuple2!18260)

(assert (=> d!72117 (= res!179353 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!336814))) (currentByte!9727 (_1!9785 lt!336814)) (currentBit!9722 (_1!9785 lt!336814))) (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!336812))) (currentByte!9727 (_1!9785 lt!336812)) (currentBit!9722 (_1!9785 lt!336812)))))))

(declare-fun lt!336813 () Unit!15170)

(declare-fun lt!336815 () BitStream!8372)

(declare-fun choose!50 (BitStream!8372 BitStream!8372 BitStream!8372 tuple2!18260 tuple2!18260 BitStream!8372 Bool tuple2!18260 tuple2!18260 BitStream!8372 Bool) Unit!15170)

(assert (=> d!72117 (= lt!336813 (choose!50 lt!335924 (_2!9784 lt!335931) lt!336815 lt!336814 (tuple2!18261 (_1!9785 lt!336814) (_2!9785 lt!336814)) (_1!9785 lt!336814) (_2!9785 lt!336814) lt!336812 (tuple2!18261 (_1!9785 lt!336812) (_2!9785 lt!336812)) (_1!9785 lt!336812) (_2!9785 lt!336812)))))

(assert (=> d!72117 (= lt!336812 (readBitPure!0 lt!336815))))

(assert (=> d!72117 (= lt!336814 (readBitPure!0 lt!335924))))

(assert (=> d!72117 (= lt!336815 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 lt!335924) (currentBit!9722 lt!335924)))))

(assert (=> d!72117 (invariant!0 (currentBit!9722 lt!335924) (currentByte!9727 lt!335924) (size!4632 (buf!5161 (_2!9784 lt!335931))))))

(assert (=> d!72117 (= (readBitPrefixLemma!0 lt!335924 (_2!9784 lt!335931)) lt!336813)))

(declare-fun b!213417 () Bool)

(assert (=> b!213417 (= e!145375 (= (_2!9785 lt!336814) (_2!9785 lt!336812)))))

(assert (= (and d!72117 res!179353) b!213417))

(assert (=> d!72117 m!328331))

(declare-fun m!328911 () Bool)

(assert (=> d!72117 m!328911))

(declare-fun m!328913 () Bool)

(assert (=> d!72117 m!328913))

(declare-fun m!328915 () Bool)

(assert (=> d!72117 m!328915))

(declare-fun m!328917 () Bool)

(assert (=> d!72117 m!328917))

(declare-fun m!328919 () Bool)

(assert (=> d!72117 m!328919))

(assert (=> b!213117 d!72117))

(declare-fun b!213468 () Bool)

(declare-fun res!179392 () Bool)

(declare-fun e!145398 () Bool)

(assert (=> b!213468 (=> (not res!179392) (not e!145398))))

(declare-fun lt!336971 () tuple2!18262)

(assert (=> b!213468 (= res!179392 (isPrefixOf!0 (_2!9786 lt!336971) (_2!9784 lt!335931)))))

(declare-fun b!213469 () Bool)

(declare-fun e!145399 () Unit!15170)

(declare-fun Unit!15209 () Unit!15170)

(assert (=> b!213469 (= e!145399 Unit!15209)))

(declare-fun b!213470 () Bool)

(declare-fun res!179393 () Bool)

(assert (=> b!213470 (=> (not res!179393) (not e!145398))))

(assert (=> b!213470 (= res!179393 (isPrefixOf!0 (_1!9786 lt!336971) (_2!9784 lt!335926)))))

(declare-fun d!72125 () Bool)

(assert (=> d!72125 e!145398))

(declare-fun res!179391 () Bool)

(assert (=> d!72125 (=> (not res!179391) (not e!145398))))

(assert (=> d!72125 (= res!179391 (isPrefixOf!0 (_1!9786 lt!336971) (_2!9786 lt!336971)))))

(declare-fun lt!336977 () BitStream!8372)

(assert (=> d!72125 (= lt!336971 (tuple2!18263 lt!336977 (_2!9784 lt!335931)))))

(declare-fun lt!336968 () Unit!15170)

(declare-fun lt!336976 () Unit!15170)

(assert (=> d!72125 (= lt!336968 lt!336976)))

(assert (=> d!72125 (isPrefixOf!0 lt!336977 (_2!9784 lt!335931))))

(assert (=> d!72125 (= lt!336976 (lemmaIsPrefixTransitive!0 lt!336977 (_2!9784 lt!335931) (_2!9784 lt!335931)))))

(declare-fun lt!336981 () Unit!15170)

(declare-fun lt!336969 () Unit!15170)

(assert (=> d!72125 (= lt!336981 lt!336969)))

(assert (=> d!72125 (isPrefixOf!0 lt!336977 (_2!9784 lt!335931))))

(assert (=> d!72125 (= lt!336969 (lemmaIsPrefixTransitive!0 lt!336977 (_2!9784 lt!335926) (_2!9784 lt!335931)))))

(declare-fun lt!336982 () Unit!15170)

(assert (=> d!72125 (= lt!336982 e!145399)))

(declare-fun c!10477 () Bool)

(assert (=> d!72125 (= c!10477 (not (= (size!4632 (buf!5161 (_2!9784 lt!335926))) #b00000000000000000000000000000000)))))

(declare-fun lt!336973 () Unit!15170)

(declare-fun lt!336985 () Unit!15170)

(assert (=> d!72125 (= lt!336973 lt!336985)))

(assert (=> d!72125 (isPrefixOf!0 (_2!9784 lt!335931) (_2!9784 lt!335931))))

(assert (=> d!72125 (= lt!336985 (lemmaIsPrefixRefl!0 (_2!9784 lt!335931)))))

(declare-fun lt!336972 () Unit!15170)

(declare-fun lt!336978 () Unit!15170)

(assert (=> d!72125 (= lt!336972 lt!336978)))

(assert (=> d!72125 (= lt!336978 (lemmaIsPrefixRefl!0 (_2!9784 lt!335931)))))

(declare-fun lt!336970 () Unit!15170)

(declare-fun lt!336980 () Unit!15170)

(assert (=> d!72125 (= lt!336970 lt!336980)))

(assert (=> d!72125 (isPrefixOf!0 lt!336977 lt!336977)))

(assert (=> d!72125 (= lt!336980 (lemmaIsPrefixRefl!0 lt!336977))))

(declare-fun lt!336967 () Unit!15170)

(declare-fun lt!336979 () Unit!15170)

(assert (=> d!72125 (= lt!336967 lt!336979)))

(assert (=> d!72125 (isPrefixOf!0 (_2!9784 lt!335926) (_2!9784 lt!335926))))

(assert (=> d!72125 (= lt!336979 (lemmaIsPrefixRefl!0 (_2!9784 lt!335926)))))

(assert (=> d!72125 (= lt!336977 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))))))

(assert (=> d!72125 (isPrefixOf!0 (_2!9784 lt!335926) (_2!9784 lt!335931))))

(assert (=> d!72125 (= (reader!0 (_2!9784 lt!335926) (_2!9784 lt!335931)) lt!336971)))

(declare-fun b!213471 () Bool)

(declare-fun lt!336975 () (_ BitVec 64))

(declare-fun lt!336966 () (_ BitVec 64))

(assert (=> b!213471 (= e!145398 (= (_1!9786 lt!336971) (withMovedBitIndex!0 (_2!9786 lt!336971) (bvsub lt!336966 lt!336975))))))

(assert (=> b!213471 (or (= (bvand lt!336966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336966 lt!336975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213471 (= lt!336975 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335931))) (currentByte!9727 (_2!9784 lt!335931)) (currentBit!9722 (_2!9784 lt!335931))))))

(assert (=> b!213471 (= lt!336966 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))))))

(declare-fun b!213472 () Bool)

(declare-fun lt!336974 () Unit!15170)

(assert (=> b!213472 (= e!145399 lt!336974)))

(declare-fun lt!336983 () (_ BitVec 64))

(assert (=> b!213472 (= lt!336983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!336984 () (_ BitVec 64))

(assert (=> b!213472 (= lt!336984 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10545 array!10545 (_ BitVec 64) (_ BitVec 64)) Unit!15170)

(assert (=> b!213472 (= lt!336974 (arrayBitRangesEqSymmetric!0 (buf!5161 (_2!9784 lt!335926)) (buf!5161 (_2!9784 lt!335931)) lt!336983 lt!336984))))

(assert (=> b!213472 (arrayBitRangesEq!0 (buf!5161 (_2!9784 lt!335931)) (buf!5161 (_2!9784 lt!335926)) lt!336983 lt!336984)))

(assert (= (and d!72125 c!10477) b!213472))

(assert (= (and d!72125 (not c!10477)) b!213469))

(assert (= (and d!72125 res!179391) b!213470))

(assert (= (and b!213470 res!179393) b!213468))

(assert (= (and b!213468 res!179392) b!213471))

(declare-fun m!329015 () Bool)

(assert (=> b!213471 m!329015))

(assert (=> b!213471 m!328283))

(assert (=> b!213471 m!328293))

(declare-fun m!329017 () Bool)

(assert (=> b!213468 m!329017))

(declare-fun m!329019 () Bool)

(assert (=> b!213470 m!329019))

(assert (=> b!213472 m!328293))

(declare-fun m!329021 () Bool)

(assert (=> b!213472 m!329021))

(declare-fun m!329023 () Bool)

(assert (=> b!213472 m!329023))

(assert (=> d!72125 m!328777))

(declare-fun m!329025 () Bool)

(assert (=> d!72125 m!329025))

(declare-fun m!329029 () Bool)

(assert (=> d!72125 m!329029))

(declare-fun m!329031 () Bool)

(assert (=> d!72125 m!329031))

(declare-fun m!329033 () Bool)

(assert (=> d!72125 m!329033))

(assert (=> d!72125 m!328325))

(declare-fun m!329035 () Bool)

(assert (=> d!72125 m!329035))

(declare-fun m!329037 () Bool)

(assert (=> d!72125 m!329037))

(declare-fun m!329039 () Bool)

(assert (=> d!72125 m!329039))

(declare-fun m!329041 () Bool)

(assert (=> d!72125 m!329041))

(declare-fun m!329043 () Bool)

(assert (=> d!72125 m!329043))

(assert (=> b!213117 d!72125))

(declare-fun d!72159 () Bool)

(assert (=> d!72159 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!213117 d!72159))

(declare-fun d!72163 () Bool)

(declare-fun lt!336992 () tuple2!18274)

(assert (=> d!72163 (= lt!336992 (readBit!0 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204))))))

(assert (=> d!72163 (= (readBitPure!0 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204))) (tuple2!18261 (_2!9792 lt!336992) (_1!9792 lt!336992)))))

(declare-fun bs!17698 () Bool)

(assert (= bs!17698 d!72163))

(declare-fun m!329047 () Bool)

(assert (=> bs!17698 m!329047))

(assert (=> b!213117 d!72163))

(declare-fun d!72165 () Bool)

(assert (=> d!72165 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926))) lt!335923) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926)))) lt!335923))))

(declare-fun bs!17699 () Bool)

(assert (= bs!17699 d!72165))

(declare-fun m!329049 () Bool)

(assert (=> bs!17699 m!329049))

(assert (=> b!213117 d!72165))

(declare-fun d!72167 () Bool)

(declare-fun e!145401 () Bool)

(assert (=> d!72167 e!145401))

(declare-fun res!179396 () Bool)

(assert (=> d!72167 (=> (not res!179396) (not e!145401))))

(declare-fun lt!336993 () (_ BitVec 64))

(declare-fun lt!336996 () (_ BitVec 64))

(declare-fun lt!336994 () (_ BitVec 64))

(assert (=> d!72167 (= res!179396 (= lt!336993 (bvsub lt!336994 lt!336996)))))

(assert (=> d!72167 (or (= (bvand lt!336994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336994 lt!336996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72167 (= lt!336996 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335933)))) ((_ sign_extend 32) (currentByte!9727 (_1!9785 lt!335933))) ((_ sign_extend 32) (currentBit!9722 (_1!9785 lt!335933)))))))

(declare-fun lt!336995 () (_ BitVec 64))

(declare-fun lt!336998 () (_ BitVec 64))

(assert (=> d!72167 (= lt!336994 (bvmul lt!336995 lt!336998))))

(assert (=> d!72167 (or (= lt!336995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336998 (bvsdiv (bvmul lt!336995 lt!336998) lt!336995)))))

(assert (=> d!72167 (= lt!336998 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72167 (= lt!336995 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335933)))))))

(assert (=> d!72167 (= lt!336993 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 (_1!9785 lt!335933))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 (_1!9785 lt!335933)))))))

(assert (=> d!72167 (invariant!0 (currentBit!9722 (_1!9785 lt!335933)) (currentByte!9727 (_1!9785 lt!335933)) (size!4632 (buf!5161 (_1!9785 lt!335933))))))

(assert (=> d!72167 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!335933))) (currentByte!9727 (_1!9785 lt!335933)) (currentBit!9722 (_1!9785 lt!335933))) lt!336993)))

(declare-fun b!213475 () Bool)

(declare-fun res!179397 () Bool)

(assert (=> b!213475 (=> (not res!179397) (not e!145401))))

(assert (=> b!213475 (= res!179397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336993))))

(declare-fun b!213476 () Bool)

(declare-fun lt!336997 () (_ BitVec 64))

(assert (=> b!213476 (= e!145401 (bvsle lt!336993 (bvmul lt!336997 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213476 (or (= lt!336997 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336997 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336997)))))

(assert (=> b!213476 (= lt!336997 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335933)))))))

(assert (= (and d!72167 res!179396) b!213475))

(assert (= (and b!213475 res!179397) b!213476))

(declare-fun m!329051 () Bool)

(assert (=> d!72167 m!329051))

(declare-fun m!329053 () Bool)

(assert (=> d!72167 m!329053))

(assert (=> b!213117 d!72167))

(declare-fun b!213477 () Bool)

(declare-fun res!179399 () Bool)

(declare-fun e!145402 () Bool)

(assert (=> b!213477 (=> (not res!179399) (not e!145402))))

(declare-fun lt!337004 () tuple2!18262)

(assert (=> b!213477 (= res!179399 (isPrefixOf!0 (_2!9786 lt!337004) (_2!9784 lt!335931)))))

(declare-fun b!213478 () Bool)

(declare-fun e!145403 () Unit!15170)

(declare-fun Unit!15210 () Unit!15170)

(assert (=> b!213478 (= e!145403 Unit!15210)))

(declare-fun b!213479 () Bool)

(declare-fun res!179400 () Bool)

(assert (=> b!213479 (=> (not res!179400) (not e!145402))))

(assert (=> b!213479 (= res!179400 (isPrefixOf!0 (_1!9786 lt!337004) thiss!1204))))

(declare-fun d!72169 () Bool)

(assert (=> d!72169 e!145402))

(declare-fun res!179398 () Bool)

(assert (=> d!72169 (=> (not res!179398) (not e!145402))))

(assert (=> d!72169 (= res!179398 (isPrefixOf!0 (_1!9786 lt!337004) (_2!9786 lt!337004)))))

(declare-fun lt!337010 () BitStream!8372)

(assert (=> d!72169 (= lt!337004 (tuple2!18263 lt!337010 (_2!9784 lt!335931)))))

(declare-fun lt!337001 () Unit!15170)

(declare-fun lt!337009 () Unit!15170)

(assert (=> d!72169 (= lt!337001 lt!337009)))

(assert (=> d!72169 (isPrefixOf!0 lt!337010 (_2!9784 lt!335931))))

(assert (=> d!72169 (= lt!337009 (lemmaIsPrefixTransitive!0 lt!337010 (_2!9784 lt!335931) (_2!9784 lt!335931)))))

(declare-fun lt!337014 () Unit!15170)

(declare-fun lt!337002 () Unit!15170)

(assert (=> d!72169 (= lt!337014 lt!337002)))

(assert (=> d!72169 (isPrefixOf!0 lt!337010 (_2!9784 lt!335931))))

(assert (=> d!72169 (= lt!337002 (lemmaIsPrefixTransitive!0 lt!337010 thiss!1204 (_2!9784 lt!335931)))))

(declare-fun lt!337015 () Unit!15170)

(assert (=> d!72169 (= lt!337015 e!145403)))

(declare-fun c!10478 () Bool)

(assert (=> d!72169 (= c!10478 (not (= (size!4632 (buf!5161 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!337006 () Unit!15170)

(declare-fun lt!337018 () Unit!15170)

(assert (=> d!72169 (= lt!337006 lt!337018)))

(assert (=> d!72169 (isPrefixOf!0 (_2!9784 lt!335931) (_2!9784 lt!335931))))

(assert (=> d!72169 (= lt!337018 (lemmaIsPrefixRefl!0 (_2!9784 lt!335931)))))

(declare-fun lt!337005 () Unit!15170)

(declare-fun lt!337011 () Unit!15170)

(assert (=> d!72169 (= lt!337005 lt!337011)))

(assert (=> d!72169 (= lt!337011 (lemmaIsPrefixRefl!0 (_2!9784 lt!335931)))))

(declare-fun lt!337003 () Unit!15170)

(declare-fun lt!337013 () Unit!15170)

(assert (=> d!72169 (= lt!337003 lt!337013)))

(assert (=> d!72169 (isPrefixOf!0 lt!337010 lt!337010)))

(assert (=> d!72169 (= lt!337013 (lemmaIsPrefixRefl!0 lt!337010))))

(declare-fun lt!337000 () Unit!15170)

(declare-fun lt!337012 () Unit!15170)

(assert (=> d!72169 (= lt!337000 lt!337012)))

(assert (=> d!72169 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72169 (= lt!337012 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72169 (= lt!337010 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(assert (=> d!72169 (isPrefixOf!0 thiss!1204 (_2!9784 lt!335931))))

(assert (=> d!72169 (= (reader!0 thiss!1204 (_2!9784 lt!335931)) lt!337004)))

(declare-fun b!213480 () Bool)

(declare-fun lt!336999 () (_ BitVec 64))

(declare-fun lt!337008 () (_ BitVec 64))

(assert (=> b!213480 (= e!145402 (= (_1!9786 lt!337004) (withMovedBitIndex!0 (_2!9786 lt!337004) (bvsub lt!336999 lt!337008))))))

(assert (=> b!213480 (or (= (bvand lt!336999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336999 lt!337008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213480 (= lt!337008 (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335931))) (currentByte!9727 (_2!9784 lt!335931)) (currentBit!9722 (_2!9784 lt!335931))))))

(assert (=> b!213480 (= lt!336999 (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(declare-fun b!213481 () Bool)

(declare-fun lt!337007 () Unit!15170)

(assert (=> b!213481 (= e!145403 lt!337007)))

(declare-fun lt!337016 () (_ BitVec 64))

(assert (=> b!213481 (= lt!337016 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337017 () (_ BitVec 64))

(assert (=> b!213481 (= lt!337017 (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(assert (=> b!213481 (= lt!337007 (arrayBitRangesEqSymmetric!0 (buf!5161 thiss!1204) (buf!5161 (_2!9784 lt!335931)) lt!337016 lt!337017))))

(assert (=> b!213481 (arrayBitRangesEq!0 (buf!5161 (_2!9784 lt!335931)) (buf!5161 thiss!1204) lt!337016 lt!337017)))

(assert (= (and d!72169 c!10478) b!213481))

(assert (= (and d!72169 (not c!10478)) b!213478))

(assert (= (and d!72169 res!179398) b!213479))

(assert (= (and b!213479 res!179400) b!213477))

(assert (= (and b!213477 res!179399) b!213480))

(declare-fun m!329055 () Bool)

(assert (=> b!213480 m!329055))

(assert (=> b!213480 m!328283))

(assert (=> b!213480 m!328295))

(declare-fun m!329057 () Bool)

(assert (=> b!213477 m!329057))

(declare-fun m!329059 () Bool)

(assert (=> b!213479 m!329059))

(assert (=> b!213481 m!328295))

(declare-fun m!329061 () Bool)

(assert (=> b!213481 m!329061))

(declare-fun m!329063 () Bool)

(assert (=> b!213481 m!329063))

(declare-fun m!329065 () Bool)

(assert (=> d!72169 m!329065))

(declare-fun m!329067 () Bool)

(assert (=> d!72169 m!329067))

(declare-fun m!329069 () Bool)

(assert (=> d!72169 m!329069))

(assert (=> d!72169 m!329031))

(assert (=> d!72169 m!329033))

(assert (=> d!72169 m!328285))

(declare-fun m!329071 () Bool)

(assert (=> d!72169 m!329071))

(declare-fun m!329073 () Bool)

(assert (=> d!72169 m!329073))

(declare-fun m!329075 () Bool)

(assert (=> d!72169 m!329075))

(declare-fun m!329077 () Bool)

(assert (=> d!72169 m!329077))

(declare-fun m!329079 () Bool)

(assert (=> d!72169 m!329079))

(assert (=> b!213117 d!72169))

(declare-fun d!72171 () Bool)

(declare-fun e!145404 () Bool)

(assert (=> d!72171 e!145404))

(declare-fun res!179401 () Bool)

(assert (=> d!72171 (=> (not res!179401) (not e!145404))))

(declare-fun lt!337019 () (_ BitVec 64))

(declare-fun lt!337020 () (_ BitVec 64))

(declare-fun lt!337022 () (_ BitVec 64))

(assert (=> d!72171 (= res!179401 (= lt!337019 (bvsub lt!337020 lt!337022)))))

(assert (=> d!72171 (or (= (bvand lt!337020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337022 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337020 lt!337022) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72171 (= lt!337022 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335938)))) ((_ sign_extend 32) (currentByte!9727 (_1!9785 lt!335938))) ((_ sign_extend 32) (currentBit!9722 (_1!9785 lt!335938)))))))

(declare-fun lt!337021 () (_ BitVec 64))

(declare-fun lt!337024 () (_ BitVec 64))

(assert (=> d!72171 (= lt!337020 (bvmul lt!337021 lt!337024))))

(assert (=> d!72171 (or (= lt!337021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337024 (bvsdiv (bvmul lt!337021 lt!337024) lt!337021)))))

(assert (=> d!72171 (= lt!337024 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72171 (= lt!337021 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335938)))))))

(assert (=> d!72171 (= lt!337019 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 (_1!9785 lt!335938))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 (_1!9785 lt!335938)))))))

(assert (=> d!72171 (invariant!0 (currentBit!9722 (_1!9785 lt!335938)) (currentByte!9727 (_1!9785 lt!335938)) (size!4632 (buf!5161 (_1!9785 lt!335938))))))

(assert (=> d!72171 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!335938))) (currentByte!9727 (_1!9785 lt!335938)) (currentBit!9722 (_1!9785 lt!335938))) lt!337019)))

(declare-fun b!213482 () Bool)

(declare-fun res!179402 () Bool)

(assert (=> b!213482 (=> (not res!179402) (not e!145404))))

(assert (=> b!213482 (= res!179402 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337019))))

(declare-fun b!213483 () Bool)

(declare-fun lt!337023 () (_ BitVec 64))

(assert (=> b!213483 (= e!145404 (bvsle lt!337019 (bvmul lt!337023 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213483 (or (= lt!337023 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337023 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337023)))))

(assert (=> b!213483 (= lt!337023 ((_ sign_extend 32) (size!4632 (buf!5161 (_1!9785 lt!335938)))))))

(assert (= (and d!72171 res!179401) b!213482))

(assert (= (and b!213482 res!179402) b!213483))

(declare-fun m!329081 () Bool)

(assert (=> d!72171 m!329081))

(declare-fun m!329083 () Bool)

(assert (=> d!72171 m!329083))

(assert (=> b!213117 d!72171))

(declare-fun d!72173 () Bool)

(assert (=> d!72173 (= (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335926)))) (and (bvsge (currentBit!9722 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9722 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9727 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335926)))) (and (= (currentBit!9722 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335926))))))))))

(assert (=> b!213117 d!72173))

(declare-fun d!72175 () Bool)

(assert (=> d!72175 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926))) lt!335923)))

(declare-fun lt!337027 () Unit!15170)

(declare-fun choose!9 (BitStream!8372 array!10545 (_ BitVec 64) BitStream!8372) Unit!15170)

(assert (=> d!72175 (= lt!337027 (choose!9 (_2!9784 lt!335926) (buf!5161 (_2!9784 lt!335931)) lt!335923 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926)))))))

(assert (=> d!72175 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9784 lt!335926) (buf!5161 (_2!9784 lt!335931)) lt!335923) lt!337027)))

(declare-fun bs!17700 () Bool)

(assert (= bs!17700 d!72175))

(assert (=> bs!17700 m!328353))

(declare-fun m!329085 () Bool)

(assert (=> bs!17700 m!329085))

(assert (=> b!213117 d!72175))

(declare-datatypes ((tuple2!18276 0))(
  ( (tuple2!18277 (_1!9793 (_ BitVec 64)) (_2!9793 BitStream!8372)) )
))
(declare-fun lt!337030 () tuple2!18276)

(declare-fun d!72177 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18276)

(assert (=> d!72177 (= lt!337030 (readNBitsLSBFirstsLoop!0 (_1!9786 lt!335932) nBits!348 i!590 lt!335917))))

(assert (=> d!72177 (= (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!335932) nBits!348 i!590 lt!335917) (tuple2!18265 (_2!9793 lt!337030) (_1!9793 lt!337030)))))

(declare-fun bs!17701 () Bool)

(assert (= bs!17701 d!72177))

(declare-fun m!329087 () Bool)

(assert (=> bs!17701 m!329087))

(assert (=> b!213117 d!72177))

(declare-fun d!72179 () Bool)

(assert (=> d!72179 (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204)) lt!335934)))

(declare-fun lt!337031 () Unit!15170)

(assert (=> d!72179 (= lt!337031 (choose!9 thiss!1204 (buf!5161 (_2!9784 lt!335931)) lt!335934 (BitStream!8373 (buf!5161 (_2!9784 lt!335931)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204))))))

(assert (=> d!72179 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5161 (_2!9784 lt!335931)) lt!335934) lt!337031)))

(declare-fun bs!17702 () Bool)

(assert (= bs!17702 d!72179))

(assert (=> bs!17702 m!328349))

(declare-fun m!329089 () Bool)

(assert (=> bs!17702 m!329089))

(assert (=> b!213117 d!72179))

(declare-fun d!72181 () Bool)

(declare-fun lt!337032 () tuple2!18274)

(assert (=> d!72181 (= lt!337032 (readBit!0 (_1!9786 lt!335932)))))

(assert (=> d!72181 (= (readBitPure!0 (_1!9786 lt!335932)) (tuple2!18261 (_2!9792 lt!337032) (_1!9792 lt!337032)))))

(declare-fun bs!17703 () Bool)

(assert (= bs!17703 d!72181))

(declare-fun m!329091 () Bool)

(assert (=> bs!17703 m!329091))

(assert (=> b!213117 d!72181))

(declare-fun d!72183 () Bool)

(assert (=> d!72183 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204)) lt!335934) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335931)))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204))) lt!335934))))

(declare-fun bs!17704 () Bool)

(assert (= bs!17704 d!72183))

(declare-fun m!329093 () Bool)

(assert (=> bs!17704 m!329093))

(assert (=> b!213117 d!72183))

(declare-fun d!72185 () Bool)

(declare-fun lt!337033 () tuple2!18276)

(assert (=> d!72185 (= lt!337033 (readNBitsLSBFirstsLoop!0 (_1!9786 lt!335935) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335925))))

(assert (=> d!72185 (= (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!335935) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335925) (tuple2!18265 (_2!9793 lt!337033) (_1!9793 lt!337033)))))

(declare-fun bs!17705 () Bool)

(assert (= bs!17705 d!72185))

(declare-fun m!329095 () Bool)

(assert (=> bs!17705 m!329095))

(assert (=> b!213117 d!72185))

(declare-fun d!72187 () Bool)

(assert (=> d!72187 (= (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 thiss!1204))) (and (bvsge (currentBit!9722 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9722 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9727 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9727 thiss!1204) (size!4632 (buf!5161 thiss!1204))) (and (= (currentBit!9722 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9727 thiss!1204) (size!4632 (buf!5161 thiss!1204)))))))))

(assert (=> b!213119 d!72187))

(declare-fun d!72189 () Bool)

(declare-fun e!145405 () Bool)

(assert (=> d!72189 e!145405))

(declare-fun res!179403 () Bool)

(assert (=> d!72189 (=> (not res!179403) (not e!145405))))

(declare-fun lt!337034 () (_ BitVec 64))

(declare-fun lt!337037 () (_ BitVec 64))

(declare-fun lt!337035 () (_ BitVec 64))

(assert (=> d!72189 (= res!179403 (= lt!337034 (bvsub lt!337035 lt!337037)))))

(assert (=> d!72189 (or (= (bvand lt!337035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337035 lt!337037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72189 (= lt!337037 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335926)))) ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926)))))))

(declare-fun lt!337036 () (_ BitVec 64))

(declare-fun lt!337039 () (_ BitVec 64))

(assert (=> d!72189 (= lt!337035 (bvmul lt!337036 lt!337039))))

(assert (=> d!72189 (or (= lt!337036 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337039 (bvsdiv (bvmul lt!337036 lt!337039) lt!337036)))))

(assert (=> d!72189 (= lt!337039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72189 (= lt!337036 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335926)))))))

(assert (=> d!72189 (= lt!337034 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 (_2!9784 lt!335926))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 (_2!9784 lt!335926)))))))

(assert (=> d!72189 (invariant!0 (currentBit!9722 (_2!9784 lt!335926)) (currentByte!9727 (_2!9784 lt!335926)) (size!4632 (buf!5161 (_2!9784 lt!335926))))))

(assert (=> d!72189 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!335926))) (currentByte!9727 (_2!9784 lt!335926)) (currentBit!9722 (_2!9784 lt!335926))) lt!337034)))

(declare-fun b!213484 () Bool)

(declare-fun res!179404 () Bool)

(assert (=> b!213484 (=> (not res!179404) (not e!145405))))

(assert (=> b!213484 (= res!179404 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337034))))

(declare-fun b!213485 () Bool)

(declare-fun lt!337038 () (_ BitVec 64))

(assert (=> b!213485 (= e!145405 (bvsle lt!337034 (bvmul lt!337038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213485 (or (= lt!337038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337038)))))

(assert (=> b!213485 (= lt!337038 ((_ sign_extend 32) (size!4632 (buf!5161 (_2!9784 lt!335926)))))))

(assert (= (and d!72189 res!179403) b!213484))

(assert (= (and b!213484 res!179404) b!213485))

(declare-fun m!329097 () Bool)

(assert (=> d!72189 m!329097))

(declare-fun m!329099 () Bool)

(assert (=> d!72189 m!329099))

(assert (=> b!213109 d!72189))

(declare-fun d!72191 () Bool)

(declare-fun e!145406 () Bool)

(assert (=> d!72191 e!145406))

(declare-fun res!179405 () Bool)

(assert (=> d!72191 (=> (not res!179405) (not e!145406))))

(declare-fun lt!337040 () (_ BitVec 64))

(declare-fun lt!337043 () (_ BitVec 64))

(declare-fun lt!337041 () (_ BitVec 64))

(assert (=> d!72191 (= res!179405 (= lt!337040 (bvsub lt!337041 lt!337043)))))

(assert (=> d!72191 (or (= (bvand lt!337041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337041 lt!337043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72191 (= lt!337043 (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 thiss!1204))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204))))))

(declare-fun lt!337042 () (_ BitVec 64))

(declare-fun lt!337045 () (_ BitVec 64))

(assert (=> d!72191 (= lt!337041 (bvmul lt!337042 lt!337045))))

(assert (=> d!72191 (or (= lt!337042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337045 (bvsdiv (bvmul lt!337042 lt!337045) lt!337042)))))

(assert (=> d!72191 (= lt!337045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72191 (= lt!337042 ((_ sign_extend 32) (size!4632 (buf!5161 thiss!1204))))))

(assert (=> d!72191 (= lt!337040 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9727 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9722 thiss!1204))))))

(assert (=> d!72191 (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 thiss!1204)))))

(assert (=> d!72191 (= (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)) lt!337040)))

(declare-fun b!213486 () Bool)

(declare-fun res!179406 () Bool)

(assert (=> b!213486 (=> (not res!179406) (not e!145406))))

(assert (=> b!213486 (= res!179406 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337040))))

(declare-fun b!213487 () Bool)

(declare-fun lt!337044 () (_ BitVec 64))

(assert (=> b!213487 (= e!145406 (bvsle lt!337040 (bvmul lt!337044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213487 (or (= lt!337044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337044)))))

(assert (=> b!213487 (= lt!337044 ((_ sign_extend 32) (size!4632 (buf!5161 thiss!1204))))))

(assert (= (and d!72191 res!179405) b!213486))

(assert (= (and b!213486 res!179406) b!213487))

(declare-fun m!329101 () Bool)

(assert (=> d!72191 m!329101))

(assert (=> d!72191 m!328299))

(assert (=> b!213109 d!72191))

(declare-fun d!72193 () Bool)

(assert (=> d!72193 (= (array_inv!4373 (buf!5161 thiss!1204)) (bvsge (size!4632 (buf!5161 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!213120 d!72193))

(declare-fun d!72195 () Bool)

(assert (=> d!72195 (= (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335931)))) (and (bvsge (currentBit!9722 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9722 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9727 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335931)))) (and (= (currentBit!9722 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335931))))))))))

(assert (=> b!213110 d!72195))

(declare-fun d!72197 () Bool)

(assert (=> d!72197 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4632 (buf!5161 thiss!1204))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204)) lt!335934) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4632 (buf!5161 thiss!1204))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204))) lt!335934))))

(declare-fun bs!17706 () Bool)

(assert (= bs!17706 d!72197))

(assert (=> bs!17706 m!329101))

(assert (=> b!213121 d!72197))

(declare-fun d!72199 () Bool)

(declare-fun lt!337046 () tuple2!18274)

(assert (=> d!72199 (= lt!337046 (readBit!0 (readerFrom!0 (_2!9784 lt!335926) (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204))))))

(assert (=> d!72199 (= (readBitPure!0 (readerFrom!0 (_2!9784 lt!335926) (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204))) (tuple2!18261 (_2!9792 lt!337046) (_1!9792 lt!337046)))))

(declare-fun bs!17707 () Bool)

(assert (= bs!17707 d!72199))

(assert (=> bs!17707 m!328319))

(declare-fun m!329103 () Bool)

(assert (=> bs!17707 m!329103))

(assert (=> b!213100 d!72199))

(declare-fun d!72201 () Bool)

(declare-fun e!145409 () Bool)

(assert (=> d!72201 e!145409))

(declare-fun res!179410 () Bool)

(assert (=> d!72201 (=> (not res!179410) (not e!145409))))

(assert (=> d!72201 (= res!179410 (invariant!0 (currentBit!9722 (_2!9784 lt!335926)) (currentByte!9727 (_2!9784 lt!335926)) (size!4632 (buf!5161 (_2!9784 lt!335926)))))))

(assert (=> d!72201 (= (readerFrom!0 (_2!9784 lt!335926) (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204)) (BitStream!8373 (buf!5161 (_2!9784 lt!335926)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(declare-fun b!213490 () Bool)

(assert (=> b!213490 (= e!145409 (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 (_2!9784 lt!335926)))))))

(assert (= (and d!72201 res!179410) b!213490))

(assert (=> d!72201 m!329099))

(assert (=> b!213490 m!328345))

(assert (=> b!213100 d!72201))

(declare-fun d!72203 () Bool)

(assert (=> d!72203 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204) (size!4632 (buf!5161 thiss!1204))))))

(declare-fun bs!17708 () Bool)

(assert (= bs!17708 d!72203))

(assert (=> bs!17708 m!328299))

(assert (=> start!44572 d!72203))

(assert (=> b!213111 d!72189))

(assert (=> b!213111 d!72191))

(declare-fun b!213501 () Bool)

(declare-fun res!179419 () Bool)

(declare-fun e!145415 () Bool)

(assert (=> b!213501 (=> (not res!179419) (not e!145415))))

(declare-fun lt!337058 () tuple2!18258)

(assert (=> b!213501 (= res!179419 (isPrefixOf!0 thiss!1204 (_2!9784 lt!337058)))))

(declare-fun b!213503 () Bool)

(declare-fun e!145414 () Bool)

(declare-fun lt!337056 () tuple2!18260)

(assert (=> b!213503 (= e!145414 (= (bitIndex!0 (size!4632 (buf!5161 (_1!9785 lt!337056))) (currentByte!9727 (_1!9785 lt!337056)) (currentBit!9722 (_1!9785 lt!337056))) (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!337058))) (currentByte!9727 (_2!9784 lt!337058)) (currentBit!9722 (_2!9784 lt!337058)))))))

(declare-fun d!72205 () Bool)

(assert (=> d!72205 e!145415))

(declare-fun res!179420 () Bool)

(assert (=> d!72205 (=> (not res!179420) (not e!145415))))

(assert (=> d!72205 (= res!179420 (= (size!4632 (buf!5161 thiss!1204)) (size!4632 (buf!5161 (_2!9784 lt!337058)))))))

(declare-fun choose!16 (BitStream!8372 Bool) tuple2!18258)

(assert (=> d!72205 (= lt!337058 (choose!16 thiss!1204 lt!335920))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72205 (validate_offset_bit!0 ((_ sign_extend 32) (size!4632 (buf!5161 thiss!1204))) ((_ sign_extend 32) (currentByte!9727 thiss!1204)) ((_ sign_extend 32) (currentBit!9722 thiss!1204)))))

(assert (=> d!72205 (= (appendBit!0 thiss!1204 lt!335920) lt!337058)))

(declare-fun b!213502 () Bool)

(assert (=> b!213502 (= e!145415 e!145414)))

(declare-fun res!179421 () Bool)

(assert (=> b!213502 (=> (not res!179421) (not e!145414))))

(assert (=> b!213502 (= res!179421 (and (= (_2!9785 lt!337056) lt!335920) (= (_1!9785 lt!337056) (_2!9784 lt!337058))))))

(assert (=> b!213502 (= lt!337056 (readBitPure!0 (readerFrom!0 (_2!9784 lt!337058) (currentBit!9722 thiss!1204) (currentByte!9727 thiss!1204))))))

(declare-fun b!213500 () Bool)

(declare-fun res!179422 () Bool)

(assert (=> b!213500 (=> (not res!179422) (not e!145415))))

(declare-fun lt!337055 () (_ BitVec 64))

(declare-fun lt!337057 () (_ BitVec 64))

(assert (=> b!213500 (= res!179422 (= (bitIndex!0 (size!4632 (buf!5161 (_2!9784 lt!337058))) (currentByte!9727 (_2!9784 lt!337058)) (currentBit!9722 (_2!9784 lt!337058))) (bvadd lt!337055 lt!337057)))))

(assert (=> b!213500 (or (not (= (bvand lt!337055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337057 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337055 lt!337057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213500 (= lt!337057 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!213500 (= lt!337055 (bitIndex!0 (size!4632 (buf!5161 thiss!1204)) (currentByte!9727 thiss!1204) (currentBit!9722 thiss!1204)))))

(assert (= (and d!72205 res!179420) b!213500))

(assert (= (and b!213500 res!179422) b!213501))

(assert (= (and b!213501 res!179419) b!213502))

(assert (= (and b!213502 res!179421) b!213503))

(declare-fun m!329105 () Bool)

(assert (=> b!213501 m!329105))

(declare-fun m!329107 () Bool)

(assert (=> b!213503 m!329107))

(declare-fun m!329109 () Bool)

(assert (=> b!213503 m!329109))

(assert (=> b!213500 m!329109))

(assert (=> b!213500 m!328295))

(declare-fun m!329111 () Bool)

(assert (=> b!213502 m!329111))

(assert (=> b!213502 m!329111))

(declare-fun m!329113 () Bool)

(assert (=> b!213502 m!329113))

(declare-fun m!329115 () Bool)

(assert (=> d!72205 m!329115))

(declare-fun m!329117 () Bool)

(assert (=> d!72205 m!329117))

(assert (=> b!213111 d!72205))

(declare-fun d!72207 () Bool)

(declare-fun lt!337076 () tuple2!18264)

(declare-fun lt!337071 () tuple2!18264)

(assert (=> d!72207 (and (= (_2!9787 lt!337076) (_2!9787 lt!337071)) (= (_1!9787 lt!337076) (_1!9787 lt!337071)))))

(declare-fun lt!337075 () Bool)

(declare-fun lt!337074 () Unit!15170)

(declare-fun lt!337072 () (_ BitVec 64))

(declare-fun lt!337073 () BitStream!8372)

(declare-fun choose!56 (BitStream!8372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18264 tuple2!18264 BitStream!8372 (_ BitVec 64) Bool BitStream!8372 (_ BitVec 64) tuple2!18264 tuple2!18264 BitStream!8372 (_ BitVec 64)) Unit!15170)

(assert (=> d!72207 (= lt!337074 (choose!56 (_1!9786 lt!335932) nBits!348 i!590 lt!335917 lt!337076 (tuple2!18265 (_1!9787 lt!337076) (_2!9787 lt!337076)) (_1!9787 lt!337076) (_2!9787 lt!337076) lt!337075 lt!337073 lt!337072 lt!337071 (tuple2!18265 (_1!9787 lt!337071) (_2!9787 lt!337071)) (_1!9787 lt!337071) (_2!9787 lt!337071)))))

(assert (=> d!72207 (= lt!337071 (readNBitsLSBFirstsLoopPure!0 lt!337073 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!337072))))

(assert (=> d!72207 (= lt!337072 (bvor lt!335917 (ite lt!337075 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72207 (= lt!337073 (withMovedBitIndex!0 (_1!9786 lt!335932) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72207 (= lt!337075 (_2!9785 (readBitPure!0 (_1!9786 lt!335932))))))

(assert (=> d!72207 (= lt!337076 (readNBitsLSBFirstsLoopPure!0 (_1!9786 lt!335932) nBits!348 i!590 lt!335917))))

(assert (=> d!72207 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9786 lt!335932) nBits!348 i!590 lt!335917) lt!337074)))

(declare-fun bs!17710 () Bool)

(assert (= bs!17710 d!72207))

(assert (=> bs!17710 m!328333))

(assert (=> bs!17710 m!328341))

(declare-fun m!329119 () Bool)

(assert (=> bs!17710 m!329119))

(declare-fun m!329121 () Bool)

(assert (=> bs!17710 m!329121))

(assert (=> bs!17710 m!328363))

(assert (=> b!213122 d!72207))

(declare-fun d!72209 () Bool)

(declare-fun lt!337077 () tuple2!18276)

(assert (=> d!72209 (= lt!337077 (readNBitsLSBFirstsLoop!0 lt!335940 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335925))))

(assert (=> d!72209 (= (readNBitsLSBFirstsLoopPure!0 lt!335940 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335925) (tuple2!18265 (_2!9793 lt!337077) (_1!9793 lt!337077)))))

(declare-fun bs!17711 () Bool)

(assert (= bs!17711 d!72209))

(declare-fun m!329123 () Bool)

(assert (=> bs!17711 m!329123))

(assert (=> b!213122 d!72209))

(declare-fun d!72211 () Bool)

(declare-fun e!145416 () Bool)

(assert (=> d!72211 e!145416))

(declare-fun res!179423 () Bool)

(assert (=> d!72211 (=> (not res!179423) (not e!145416))))

(declare-fun lt!337079 () (_ BitVec 64))

(declare-fun lt!337078 () BitStream!8372)

(assert (=> d!72211 (= res!179423 (= (bvadd lt!337079 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4632 (buf!5161 lt!337078)) (currentByte!9727 lt!337078) (currentBit!9722 lt!337078))))))

(assert (=> d!72211 (or (not (= (bvand lt!337079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337079 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72211 (= lt!337079 (bitIndex!0 (size!4632 (buf!5161 (_1!9786 lt!335932))) (currentByte!9727 (_1!9786 lt!335932)) (currentBit!9722 (_1!9786 lt!335932))))))

(assert (=> d!72211 (= lt!337078 (_2!9784 (moveBitIndex!0 (_1!9786 lt!335932) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!72211 (moveBitIndexPrecond!0 (_1!9786 lt!335932) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72211 (= (withMovedBitIndex!0 (_1!9786 lt!335932) #b0000000000000000000000000000000000000000000000000000000000000001) lt!337078)))

(declare-fun b!213504 () Bool)

(assert (=> b!213504 (= e!145416 (= (size!4632 (buf!5161 (_1!9786 lt!335932))) (size!4632 (buf!5161 lt!337078))))))

(assert (= (and d!72211 res!179423) b!213504))

(declare-fun m!329125 () Bool)

(assert (=> d!72211 m!329125))

(declare-fun m!329127 () Bool)

(assert (=> d!72211 m!329127))

(declare-fun m!329129 () Bool)

(assert (=> d!72211 m!329129))

(declare-fun m!329131 () Bool)

(assert (=> d!72211 m!329131))

(assert (=> b!213122 d!72211))

(push 1)

(assert (not b!213481))

(assert (not d!72211))

(assert (not b!213388))

(assert (not d!72209))

(assert (not b!213380))

(assert (not b!213392))

(assert (not d!72191))

(assert (not d!72163))

(assert (not b!213471))

(assert (not d!72189))

(assert (not b!213378))

(assert (not d!72171))

(assert (not b!213387))

(assert (not bm!3348))

(assert (not d!72061))

(assert (not b!213479))

(assert (not d!72125))

(assert (not b!213480))

(assert (not d!72165))

(assert (not d!72077))

(assert (not b!213214))

(assert (not b!213472))

(assert (not d!72105))

(assert (not b!213377))

(assert (not d!72181))

(assert (not b!213400))

(assert (not b!213490))

(assert (not b!213216))

(assert (not b!213470))

(assert (not b!213384))

(assert (not b!213389))

(assert (not d!72103))

(assert (not d!72201))

(assert (not b!213246))

(assert (not d!72207))

(assert (not d!72117))

(assert (not d!72183))

(assert (not b!213386))

(assert (not b!213382))

(assert (not d!72115))

(assert (not b!213501))

(assert (not d!72203))

(assert (not b!213500))

(assert (not d!72175))

(assert (not b!213502))

(assert (not b!213468))

(assert (not d!72075))

(assert (not b!213477))

(assert (not b!213398))

(assert (not d!72071))

(assert (not d!72179))

(assert (not d!72197))

(assert (not b!213248))

(assert (not d!72167))

(assert (not d!72205))

(assert (not d!72199))

(assert (not d!72059))

(assert (not b!213503))

(assert (not d!72185))

(assert (not d!72169))

(assert (not d!72109))

(assert (not d!72177))

(check-sat)

(pop 1)

(push 1)

(check-sat)

