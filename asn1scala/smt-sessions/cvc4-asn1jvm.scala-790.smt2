; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22962 () Bool)

(assert start!22962)

(declare-fun b!116054 () Bool)

(declare-fun e!76044 () Bool)

(declare-fun e!76043 () Bool)

(assert (=> b!116054 (= e!76044 e!76043)))

(declare-fun res!95926 () Bool)

(assert (=> b!116054 (=> (not res!95926) (not e!76043))))

(declare-fun lt!177434 () (_ BitVec 64))

(declare-fun lt!177428 () (_ BitVec 64))

(assert (=> b!116054 (= res!95926 (= lt!177434 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177428)))))

(declare-datatypes ((array!5226 0))(
  ( (array!5227 (arr!2963 (Array (_ BitVec 32) (_ BitVec 8))) (size!2370 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4214 0))(
  ( (BitStream!4215 (buf!2780 array!5226) (currentByte!5417 (_ BitVec 32)) (currentBit!5412 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7145 0))(
  ( (Unit!7146) )
))
(declare-datatypes ((tuple2!9568 0))(
  ( (tuple2!9569 (_1!5049 Unit!7145) (_2!5049 BitStream!4214)) )
))
(declare-fun lt!177422 () tuple2!9568)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116054 (= lt!177434 (bitIndex!0 (size!2370 (buf!2780 (_2!5049 lt!177422))) (currentByte!5417 (_2!5049 lt!177422)) (currentBit!5412 (_2!5049 lt!177422))))))

(declare-fun thiss!1305 () BitStream!4214)

(assert (=> b!116054 (= lt!177428 (bitIndex!0 (size!2370 (buf!2780 thiss!1305)) (currentByte!5417 thiss!1305) (currentBit!5412 thiss!1305)))))

(declare-fun b!116055 () Bool)

(declare-fun res!95928 () Bool)

(assert (=> b!116055 (=> (not res!95928) (not e!76043))))

(declare-fun isPrefixOf!0 (BitStream!4214 BitStream!4214) Bool)

(assert (=> b!116055 (= res!95928 (isPrefixOf!0 thiss!1305 (_2!5049 lt!177422)))))

(declare-fun res!95919 () Bool)

(declare-fun e!76037 () Bool)

(assert (=> start!22962 (=> (not res!95919) (not e!76037))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22962 (= res!95919 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22962 e!76037))

(assert (=> start!22962 true))

(declare-fun e!76039 () Bool)

(declare-fun inv!12 (BitStream!4214) Bool)

(assert (=> start!22962 (and (inv!12 thiss!1305) e!76039)))

(declare-fun b!116056 () Bool)

(declare-fun array_inv!2172 (array!5226) Bool)

(assert (=> b!116056 (= e!76039 (array_inv!2172 (buf!2780 thiss!1305)))))

(declare-fun b!116057 () Bool)

(declare-fun e!76042 () Bool)

(declare-datatypes ((tuple2!9570 0))(
  ( (tuple2!9571 (_1!5050 BitStream!4214) (_2!5050 Bool)) )
))
(declare-fun lt!177433 () tuple2!9570)

(declare-fun lt!177431 () tuple2!9570)

(assert (=> b!116057 (= e!76042 (= (_2!5050 lt!177433) (_2!5050 lt!177431)))))

(declare-fun b!116058 () Bool)

(declare-fun e!76038 () Bool)

(declare-fun lt!177427 () tuple2!9570)

(assert (=> b!116058 (= e!76038 (= (bitIndex!0 (size!2370 (buf!2780 (_1!5050 lt!177427))) (currentByte!5417 (_1!5050 lt!177427)) (currentBit!5412 (_1!5050 lt!177427))) lt!177434))))

(declare-fun b!116059 () Bool)

(declare-fun e!76040 () Bool)

(declare-fun lt!177430 () tuple2!9568)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116059 (= e!76040 (invariant!0 (currentBit!5412 thiss!1305) (currentByte!5417 thiss!1305) (size!2370 (buf!2780 (_2!5049 lt!177430)))))))

(declare-fun b!116060 () Bool)

(declare-fun res!95920 () Bool)

(declare-fun e!76041 () Bool)

(assert (=> b!116060 (=> (not res!95920) (not e!76041))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116060 (= res!95920 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116061 () Bool)

(declare-fun lt!177432 () (_ BitVec 64))

(assert (=> b!116061 (= e!76041 (not (or (not (= (size!2370 (buf!2780 thiss!1305)) (size!2370 (buf!2780 (_2!5049 lt!177430))))) (bvsge lt!177432 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9572 0))(
  ( (tuple2!9573 (_1!5051 BitStream!4214) (_2!5051 BitStream!4214)) )
))
(declare-fun lt!177435 () tuple2!9572)

(declare-fun lt!177423 () Bool)

(declare-fun readBitPure!0 (BitStream!4214) tuple2!9570)

(assert (=> b!116061 (= (_2!5050 (readBitPure!0 (_1!5051 lt!177435))) lt!177423)))

(declare-fun lt!177424 () tuple2!9572)

(declare-fun reader!0 (BitStream!4214 BitStream!4214) tuple2!9572)

(assert (=> b!116061 (= lt!177424 (reader!0 (_2!5049 lt!177422) (_2!5049 lt!177430)))))

(assert (=> b!116061 (= lt!177435 (reader!0 thiss!1305 (_2!5049 lt!177430)))))

(assert (=> b!116061 e!76042))

(declare-fun res!95918 () Bool)

(assert (=> b!116061 (=> (not res!95918) (not e!76042))))

(assert (=> b!116061 (= res!95918 (= (bitIndex!0 (size!2370 (buf!2780 (_1!5050 lt!177433))) (currentByte!5417 (_1!5050 lt!177433)) (currentBit!5412 (_1!5050 lt!177433))) (bitIndex!0 (size!2370 (buf!2780 (_1!5050 lt!177431))) (currentByte!5417 (_1!5050 lt!177431)) (currentBit!5412 (_1!5050 lt!177431)))))))

(declare-fun lt!177426 () Unit!7145)

(declare-fun lt!177429 () BitStream!4214)

(declare-fun readBitPrefixLemma!0 (BitStream!4214 BitStream!4214) Unit!7145)

(assert (=> b!116061 (= lt!177426 (readBitPrefixLemma!0 lt!177429 (_2!5049 lt!177430)))))

(assert (=> b!116061 (= lt!177431 (readBitPure!0 (BitStream!4215 (buf!2780 (_2!5049 lt!177430)) (currentByte!5417 thiss!1305) (currentBit!5412 thiss!1305))))))

(assert (=> b!116061 (= lt!177433 (readBitPure!0 lt!177429))))

(assert (=> b!116061 (= lt!177429 (BitStream!4215 (buf!2780 (_2!5049 lt!177422)) (currentByte!5417 thiss!1305) (currentBit!5412 thiss!1305)))))

(assert (=> b!116061 e!76040))

(declare-fun res!95927 () Bool)

(assert (=> b!116061 (=> (not res!95927) (not e!76040))))

(assert (=> b!116061 (= res!95927 (isPrefixOf!0 thiss!1305 (_2!5049 lt!177430)))))

(declare-fun lt!177425 () Unit!7145)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4214 BitStream!4214 BitStream!4214) Unit!7145)

(assert (=> b!116061 (= lt!177425 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5049 lt!177422) (_2!5049 lt!177430)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4214 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9568)

(assert (=> b!116061 (= lt!177430 (appendNLeastSignificantBitsLoop!0 (_2!5049 lt!177422) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116061 e!76044))

(declare-fun res!95923 () Bool)

(assert (=> b!116061 (=> (not res!95923) (not e!76044))))

(assert (=> b!116061 (= res!95923 (= (size!2370 (buf!2780 thiss!1305)) (size!2370 (buf!2780 (_2!5049 lt!177422)))))))

(declare-fun appendBit!0 (BitStream!4214 Bool) tuple2!9568)

(assert (=> b!116061 (= lt!177422 (appendBit!0 thiss!1305 lt!177423))))

(assert (=> b!116061 (= lt!177423 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116062 () Bool)

(assert (=> b!116062 (= e!76043 e!76038)))

(declare-fun res!95924 () Bool)

(assert (=> b!116062 (=> (not res!95924) (not e!76038))))

(assert (=> b!116062 (= res!95924 (and (= (_2!5050 lt!177427) lt!177423) (= (_1!5050 lt!177427) (_2!5049 lt!177422))))))

(declare-fun readerFrom!0 (BitStream!4214 (_ BitVec 32) (_ BitVec 32)) BitStream!4214)

(assert (=> b!116062 (= lt!177427 (readBitPure!0 (readerFrom!0 (_2!5049 lt!177422) (currentBit!5412 thiss!1305) (currentByte!5417 thiss!1305))))))

(declare-fun b!116063 () Bool)

(declare-fun res!95925 () Bool)

(assert (=> b!116063 (=> (not res!95925) (not e!76040))))

(assert (=> b!116063 (= res!95925 (invariant!0 (currentBit!5412 thiss!1305) (currentByte!5417 thiss!1305) (size!2370 (buf!2780 (_2!5049 lt!177422)))))))

(declare-fun b!116064 () Bool)

(declare-fun res!95921 () Bool)

(assert (=> b!116064 (=> (not res!95921) (not e!76041))))

(assert (=> b!116064 (= res!95921 (bvslt i!615 nBits!396))))

(declare-fun b!116065 () Bool)

(assert (=> b!116065 (= e!76037 e!76041)))

(declare-fun res!95922 () Bool)

(assert (=> b!116065 (=> (not res!95922) (not e!76041))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116065 (= res!95922 (validate_offset_bits!1 ((_ sign_extend 32) (size!2370 (buf!2780 thiss!1305))) ((_ sign_extend 32) (currentByte!5417 thiss!1305)) ((_ sign_extend 32) (currentBit!5412 thiss!1305)) lt!177432))))

(assert (=> b!116065 (= lt!177432 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!22962 res!95919) b!116065))

(assert (= (and b!116065 res!95922) b!116060))

(assert (= (and b!116060 res!95920) b!116064))

(assert (= (and b!116064 res!95921) b!116061))

(assert (= (and b!116061 res!95923) b!116054))

(assert (= (and b!116054 res!95926) b!116055))

(assert (= (and b!116055 res!95928) b!116062))

(assert (= (and b!116062 res!95924) b!116058))

(assert (= (and b!116061 res!95927) b!116063))

(assert (= (and b!116063 res!95925) b!116059))

(assert (= (and b!116061 res!95918) b!116057))

(assert (= start!22962 b!116056))

(declare-fun m!173795 () Bool)

(assert (=> b!116063 m!173795))

(declare-fun m!173797 () Bool)

(assert (=> b!116055 m!173797))

(declare-fun m!173799 () Bool)

(assert (=> b!116062 m!173799))

(assert (=> b!116062 m!173799))

(declare-fun m!173801 () Bool)

(assert (=> b!116062 m!173801))

(declare-fun m!173803 () Bool)

(assert (=> b!116065 m!173803))

(declare-fun m!173805 () Bool)

(assert (=> b!116058 m!173805))

(declare-fun m!173807 () Bool)

(assert (=> b!116060 m!173807))

(declare-fun m!173809 () Bool)

(assert (=> b!116061 m!173809))

(declare-fun m!173811 () Bool)

(assert (=> b!116061 m!173811))

(declare-fun m!173813 () Bool)

(assert (=> b!116061 m!173813))

(declare-fun m!173815 () Bool)

(assert (=> b!116061 m!173815))

(declare-fun m!173817 () Bool)

(assert (=> b!116061 m!173817))

(declare-fun m!173819 () Bool)

(assert (=> b!116061 m!173819))

(declare-fun m!173821 () Bool)

(assert (=> b!116061 m!173821))

(declare-fun m!173823 () Bool)

(assert (=> b!116061 m!173823))

(declare-fun m!173825 () Bool)

(assert (=> b!116061 m!173825))

(declare-fun m!173827 () Bool)

(assert (=> b!116061 m!173827))

(declare-fun m!173829 () Bool)

(assert (=> b!116061 m!173829))

(declare-fun m!173831 () Bool)

(assert (=> b!116061 m!173831))

(declare-fun m!173833 () Bool)

(assert (=> b!116054 m!173833))

(declare-fun m!173835 () Bool)

(assert (=> b!116054 m!173835))

(declare-fun m!173837 () Bool)

(assert (=> b!116056 m!173837))

(declare-fun m!173839 () Bool)

(assert (=> b!116059 m!173839))

(declare-fun m!173841 () Bool)

(assert (=> start!22962 m!173841))

(push 1)

(assert (not b!116065))

(assert (not b!116062))

(assert (not start!22962))

(assert (not b!116054))

(assert (not b!116063))

(assert (not b!116056))

(assert (not b!116060))

(assert (not b!116055))

(assert (not b!116058))

(assert (not b!116061))

(assert (not b!116059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

