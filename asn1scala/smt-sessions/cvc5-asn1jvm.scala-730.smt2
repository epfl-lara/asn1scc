; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20356 () Bool)

(assert start!20356)

(declare-fun b!102390 () Bool)

(declare-fun e!67000 () Bool)

(declare-datatypes ((array!4800 0))(
  ( (array!4801 (arr!2784 (Array (_ BitVec 32) (_ BitVec 8))) (size!2191 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3856 0))(
  ( (BitStream!3857 (buf!2551 array!4800) (currentByte!5024 (_ BitVec 32)) (currentBit!5019 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3856)

(declare-fun array_inv!1993 (array!4800) Bool)

(assert (=> b!102390 (= e!67000 (array_inv!1993 (buf!2551 thiss!1305)))))

(declare-fun b!102391 () Bool)

(declare-fun res!84191 () Bool)

(declare-fun e!66995 () Bool)

(assert (=> b!102391 (=> (not res!84191) (not e!66995))))

(declare-datatypes ((Unit!6278 0))(
  ( (Unit!6279) )
))
(declare-datatypes ((tuple2!8350 0))(
  ( (tuple2!8351 (_1!4430 Unit!6278) (_2!4430 BitStream!3856)) )
))
(declare-fun lt!148943 () tuple2!8350)

(declare-fun isPrefixOf!0 (BitStream!3856 BitStream!3856) Bool)

(assert (=> b!102391 (= res!84191 (isPrefixOf!0 thiss!1305 (_2!4430 lt!148943)))))

(declare-fun b!102392 () Bool)

(declare-fun res!84194 () Bool)

(declare-fun e!66998 () Bool)

(assert (=> b!102392 (=> (not res!84194) (not e!66998))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102392 (= res!84194 (invariant!0 (currentBit!5019 thiss!1305) (currentByte!5024 thiss!1305) (size!2191 (buf!2551 (_2!4430 lt!148943)))))))

(declare-fun b!102393 () Bool)

(declare-fun e!66997 () Bool)

(assert (=> b!102393 (= e!66997 (not true))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!8352 0))(
  ( (tuple2!8353 (_1!4431 BitStream!3856) (_2!4431 (_ BitVec 64))) )
))
(declare-fun lt!148942 () tuple2!8352)

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8354 0))(
  ( (tuple2!8355 (_1!4432 BitStream!3856) (_2!4432 BitStream!3856)) )
))
(declare-fun lt!148948 () tuple2!8354)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8352)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102393 (= lt!148942 (readNLeastSignificantBitsLoopPure!0 (_1!4432 lt!148948) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!148933 () tuple2!8350)

(declare-fun lt!148937 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102393 (validate_offset_bits!1 ((_ sign_extend 32) (size!2191 (buf!2551 (_2!4430 lt!148933)))) ((_ sign_extend 32) (currentByte!5024 thiss!1305)) ((_ sign_extend 32) (currentBit!5019 thiss!1305)) lt!148937)))

(declare-fun lt!148947 () Unit!6278)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3856 array!4800 (_ BitVec 64)) Unit!6278)

(assert (=> b!102393 (= lt!148947 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2551 (_2!4430 lt!148933)) lt!148937))))

(declare-fun lt!148940 () Bool)

(declare-datatypes ((tuple2!8356 0))(
  ( (tuple2!8357 (_1!4433 BitStream!3856) (_2!4433 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3856) tuple2!8356)

(assert (=> b!102393 (= (_2!4433 (readBitPure!0 (_1!4432 lt!148948))) lt!148940)))

(declare-fun lt!148945 () tuple2!8354)

(declare-fun reader!0 (BitStream!3856 BitStream!3856) tuple2!8354)

(assert (=> b!102393 (= lt!148945 (reader!0 (_2!4430 lt!148943) (_2!4430 lt!148933)))))

(assert (=> b!102393 (= lt!148948 (reader!0 thiss!1305 (_2!4430 lt!148933)))))

(declare-fun e!66999 () Bool)

(assert (=> b!102393 e!66999))

(declare-fun res!84192 () Bool)

(assert (=> b!102393 (=> (not res!84192) (not e!66999))))

(declare-fun lt!148934 () tuple2!8356)

(declare-fun lt!148938 () tuple2!8356)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102393 (= res!84192 (= (bitIndex!0 (size!2191 (buf!2551 (_1!4433 lt!148934))) (currentByte!5024 (_1!4433 lt!148934)) (currentBit!5019 (_1!4433 lt!148934))) (bitIndex!0 (size!2191 (buf!2551 (_1!4433 lt!148938))) (currentByte!5024 (_1!4433 lt!148938)) (currentBit!5019 (_1!4433 lt!148938)))))))

(declare-fun lt!148939 () Unit!6278)

(declare-fun lt!148936 () BitStream!3856)

(declare-fun readBitPrefixLemma!0 (BitStream!3856 BitStream!3856) Unit!6278)

(assert (=> b!102393 (= lt!148939 (readBitPrefixLemma!0 lt!148936 (_2!4430 lt!148933)))))

(assert (=> b!102393 (= lt!148938 (readBitPure!0 (BitStream!3857 (buf!2551 (_2!4430 lt!148933)) (currentByte!5024 thiss!1305) (currentBit!5019 thiss!1305))))))

(assert (=> b!102393 (= lt!148934 (readBitPure!0 lt!148936))))

(assert (=> b!102393 (= lt!148936 (BitStream!3857 (buf!2551 (_2!4430 lt!148943)) (currentByte!5024 thiss!1305) (currentBit!5019 thiss!1305)))))

(assert (=> b!102393 e!66998))

(declare-fun res!84195 () Bool)

(assert (=> b!102393 (=> (not res!84195) (not e!66998))))

(assert (=> b!102393 (= res!84195 (isPrefixOf!0 thiss!1305 (_2!4430 lt!148933)))))

(declare-fun lt!148944 () Unit!6278)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3856 BitStream!3856 BitStream!3856) Unit!6278)

