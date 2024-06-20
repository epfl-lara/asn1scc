; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10004 () Bool)

(assert start!10004)

(declare-fun b!50302 () Bool)

(declare-fun res!42089 () Bool)

(declare-fun e!33208 () Bool)

(assert (=> b!50302 (=> res!42089 e!33208)))

(declare-datatypes ((array!2326 0))(
  ( (array!2327 (arr!1586 (Array (_ BitVec 32) (_ BitVec 8))) (size!1057 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1828 0))(
  ( (BitStream!1829 (buf!1412 array!2326) (currentByte!2935 (_ BitVec 32)) (currentBit!2930 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3489 0))(
  ( (Unit!3490) )
))
(declare-datatypes ((tuple2!4644 0))(
  ( (tuple2!4645 (_1!2427 Unit!3489) (_2!2427 BitStream!1828)) )
))
(declare-fun lt!78102 () tuple2!4644)

(declare-fun lt!78100 () tuple2!4644)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50302 (= res!42089 (not (invariant!0 (currentBit!2930 (_2!2427 lt!78102)) (currentByte!2935 (_2!2427 lt!78102)) (size!1057 (buf!1412 (_2!2427 lt!78100))))))))

(declare-fun b!50303 () Bool)

(declare-fun e!33206 () Bool)

(assert (=> b!50303 (= e!33206 e!33208)))

(declare-fun res!42085 () Bool)

(assert (=> b!50303 (=> res!42085 e!33208)))

(assert (=> b!50303 (= res!42085 (not (= (size!1057 (buf!1412 (_2!2427 lt!78102))) (size!1057 (buf!1412 (_2!2427 lt!78100))))))))

(declare-fun e!33210 () Bool)

(assert (=> b!50303 e!33210))

(declare-fun res!42082 () Bool)

(assert (=> b!50303 (=> (not res!42082) (not e!33210))))

(declare-fun thiss!1379 () BitStream!1828)

(assert (=> b!50303 (= res!42082 (= (size!1057 (buf!1412 (_2!2427 lt!78100))) (size!1057 (buf!1412 thiss!1379))))))

(declare-fun b!50304 () Bool)

(declare-fun e!33213 () Bool)

(declare-fun e!33207 () Bool)

(assert (=> b!50304 (= e!33213 e!33207)))

(declare-fun res!42087 () Bool)

(assert (=> b!50304 (=> res!42087 e!33207)))

(declare-fun isPrefixOf!0 (BitStream!1828 BitStream!1828) Bool)

(assert (=> b!50304 (= res!42087 (not (isPrefixOf!0 thiss!1379 (_2!2427 lt!78102))))))

(declare-fun lt!78092 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50304 (validate_offset_bits!1 ((_ sign_extend 32) (size!1057 (buf!1412 (_2!2427 lt!78102)))) ((_ sign_extend 32) (currentByte!2935 (_2!2427 lt!78102))) ((_ sign_extend 32) (currentBit!2930 (_2!2427 lt!78102))) lt!78092)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!50304 (= lt!78092 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78098 () Unit!3489)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1828 BitStream!1828 (_ BitVec 64) (_ BitVec 64)) Unit!3489)

(assert (=> b!50304 (= lt!78098 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2427 lt!78102) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2326)

(declare-fun appendBitFromByte!0 (BitStream!1828 (_ BitVec 8) (_ BitVec 32)) tuple2!4644)

(assert (=> b!50304 (= lt!78102 (appendBitFromByte!0 thiss!1379 (select (arr!1586 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50305 () Bool)

(declare-fun e!33211 () Bool)

(declare-fun array_inv!967 (array!2326) Bool)

(assert (=> b!50305 (= e!33211 (array_inv!967 (buf!1412 thiss!1379)))))

(declare-fun b!50306 () Bool)

(declare-fun res!42093 () Bool)

(assert (=> b!50306 (=> res!42093 e!33206)))

(assert (=> b!50306 (= res!42093 (not (= (size!1057 (buf!1412 thiss!1379)) (size!1057 (buf!1412 (_2!2427 lt!78100))))))))

(declare-fun b!50307 () Bool)

(declare-fun e!33212 () Bool)

(assert (=> b!50307 (= e!33212 true)))

(declare-datatypes ((List!555 0))(
  ( (Nil!552) (Cons!551 (h!670 Bool) (t!1305 List!555)) )
))
(declare-fun lt!78097 () List!555)

(declare-fun lt!78096 () List!555)

(declare-fun tail!241 (List!555) List!555)

(assert (=> b!50307 (= lt!78097 (tail!241 lt!78096))))

(declare-datatypes ((tuple2!4646 0))(
  ( (tuple2!4647 (_1!2428 BitStream!1828) (_2!2428 BitStream!1828)) )
))
(declare-fun lt!78091 () tuple2!4646)

(declare-fun lt!78095 () Unit!3489)

(declare-fun lt!78088 () tuple2!4646)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1828 BitStream!1828 BitStream!1828 BitStream!1828 (_ BitVec 64) List!555) Unit!3489)

(assert (=> b!50307 (= lt!78095 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2427 lt!78100) (_2!2427 lt!78100) (_1!2428 lt!78091) (_1!2428 lt!78088) (bvsub to!314 i!635) lt!78096))))

(declare-fun b!50308 () Bool)

(declare-fun res!42092 () Bool)

(assert (=> b!50308 (=> res!42092 e!33206)))

(assert (=> b!50308 (= res!42092 (not (invariant!0 (currentBit!2930 (_2!2427 lt!78100)) (currentByte!2935 (_2!2427 lt!78100)) (size!1057 (buf!1412 (_2!2427 lt!78100))))))))

(declare-fun b!50309 () Bool)

(declare-fun e!33209 () Bool)

(assert (=> b!50309 (= e!33209 e!33206)))

(declare-fun res!42091 () Bool)

(assert (=> b!50309 (=> res!42091 e!33206)))

(declare-fun lt!78093 () (_ BitVec 64))

(declare-fun lt!78090 () (_ BitVec 64))

(assert (=> b!50309 (= res!42091 (not (= lt!78093 (bvsub (bvadd lt!78090 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50309 (= lt!78093 (bitIndex!0 (size!1057 (buf!1412 (_2!2427 lt!78100))) (currentByte!2935 (_2!2427 lt!78100)) (currentBit!2930 (_2!2427 lt!78100))))))

(declare-fun b!50310 () Bool)

(assert (=> b!50310 (= e!33207 e!33209)))

(declare-fun res!42088 () Bool)

(assert (=> b!50310 (=> res!42088 e!33209)))

(assert (=> b!50310 (= res!42088 (not (isPrefixOf!0 (_2!2427 lt!78102) (_2!2427 lt!78100))))))

(assert (=> b!50310 (isPrefixOf!0 thiss!1379 (_2!2427 lt!78100))))

(declare-fun lt!78087 () Unit!3489)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1828 BitStream!1828 BitStream!1828) Unit!3489)

(assert (=> b!50310 (= lt!78087 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2427 lt!78102) (_2!2427 lt!78100)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1828 array!2326 (_ BitVec 64) (_ BitVec 64)) tuple2!4644)

(assert (=> b!50310 (= lt!78100 (appendBitsMSBFirstLoop!0 (_2!2427 lt!78102) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33214 () Bool)

(assert (=> b!50310 e!33214))

(declare-fun res!42096 () Bool)

(assert (=> b!50310 (=> (not res!42096) (not e!33214))))

(assert (=> b!50310 (= res!42096 (validate_offset_bits!1 ((_ sign_extend 32) (size!1057 (buf!1412 (_2!2427 lt!78102)))) ((_ sign_extend 32) (currentByte!2935 thiss!1379)) ((_ sign_extend 32) (currentBit!2930 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78103 () Unit!3489)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1828 array!2326 (_ BitVec 64)) Unit!3489)

(assert (=> b!50310 (= lt!78103 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1412 (_2!2427 lt!78102)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78094 () tuple2!4646)

(declare-fun reader!0 (BitStream!1828 BitStream!1828) tuple2!4646)

(assert (=> b!50310 (= lt!78094 (reader!0 thiss!1379 (_2!2427 lt!78102)))))

(declare-fun b!50311 () Bool)

(declare-fun e!33205 () Bool)

(assert (=> b!50311 (= e!33205 (not e!33213))))

(declare-fun res!42090 () Bool)

(assert (=> b!50311 (=> res!42090 e!33213)))

(assert (=> b!50311 (= res!42090 (bvsge i!635 to!314))))

(assert (=> b!50311 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78089 () Unit!3489)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1828) Unit!3489)

(assert (=> b!50311 (= lt!78089 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50311 (= lt!78090 (bitIndex!0 (size!1057 (buf!1412 thiss!1379)) (currentByte!2935 thiss!1379) (currentBit!2930 thiss!1379)))))

(declare-fun b!50312 () Bool)

(declare-fun head!374 (List!555) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1828 array!2326 (_ BitVec 64) (_ BitVec 64)) List!555)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1828 BitStream!1828 (_ BitVec 64)) List!555)

(assert (=> b!50312 (= e!33214 (= (head!374 (byteArrayBitContentToList!0 (_2!2427 lt!78102) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!374 (bitStreamReadBitsIntoList!0 (_2!2427 lt!78102) (_1!2428 lt!78094) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50313 () Bool)

(declare-fun res!42094 () Bool)

(assert (=> b!50313 (=> res!42094 e!33212)))

(declare-fun length!250 (List!555) Int)

(assert (=> b!50313 (= res!42094 (<= (length!250 lt!78096) 0))))

(declare-fun res!42095 () Bool)

(assert (=> start!10004 (=> (not res!42095) (not e!33205))))

(assert (=> start!10004 (= res!42095 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1057 srcBuffer!2))))))))

(assert (=> start!10004 e!33205))

(assert (=> start!10004 true))

(assert (=> start!10004 (array_inv!967 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1828) Bool)

(assert (=> start!10004 (and (inv!12 thiss!1379) e!33211)))

(declare-fun b!50314 () Bool)

(declare-fun res!42084 () Bool)

(assert (=> b!50314 (=> res!42084 e!33208)))

(assert (=> b!50314 (= res!42084 (not (invariant!0 (currentBit!2930 (_2!2427 lt!78102)) (currentByte!2935 (_2!2427 lt!78102)) (size!1057 (buf!1412 (_2!2427 lt!78102))))))))

(declare-fun b!50315 () Bool)

(assert (=> b!50315 (= e!33208 e!33212)))

(declare-fun res!42086 () Bool)

(assert (=> b!50315 (=> res!42086 e!33212)))

(assert (=> b!50315 (= res!42086 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50315 (= lt!78097 (bitStreamReadBitsIntoList!0 (_2!2427 lt!78100) (_1!2428 lt!78088) lt!78092))))

(assert (=> b!50315 (= lt!78096 (bitStreamReadBitsIntoList!0 (_2!2427 lt!78100) (_1!2428 lt!78091) (bvsub to!314 i!635)))))

(assert (=> b!50315 (validate_offset_bits!1 ((_ sign_extend 32) (size!1057 (buf!1412 (_2!2427 lt!78100)))) ((_ sign_extend 32) (currentByte!2935 (_2!2427 lt!78102))) ((_ sign_extend 32) (currentBit!2930 (_2!2427 lt!78102))) lt!78092)))

(declare-fun lt!78101 () Unit!3489)

(assert (=> b!50315 (= lt!78101 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2427 lt!78102) (buf!1412 (_2!2427 lt!78100)) lt!78092))))

(assert (=> b!50315 (= lt!78088 (reader!0 (_2!2427 lt!78102) (_2!2427 lt!78100)))))

(assert (=> b!50315 (validate_offset_bits!1 ((_ sign_extend 32) (size!1057 (buf!1412 (_2!2427 lt!78100)))) ((_ sign_extend 32) (currentByte!2935 thiss!1379)) ((_ sign_extend 32) (currentBit!2930 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78099 () Unit!3489)

(assert (=> b!50315 (= lt!78099 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1412 (_2!2427 lt!78100)) (bvsub to!314 i!635)))))

(assert (=> b!50315 (= lt!78091 (reader!0 thiss!1379 (_2!2427 lt!78100)))))

(declare-fun b!50316 () Bool)

(declare-fun res!42083 () Bool)

(assert (=> b!50316 (=> (not res!42083) (not e!33205))))

(assert (=> b!50316 (= res!42083 (validate_offset_bits!1 ((_ sign_extend 32) (size!1057 (buf!1412 thiss!1379))) ((_ sign_extend 32) (currentByte!2935 thiss!1379)) ((_ sign_extend 32) (currentBit!2930 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50317 () Bool)

(assert (=> b!50317 (= e!33210 (= lt!78093 (bvsub (bvsub (bvadd (bitIndex!0 (size!1057 (buf!1412 (_2!2427 lt!78102))) (currentByte!2935 (_2!2427 lt!78102)) (currentBit!2930 (_2!2427 lt!78102))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!10004 res!42095) b!50316))

(assert (= (and b!50316 res!42083) b!50311))

(assert (= (and b!50311 (not res!42090)) b!50304))

(assert (= (and b!50304 (not res!42087)) b!50310))

(assert (= (and b!50310 res!42096) b!50312))

(assert (= (and b!50310 (not res!42088)) b!50309))

(assert (= (and b!50309 (not res!42091)) b!50308))

(assert (= (and b!50308 (not res!42092)) b!50306))

(assert (= (and b!50306 (not res!42093)) b!50303))

(assert (= (and b!50303 res!42082) b!50317))

(assert (= (and b!50303 (not res!42085)) b!50314))

(assert (= (and b!50314 (not res!42084)) b!50302))

(assert (= (and b!50302 (not res!42089)) b!50315))

(assert (= (and b!50315 (not res!42086)) b!50313))

(assert (= (and b!50313 (not res!42094)) b!50307))

(assert (= start!10004 b!50305))

(declare-fun m!79137 () Bool)

(assert (=> b!50313 m!79137))

(declare-fun m!79139 () Bool)

(assert (=> b!50314 m!79139))

(declare-fun m!79141 () Bool)

(assert (=> b!50315 m!79141))

(declare-fun m!79143 () Bool)

(assert (=> b!50315 m!79143))

(declare-fun m!79145 () Bool)

(assert (=> b!50315 m!79145))

(declare-fun m!79147 () Bool)

(assert (=> b!50315 m!79147))

(declare-fun m!79149 () Bool)

(assert (=> b!50315 m!79149))

(declare-fun m!79151 () Bool)

(assert (=> b!50315 m!79151))

(declare-fun m!79153 () Bool)

(assert (=> b!50315 m!79153))

(declare-fun m!79155 () Bool)

(assert (=> b!50315 m!79155))

(declare-fun m!79157 () Bool)

(assert (=> b!50308 m!79157))

(declare-fun m!79159 () Bool)

(assert (=> b!50317 m!79159))

(declare-fun m!79161 () Bool)

(assert (=> b!50302 m!79161))

(declare-fun m!79163 () Bool)

(assert (=> b!50316 m!79163))

(declare-fun m!79165 () Bool)

(assert (=> b!50312 m!79165))

(assert (=> b!50312 m!79165))

(declare-fun m!79167 () Bool)

(assert (=> b!50312 m!79167))

(declare-fun m!79169 () Bool)

(assert (=> b!50312 m!79169))

(assert (=> b!50312 m!79169))

(declare-fun m!79171 () Bool)

(assert (=> b!50312 m!79171))

(declare-fun m!79173 () Bool)

(assert (=> b!50311 m!79173))

(declare-fun m!79175 () Bool)

(assert (=> b!50311 m!79175))

(declare-fun m!79177 () Bool)

(assert (=> b!50311 m!79177))

(declare-fun m!79179 () Bool)

(assert (=> b!50307 m!79179))

(declare-fun m!79181 () Bool)

(assert (=> b!50307 m!79181))

(declare-fun m!79183 () Bool)

(assert (=> b!50310 m!79183))

(declare-fun m!79185 () Bool)

(assert (=> b!50310 m!79185))

(declare-fun m!79187 () Bool)

(assert (=> b!50310 m!79187))

(declare-fun m!79189 () Bool)

(assert (=> b!50310 m!79189))

(declare-fun m!79191 () Bool)

(assert (=> b!50310 m!79191))

(declare-fun m!79193 () Bool)

(assert (=> b!50310 m!79193))

(declare-fun m!79195 () Bool)

(assert (=> b!50310 m!79195))

(declare-fun m!79197 () Bool)

(assert (=> b!50305 m!79197))

(declare-fun m!79199 () Bool)

(assert (=> b!50304 m!79199))

(declare-fun m!79201 () Bool)

(assert (=> b!50304 m!79201))

(declare-fun m!79203 () Bool)

(assert (=> b!50304 m!79203))

(declare-fun m!79205 () Bool)

(assert (=> b!50304 m!79205))

(assert (=> b!50304 m!79199))

(declare-fun m!79207 () Bool)

(assert (=> b!50304 m!79207))

(declare-fun m!79209 () Bool)

(assert (=> b!50309 m!79209))

(declare-fun m!79211 () Bool)

(assert (=> start!10004 m!79211))

(declare-fun m!79213 () Bool)

(assert (=> start!10004 m!79213))

(push 1)

