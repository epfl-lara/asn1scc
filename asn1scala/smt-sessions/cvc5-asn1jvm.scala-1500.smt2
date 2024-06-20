; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41552 () Bool)

(assert start!41552)

(declare-fun b!195101 () Bool)

(declare-fun e!134158 () Bool)

(declare-fun e!134170 () Bool)

(assert (=> b!195101 (= e!134158 e!134170)))

(declare-fun res!163181 () Bool)

(assert (=> b!195101 (=> res!163181 e!134170)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!303607 () (_ BitVec 64))

(declare-fun lt!303608 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195101 (= res!163181 (not (= lt!303608 (bvsub (bvsub (bvadd lt!303607 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!10010 0))(
  ( (array!10011 (arr!5344 (Array (_ BitVec 32) (_ BitVec 8))) (size!4414 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7936 0))(
  ( (BitStream!7937 (buf!4900 array!10010) (currentByte!9196 (_ BitVec 32)) (currentBit!9191 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13783 0))(
  ( (Unit!13784) )
))
(declare-datatypes ((tuple2!16868 0))(
  ( (tuple2!16869 (_1!9079 Unit!13783) (_2!9079 BitStream!7936)) )
))
(declare-fun lt!303592 () tuple2!16868)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195101 (= lt!303608 (bitIndex!0 (size!4414 (buf!4900 (_2!9079 lt!303592))) (currentByte!9196 (_2!9079 lt!303592)) (currentBit!9191 (_2!9079 lt!303592))))))

(declare-fun thiss!1204 () BitStream!7936)

(declare-fun isPrefixOf!0 (BitStream!7936 BitStream!7936) Bool)

(assert (=> b!195101 (isPrefixOf!0 thiss!1204 (_2!9079 lt!303592))))

(declare-fun lt!303601 () tuple2!16868)

(declare-fun lt!303600 () Unit!13783)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7936 BitStream!7936 BitStream!7936) Unit!13783)

(assert (=> b!195101 (= lt!303600 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9079 lt!303601) (_2!9079 lt!303592)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7936 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16868)

(assert (=> b!195101 (= lt!303592 (appendBitsLSBFirstLoopTR!0 (_2!9079 lt!303601) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!195102 () Bool)

(declare-fun res!163202 () Bool)

(declare-fun e!134168 () Bool)

(assert (=> b!195102 (=> (not res!163202) (not e!134168))))

(declare-fun lt!303615 () (_ BitVec 64))

(declare-datatypes ((tuple2!16870 0))(
  ( (tuple2!16871 (_1!9080 BitStream!7936) (_2!9080 BitStream!7936)) )
))
(declare-fun lt!303591 () tuple2!16870)

(declare-fun withMovedBitIndex!0 (BitStream!7936 (_ BitVec 64)) BitStream!7936)

(assert (=> b!195102 (= res!163202 (= (_1!9080 lt!303591) (withMovedBitIndex!0 (_2!9080 lt!303591) (bvsub lt!303615 lt!303608))))))

(declare-fun b!195103 () Bool)

(declare-fun e!134157 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195103 (= e!134157 (invariant!0 (currentBit!9191 thiss!1204) (currentByte!9196 thiss!1204) (size!4414 (buf!4900 (_2!9079 lt!303592)))))))

(declare-fun b!195104 () Bool)

(declare-fun res!163201 () Bool)

(assert (=> b!195104 (=> res!163201 e!134170)))

(assert (=> b!195104 (= res!163201 (not (isPrefixOf!0 thiss!1204 (_2!9079 lt!303601))))))

(declare-fun b!195105 () Bool)

(declare-fun res!163185 () Bool)

(assert (=> b!195105 (=> (not res!163185) (not e!134168))))

(declare-fun lt!303606 () tuple2!16870)

(assert (=> b!195105 (= res!163185 (= (_1!9080 lt!303606) (withMovedBitIndex!0 (_2!9080 lt!303606) (bvsub lt!303607 lt!303608))))))

(declare-fun b!195106 () Bool)

(declare-fun e!134163 () Bool)

(declare-fun e!134159 () Bool)

(assert (=> b!195106 (= e!134163 e!134159)))

(declare-fun res!163198 () Bool)

(assert (=> b!195106 (=> (not res!163198) (not e!134159))))

(declare-fun lt!303612 () Bool)

(declare-datatypes ((tuple2!16872 0))(
  ( (tuple2!16873 (_1!9081 BitStream!7936) (_2!9081 Bool)) )
))
(declare-fun lt!303610 () tuple2!16872)

(assert (=> b!195106 (= res!163198 (and (= (_2!9081 lt!303610) lt!303612) (= (_1!9081 lt!303610) (_2!9079 lt!303601))))))

(declare-fun readBitPure!0 (BitStream!7936) tuple2!16872)

(declare-fun readerFrom!0 (BitStream!7936 (_ BitVec 32) (_ BitVec 32)) BitStream!7936)

(assert (=> b!195106 (= lt!303610 (readBitPure!0 (readerFrom!0 (_2!9079 lt!303601) (currentBit!9191 thiss!1204) (currentByte!9196 thiss!1204))))))

(declare-fun b!195107 () Bool)

(declare-fun e!134169 () Bool)

(declare-fun e!134165 () Bool)

(assert (=> b!195107 (= e!134169 e!134165)))

(declare-fun res!163189 () Bool)

(assert (=> b!195107 (=> res!163189 e!134165)))

(declare-fun lt!303597 () BitStream!7936)

(assert (=> b!195107 (= res!163189 (not (= (_1!9080 lt!303606) lt!303597)))))

(assert (=> b!195107 e!134168))

(declare-fun res!163187 () Bool)

(assert (=> b!195107 (=> (not res!163187) (not e!134168))))

(declare-datatypes ((tuple2!16874 0))(
  ( (tuple2!16875 (_1!9082 BitStream!7936) (_2!9082 (_ BitVec 64))) )
))
(declare-fun lt!303602 () tuple2!16874)

(declare-fun lt!303603 () tuple2!16874)

(assert (=> b!195107 (= res!163187 (and (= (_2!9082 lt!303602) (_2!9082 lt!303603)) (= (_1!9082 lt!303602) (_1!9082 lt!303603))))))

(declare-fun lt!303596 () Unit!13783)

(declare-fun lt!303613 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13783)

(assert (=> b!195107 (= lt!303596 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9080 lt!303591) nBits!348 i!590 lt!303613))))

(declare-fun lt!303609 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16874)

(assert (=> b!195107 (= lt!303603 (readNBitsLSBFirstsLoopPure!0 lt!303597 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!303609))))

(assert (=> b!195107 (= lt!303597 (withMovedBitIndex!0 (_1!9080 lt!303591) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!163184 () Bool)

(declare-fun e!134167 () Bool)

(assert (=> start!41552 (=> (not res!163184) (not e!134167))))

(assert (=> start!41552 (= res!163184 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41552 e!134167))

(assert (=> start!41552 true))

(declare-fun e!134161 () Bool)

(declare-fun inv!12 (BitStream!7936) Bool)

(assert (=> start!41552 (and (inv!12 thiss!1204) e!134161)))

(declare-fun b!195108 () Bool)

(declare-fun e!134164 () Bool)

(assert (=> b!195108 (= e!134164 (not e!134158))))

(declare-fun res!163188 () Bool)

(assert (=> b!195108 (=> res!163188 e!134158)))

(assert (=> b!195108 (= res!163188 (not (= lt!303607 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303615))))))

(assert (=> b!195108 (= lt!303607 (bitIndex!0 (size!4414 (buf!4900 (_2!9079 lt!303601))) (currentByte!9196 (_2!9079 lt!303601)) (currentBit!9191 (_2!9079 lt!303601))))))

(assert (=> b!195108 (= lt!303615 (bitIndex!0 (size!4414 (buf!4900 thiss!1204)) (currentByte!9196 thiss!1204) (currentBit!9191 thiss!1204)))))

(declare-fun e!134162 () Bool)

(assert (=> b!195108 e!134162))

(declare-fun res!163195 () Bool)

(assert (=> b!195108 (=> (not res!163195) (not e!134162))))

(assert (=> b!195108 (= res!163195 (= (size!4414 (buf!4900 thiss!1204)) (size!4414 (buf!4900 (_2!9079 lt!303601)))))))

(declare-fun appendBit!0 (BitStream!7936 Bool) tuple2!16868)

(assert (=> b!195108 (= lt!303601 (appendBit!0 thiss!1204 lt!303612))))

(declare-fun lt!303599 () (_ BitVec 64))

(assert (=> b!195108 (= lt!303612 (not (= (bvand v!189 lt!303599) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195108 (= lt!303599 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!195109 () Bool)

(declare-fun res!163193 () Bool)

(assert (=> b!195109 (=> (not res!163193) (not e!134164))))

(assert (=> b!195109 (= res!163193 (invariant!0 (currentBit!9191 thiss!1204) (currentByte!9196 thiss!1204) (size!4414 (buf!4900 thiss!1204))))))

(declare-fun b!195110 () Bool)

(declare-fun res!163191 () Bool)

(declare-fun e!134166 () Bool)

(assert (=> b!195110 (=> (not res!163191) (not e!134166))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195110 (= res!163191 (= (_2!9082 lt!303602) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!195111 () Bool)

(declare-fun lt!303611 () (_ BitVec 64))

(assert (=> b!195111 (= e!134159 (= (bitIndex!0 (size!4414 (buf!4900 (_1!9081 lt!303610))) (currentByte!9196 (_1!9081 lt!303610)) (currentBit!9191 (_1!9081 lt!303610))) lt!303611))))

(declare-fun b!195112 () Bool)

(declare-fun res!163192 () Bool)

(assert (=> b!195112 (=> (not res!163192) (not e!134164))))

(assert (=> b!195112 (= res!163192 (not (= i!590 nBits!348)))))

(declare-fun b!195113 () Bool)

(declare-fun res!163183 () Bool)

(assert (=> b!195113 (=> res!163183 e!134170)))

(assert (=> b!195113 (= res!163183 (not (isPrefixOf!0 (_2!9079 lt!303601) (_2!9079 lt!303592))))))

(declare-fun b!195114 () Bool)

(declare-fun lt!303598 () tuple2!16874)

(assert (=> b!195114 (= e!134168 (and (= lt!303615 (bvsub lt!303607 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9080 lt!303606) lt!303597)) (= (_2!9082 lt!303602) (_2!9082 lt!303598)))))))

(declare-fun b!195115 () Bool)

(declare-fun array_inv!4155 (array!10010) Bool)

(assert (=> b!195115 (= e!134161 (array_inv!4155 (buf!4900 thiss!1204)))))

(declare-fun b!195116 () Bool)

(declare-fun res!163199 () Bool)

(assert (=> b!195116 (=> res!163199 e!134170)))

(assert (=> b!195116 (= res!163199 (not (invariant!0 (currentBit!9191 (_2!9079 lt!303592)) (currentByte!9196 (_2!9079 lt!303592)) (size!4414 (buf!4900 (_2!9079 lt!303592))))))))

(declare-fun b!195117 () Bool)

(assert (=> b!195117 (= e!134165 true)))

(assert (=> b!195117 e!134166))

(declare-fun res!163200 () Bool)

(assert (=> b!195117 (=> (not res!163200) (not e!134166))))

(assert (=> b!195117 (= res!163200 (= (size!4414 (buf!4900 thiss!1204)) (size!4414 (buf!4900 (_2!9079 lt!303592)))))))

(declare-fun b!195118 () Bool)

(assert (=> b!195118 (= e!134166 (= (_1!9082 lt!303602) (_2!9080 lt!303591)))))

(declare-fun b!195119 () Bool)

(assert (=> b!195119 (= e!134170 e!134169)))

(declare-fun res!163186 () Bool)

(assert (=> b!195119 (=> res!163186 e!134169)))

(assert (=> b!195119 (= res!163186 (not (= (_1!9082 lt!303598) (_2!9080 lt!303606))))))

(assert (=> b!195119 (= lt!303598 (readNBitsLSBFirstsLoopPure!0 (_1!9080 lt!303606) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!303609))))

(declare-fun lt!303595 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195119 (validate_offset_bits!1 ((_ sign_extend 32) (size!4414 (buf!4900 (_2!9079 lt!303592)))) ((_ sign_extend 32) (currentByte!9196 (_2!9079 lt!303601))) ((_ sign_extend 32) (currentBit!9191 (_2!9079 lt!303601))) lt!303595)))

(declare-fun lt!303605 () Unit!13783)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7936 array!10010 (_ BitVec 64)) Unit!13783)

(assert (=> b!195119 (= lt!303605 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9079 lt!303601) (buf!4900 (_2!9079 lt!303592)) lt!303595))))

(assert (=> b!195119 (= lt!303595 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!303614 () tuple2!16872)

(assert (=> b!195119 (= lt!303609 (bvor lt!303613 (ite (_2!9081 lt!303614) lt!303599 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195119 (= lt!303602 (readNBitsLSBFirstsLoopPure!0 (_1!9080 lt!303591) nBits!348 i!590 lt!303613))))

(declare-fun lt!303590 () (_ BitVec 64))

(assert (=> b!195119 (validate_offset_bits!1 ((_ sign_extend 32) (size!4414 (buf!4900 (_2!9079 lt!303592)))) ((_ sign_extend 32) (currentByte!9196 thiss!1204)) ((_ sign_extend 32) (currentBit!9191 thiss!1204)) lt!303590)))

(declare-fun lt!303589 () Unit!13783)

(assert (=> b!195119 (= lt!303589 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4900 (_2!9079 lt!303592)) lt!303590))))

(assert (=> b!195119 (= lt!303613 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!195119 (= (_2!9081 lt!303614) lt!303612)))

(assert (=> b!195119 (= lt!303614 (readBitPure!0 (_1!9080 lt!303591)))))

(declare-fun reader!0 (BitStream!7936 BitStream!7936) tuple2!16870)

(assert (=> b!195119 (= lt!303606 (reader!0 (_2!9079 lt!303601) (_2!9079 lt!303592)))))

(assert (=> b!195119 (= lt!303591 (reader!0 thiss!1204 (_2!9079 lt!303592)))))

(declare-fun e!134160 () Bool)

(assert (=> b!195119 e!134160))

(declare-fun res!163182 () Bool)

(assert (=> b!195119 (=> (not res!163182) (not e!134160))))

(declare-fun lt!303588 () tuple2!16872)

(declare-fun lt!303594 () tuple2!16872)

(assert (=> b!195119 (= res!163182 (= (bitIndex!0 (size!4414 (buf!4900 (_1!9081 lt!303588))) (currentByte!9196 (_1!9081 lt!303588)) (currentBit!9191 (_1!9081 lt!303588))) (bitIndex!0 (size!4414 (buf!4900 (_1!9081 lt!303594))) (currentByte!9196 (_1!9081 lt!303594)) (currentBit!9191 (_1!9081 lt!303594)))))))

(declare-fun lt!303616 () Unit!13783)

(declare-fun lt!303604 () BitStream!7936)

(declare-fun readBitPrefixLemma!0 (BitStream!7936 BitStream!7936) Unit!13783)

(assert (=> b!195119 (= lt!303616 (readBitPrefixLemma!0 lt!303604 (_2!9079 lt!303592)))))

(assert (=> b!195119 (= lt!303594 (readBitPure!0 (BitStream!7937 (buf!4900 (_2!9079 lt!303592)) (currentByte!9196 thiss!1204) (currentBit!9191 thiss!1204))))))

(assert (=> b!195119 (= lt!303588 (readBitPure!0 lt!303604))))

(assert (=> b!195119 e!134157))

(declare-fun res!163197 () Bool)

(assert (=> b!195119 (=> (not res!163197) (not e!134157))))

(assert (=> b!195119 (= res!163197 (invariant!0 (currentBit!9191 thiss!1204) (currentByte!9196 thiss!1204) (size!4414 (buf!4900 (_2!9079 lt!303601)))))))

(assert (=> b!195119 (= lt!303604 (BitStream!7937 (buf!4900 (_2!9079 lt!303601)) (currentByte!9196 thiss!1204) (currentBit!9191 thiss!1204)))))

(declare-fun b!195120 () Bool)

(declare-fun res!163180 () Bool)

(assert (=> b!195120 (=> res!163180 e!134165)))

(assert (=> b!195120 (= res!163180 (not (= (bitIndex!0 (size!4414 (buf!4900 (_1!9082 lt!303602))) (currentByte!9196 (_1!9082 lt!303602)) (currentBit!9191 (_1!9082 lt!303602))) (bitIndex!0 (size!4414 (buf!4900 (_2!9080 lt!303591))) (currentByte!9196 (_2!9080 lt!303591)) (currentBit!9191 (_2!9080 lt!303591))))))))

(declare-fun b!195121 () Bool)

(assert (=> b!195121 (= e!134167 e!134164)))

(declare-fun res!163196 () Bool)

(assert (=> b!195121 (=> (not res!163196) (not e!134164))))

(assert (=> b!195121 (= res!163196 (validate_offset_bits!1 ((_ sign_extend 32) (size!4414 (buf!4900 thiss!1204))) ((_ sign_extend 32) (currentByte!9196 thiss!1204)) ((_ sign_extend 32) (currentBit!9191 thiss!1204)) lt!303590))))

(assert (=> b!195121 (= lt!303590 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!195122 () Bool)

(declare-fun res!163203 () Bool)

(assert (=> b!195122 (=> (not res!163203) (not e!134163))))

(assert (=> b!195122 (= res!163203 (isPrefixOf!0 thiss!1204 (_2!9079 lt!303601)))))

(declare-fun b!195123 () Bool)

(assert (=> b!195123 (= e!134162 e!134163)))

(declare-fun res!163190 () Bool)

(assert (=> b!195123 (=> (not res!163190) (not e!134163))))

(declare-fun lt!303593 () (_ BitVec 64))

(assert (=> b!195123 (= res!163190 (= lt!303611 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303593)))))

(assert (=> b!195123 (= lt!303611 (bitIndex!0 (size!4414 (buf!4900 (_2!9079 lt!303601))) (currentByte!9196 (_2!9079 lt!303601)) (currentBit!9191 (_2!9079 lt!303601))))))

(assert (=> b!195123 (= lt!303593 (bitIndex!0 (size!4414 (buf!4900 thiss!1204)) (currentByte!9196 thiss!1204) (currentBit!9191 thiss!1204)))))

(declare-fun b!195124 () Bool)

(declare-fun res!163194 () Bool)

(assert (=> b!195124 (=> res!163194 e!134170)))

(assert (=> b!195124 (= res!163194 (or (not (= (size!4414 (buf!4900 (_2!9079 lt!303592))) (size!4414 (buf!4900 thiss!1204)))) (not (= lt!303608 (bvsub (bvadd lt!303615 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!195125 () Bool)

(assert (=> b!195125 (= e!134160 (= (_2!9081 lt!303588) (_2!9081 lt!303594)))))

(assert (= (and start!41552 res!163184) b!195121))

(assert (= (and b!195121 res!163196) b!195109))

(assert (= (and b!195109 res!163193) b!195112))

(assert (= (and b!195112 res!163192) b!195108))

(assert (= (and b!195108 res!163195) b!195123))

(assert (= (and b!195123 res!163190) b!195122))

(assert (= (and b!195122 res!163203) b!195106))

(assert (= (and b!195106 res!163198) b!195111))

(assert (= (and b!195108 (not res!163188)) b!195101))

(assert (= (and b!195101 (not res!163181)) b!195116))

(assert (= (and b!195116 (not res!163199)) b!195124))

(assert (= (and b!195124 (not res!163194)) b!195113))

(assert (= (and b!195113 (not res!163183)) b!195104))

(assert (= (and b!195104 (not res!163201)) b!195119))

(assert (= (and b!195119 res!163197) b!195103))

(assert (= (and b!195119 res!163182) b!195125))

(assert (= (and b!195119 (not res!163186)) b!195107))

(assert (= (and b!195107 res!163187) b!195102))

(assert (= (and b!195102 res!163202) b!195105))

(assert (= (and b!195105 res!163185) b!195114))

(assert (= (and b!195107 (not res!163189)) b!195120))

(assert (= (and b!195120 (not res!163180)) b!195117))

(assert (= (and b!195117 res!163200) b!195110))

(assert (= (and b!195110 res!163191) b!195118))

(assert (= start!41552 b!195115))

(declare-fun m!302273 () Bool)

(assert (=> b!195119 m!302273))

(declare-fun m!302275 () Bool)

(assert (=> b!195119 m!302275))

(declare-fun m!302277 () Bool)

(assert (=> b!195119 m!302277))

(declare-fun m!302279 () Bool)

(assert (=> b!195119 m!302279))

(declare-fun m!302281 () Bool)

(assert (=> b!195119 m!302281))

(declare-fun m!302283 () Bool)

(assert (=> b!195119 m!302283))

(declare-fun m!302285 () Bool)

(assert (=> b!195119 m!302285))

(declare-fun m!302287 () Bool)

(assert (=> b!195119 m!302287))

(declare-fun m!302289 () Bool)

(assert (=> b!195119 m!302289))

(declare-fun m!302291 () Bool)

(assert (=> b!195119 m!302291))

(declare-fun m!302293 () Bool)

(assert (=> b!195119 m!302293))

(declare-fun m!302295 () Bool)

(assert (=> b!195119 m!302295))

(declare-fun m!302297 () Bool)

(assert (=> b!195119 m!302297))

(declare-fun m!302299 () Bool)

(assert (=> b!195119 m!302299))

(declare-fun m!302301 () Bool)

(assert (=> b!195119 m!302301))

(declare-fun m!302303 () Bool)

(assert (=> b!195119 m!302303))

(declare-fun m!302305 () Bool)

(assert (=> start!41552 m!302305))

(declare-fun m!302307 () Bool)

(assert (=> b!195105 m!302307))

(declare-fun m!302309 () Bool)

(assert (=> b!195103 m!302309))

(declare-fun m!302311 () Bool)

(assert (=> b!195104 m!302311))

(declare-fun m!302313 () Bool)

(assert (=> b!195106 m!302313))

(assert (=> b!195106 m!302313))

(declare-fun m!302315 () Bool)

(assert (=> b!195106 m!302315))

(declare-fun m!302317 () Bool)

(assert (=> b!195113 m!302317))

(declare-fun m!302319 () Bool)

(assert (=> b!195123 m!302319))

(declare-fun m!302321 () Bool)

(assert (=> b!195123 m!302321))

(assert (=> b!195108 m!302319))

(assert (=> b!195108 m!302321))

(declare-fun m!302323 () Bool)

(assert (=> b!195108 m!302323))

(declare-fun m!302325 () Bool)

(assert (=> b!195115 m!302325))

(assert (=> b!195122 m!302311))

(declare-fun m!302327 () Bool)

(assert (=> b!195102 m!302327))

(declare-fun m!302329 () Bool)

(assert (=> b!195111 m!302329))

(declare-fun m!302331 () Bool)

(assert (=> b!195109 m!302331))

(declare-fun m!302333 () Bool)

(assert (=> b!195101 m!302333))

(declare-fun m!302335 () Bool)

(assert (=> b!195101 m!302335))

(declare-fun m!302337 () Bool)

(assert (=> b!195101 m!302337))

(declare-fun m!302339 () Bool)

(assert (=> b!195101 m!302339))

(declare-fun m!302341 () Bool)

(assert (=> b!195110 m!302341))

(declare-fun m!302343 () Bool)

(assert (=> b!195120 m!302343))

(declare-fun m!302345 () Bool)

(assert (=> b!195120 m!302345))

(declare-fun m!302347 () Bool)

(assert (=> b!195116 m!302347))

(declare-fun m!302349 () Bool)

(assert (=> b!195107 m!302349))

(declare-fun m!302351 () Bool)

(assert (=> b!195107 m!302351))

(declare-fun m!302353 () Bool)

(assert (=> b!195107 m!302353))

(declare-fun m!302355 () Bool)

(assert (=> b!195121 m!302355))

(push 1)

(assert (not b!195122))

(assert (not b!195101))

(assert (not b!195123))

(assert (not b!195107))

(assert (not b!195109))

(assert (not b!195119))

(assert (not b!195108))

(assert (not b!195116))

(assert (not start!41552))

(assert (not b!195103))

(assert (not b!195111))

(assert (not b!195120))

(assert (not b!195105))

(assert (not b!195115))

(assert (not b!195121))

(assert (not b!195102))

(assert (not b!195113))

(assert (not b!195110))

(assert (not b!195104))

(assert (not b!195106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