(assert (=> b!102393 (= lt!148944 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4430 lt!148943) (_2!4430 lt!148933)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3856 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8350)

(assert (=> b!102393 (= lt!148933 (appendNLeastSignificantBitsLoop!0 (_2!4430 lt!148943) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66996 () Bool)

(assert (=> b!102393 e!66996))

(declare-fun res!84193 () Bool)

(assert (=> b!102393 (=> (not res!84193) (not e!66996))))

(assert (=> b!102393 (= res!84193 (= (size!2191 (buf!2551 thiss!1305)) (size!2191 (buf!2551 (_2!4430 lt!148943)))))))

(declare-fun appendBit!0 (BitStream!3856 Bool) tuple2!8350)

(assert (=> b!102393 (= lt!148943 (appendBit!0 thiss!1305 lt!148940))))

(assert (=> b!102393 (= lt!148940 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102394 () Bool)

(declare-fun res!84197 () Bool)

(assert (=> b!102394 (=> (not res!84197) (not e!66997))))

(assert (=> b!102394 (= res!84197 (bvslt i!615 nBits!396))))

(declare-fun b!102395 () Bool)

(assert (=> b!102395 (= e!66996 e!66995)))

(declare-fun res!84190 () Bool)

(assert (=> b!102395 (=> (not res!84190) (not e!66995))))

(declare-fun lt!148946 () (_ BitVec 64))

(declare-fun lt!148941 () (_ BitVec 64))

(assert (=> b!102395 (= res!84190 (= lt!148946 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148941)))))

(assert (=> b!102395 (= lt!148946 (bitIndex!0 (size!2191 (buf!2551 (_2!4430 lt!148943))) (currentByte!5024 (_2!4430 lt!148943)) (currentBit!5019 (_2!4430 lt!148943))))))

(assert (=> b!102395 (= lt!148941 (bitIndex!0 (size!2191 (buf!2551 thiss!1305)) (currentByte!5024 thiss!1305) (currentBit!5019 thiss!1305)))))

(declare-fun b!102396 () Bool)

(declare-fun e!66994 () Bool)

(assert (=> b!102396 (= e!66994 e!66997)))

(declare-fun res!84188 () Bool)

(assert (=> b!102396 (=> (not res!84188) (not e!66997))))

(assert (=> b!102396 (= res!84188 (validate_offset_bits!1 ((_ sign_extend 32) (size!2191 (buf!2551 thiss!1305))) ((_ sign_extend 32) (currentByte!5024 thiss!1305)) ((_ sign_extend 32) (currentBit!5019 thiss!1305)) lt!148937))))

(assert (=> b!102396 (= lt!148937 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!84189 () Bool)

(assert (=> start!20356 (=> (not res!84189) (not e!66994))))

(assert (=> start!20356 (= res!84189 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20356 e!66994))

(assert (=> start!20356 true))

(declare-fun inv!12 (BitStream!3856) Bool)

(assert (=> start!20356 (and (inv!12 thiss!1305) e!67000)))

(declare-fun b!102397 () Bool)

(declare-fun e!67001 () Bool)

(declare-fun lt!148935 () tuple2!8356)

(assert (=> b!102397 (= e!67001 (= (bitIndex!0 (size!2191 (buf!2551 (_1!4433 lt!148935))) (currentByte!5024 (_1!4433 lt!148935)) (currentBit!5019 (_1!4433 lt!148935))) lt!148946))))

(declare-fun b!102398 () Bool)

(assert (=> b!102398 (= e!66999 (= (_2!4433 lt!148934) (_2!4433 lt!148938)))))

(declare-fun b!102399 () Bool)

(assert (=> b!102399 (= e!66995 e!67001)))

(declare-fun res!84196 () Bool)

(assert (=> b!102399 (=> (not res!84196) (not e!67001))))

(assert (=> b!102399 (= res!84196 (and (= (_2!4433 lt!148935) lt!148940) (= (_1!4433 lt!148935) (_2!4430 lt!148943))))))

(declare-fun readerFrom!0 (BitStream!3856 (_ BitVec 32) (_ BitVec 32)) BitStream!3856)

(assert (=> b!102399 (= lt!148935 (readBitPure!0 (readerFrom!0 (_2!4430 lt!148943) (currentBit!5019 thiss!1305) (currentByte!5024 thiss!1305))))))

(declare-fun b!102400 () Bool)

(declare-fun res!84187 () Bool)

(assert (=> b!102400 (=> (not res!84187) (not e!66997))))

(assert (=> b!102400 (= res!84187 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102401 () Bool)

(assert (=> b!102401 (= e!66998 (invariant!0 (currentBit!5019 thiss!1305) (currentByte!5024 thiss!1305) (size!2191 (buf!2551 (_2!4430 lt!148933)))))))

(assert (= (and start!20356 res!84189) b!102396))

(assert (= (and b!102396 res!84188) b!102400))

(assert (= (and b!102400 res!84187) b!102394))

(assert (= (and b!102394 res!84197) b!102393))

(assert (= (and b!102393 res!84193) b!102395))

(assert (= (and b!102395 res!84190) b!102391))

(assert (= (and b!102391 res!84191) b!102399))

(assert (= (and b!102399 res!84196) b!102397))

(assert (= (and b!102393 res!84195) b!102392))

(assert (= (and b!102392 res!84194) b!102401))

(assert (= (and b!102393 res!84192) b!102398))

(assert (= start!20356 b!102390))

(declare-fun m!149107 () Bool)

(assert (=> b!102399 m!149107))

(assert (=> b!102399 m!149107))

(declare-fun m!149109 () Bool)

(assert (=> b!102399 m!149109))

(declare-fun m!149111 () Bool)

(assert (=> b!102397 m!149111))

(declare-fun m!149113 () Bool)

(assert (=> start!20356 m!149113))

(declare-fun m!149115 () Bool)

(assert (=> b!102392 m!149115))

(declare-fun m!149117 () Bool)

(assert (=> b!102393 m!149117))

(declare-fun m!149119 () Bool)

(assert (=> b!102393 m!149119))

(declare-fun m!149121 () Bool)

(assert (=> b!102393 m!149121))

(declare-fun m!149123 () Bool)

(assert (=> b!102393 m!149123))

(declare-fun m!149125 () Bool)

(assert (=> b!102393 m!149125))

(declare-fun m!149127 () Bool)

(assert (=> b!102393 m!149127))

(declare-fun m!149129 () Bool)

(assert (=> b!102393 m!149129))

(declare-fun m!149131 () Bool)

(assert (=> b!102393 m!149131))

(declare-fun m!149133 () Bool)

(assert (=> b!102393 m!149133))

(declare-fun m!149135 () Bool)

(assert (=> b!102393 m!149135))

(declare-fun m!149137 () Bool)

(assert (=> b!102393 m!149137))

(declare-fun m!149139 () Bool)

(assert (=> b!102393 m!149139))

(declare-fun m!149141 () Bool)

(assert (=> b!102393 m!149141))

(declare-fun m!149143 () Bool)

(assert (=> b!102393 m!149143))

(declare-fun m!149145 () Bool)

(assert (=> b!102393 m!149145))

(declare-fun m!149147 () Bool)

(assert (=> b!102393 m!149147))

(declare-fun m!149149 () Bool)

(assert (=> b!102390 m!149149))

(declare-fun m!149151 () Bool)

(assert (=> b!102400 m!149151))

(declare-fun m!149153 () Bool)

(assert (=> b!102396 m!149153))

(declare-fun m!149155 () Bool)

(assert (=> b!102391 m!149155))

(declare-fun m!149157 () Bool)

(assert (=> b!102401 m!149157))

(declare-fun m!149159 () Bool)

(assert (=> b!102395 m!149159))

(declare-fun m!149161 () Bool)

(assert (=> b!102395 m!149161))

(push 1)

(assert (not b!102399))

(assert (not b!102390))

(assert (not b!102396))

(assert (not b!102395))

(assert (not b!102392))

(assert (not b!102393))

(assert (not b!102400))

(assert (not start!20356))

(assert (not b!102391))

(assert (not b!102397))

(assert (not b!102401))

(check-sat)

