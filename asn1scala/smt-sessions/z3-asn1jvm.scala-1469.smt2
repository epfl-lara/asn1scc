; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40342 () Bool)

(assert start!40342)

(declare-fun b!185157 () Bool)

(declare-fun res!154088 () Bool)

(declare-fun e!128209 () Bool)

(assert (=> b!185157 (=> (not res!154088) (not e!128209))))

(declare-datatypes ((array!9799 0))(
  ( (array!9800 (arr!5252 (Array (_ BitVec 32) (_ BitVec 8))) (size!4322 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7752 0))(
  ( (BitStream!7753 (buf!4780 array!9799) (currentByte!9020 (_ BitVec 32)) (currentBit!9015 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7752)

(declare-datatypes ((Unit!13258 0))(
  ( (Unit!13259) )
))
(declare-datatypes ((tuple2!16024 0))(
  ( (tuple2!16025 (_1!8657 Unit!13258) (_2!8657 BitStream!7752)) )
))
(declare-fun lt!285228 () tuple2!16024)

(declare-fun isPrefixOf!0 (BitStream!7752 BitStream!7752) Bool)

(assert (=> b!185157 (= res!154088 (isPrefixOf!0 thiss!1204 (_2!8657 lt!285228)))))

(declare-fun b!185158 () Bool)

(declare-fun e!128219 () Bool)

(declare-fun e!128218 () Bool)

(assert (=> b!185158 (= e!128219 e!128218)))

(declare-fun res!154098 () Bool)

(assert (=> b!185158 (=> res!154098 e!128218)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!285233 () (_ BitVec 64))

(declare-fun lt!285229 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!185158 (= res!154098 (not (= lt!285229 (bvsub (bvsub (bvadd lt!285233 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!285238 () tuple2!16024)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185158 (= lt!285229 (bitIndex!0 (size!4322 (buf!4780 (_2!8657 lt!285238))) (currentByte!9020 (_2!8657 lt!285238)) (currentBit!9015 (_2!8657 lt!285238))))))

(assert (=> b!185158 (isPrefixOf!0 thiss!1204 (_2!8657 lt!285238))))

(declare-fun lt!285234 () Unit!13258)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7752 BitStream!7752 BitStream!7752) Unit!13258)

(assert (=> b!185158 (= lt!285234 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8657 lt!285228) (_2!8657 lt!285238)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7752 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16024)

(assert (=> b!185158 (= lt!285238 (appendBitsLSBFirstLoopTR!0 (_2!8657 lt!285228) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185159 () Bool)

(declare-fun lt!285232 () (_ BitVec 64))

(declare-fun e!128210 () Bool)

(declare-datatypes ((tuple2!16026 0))(
  ( (tuple2!16027 (_1!8658 BitStream!7752) (_2!8658 BitStream!7752)) )
))
(declare-fun lt!285239 () tuple2!16026)

(declare-fun withMovedBitIndex!0 (BitStream!7752 (_ BitVec 64)) BitStream!7752)

(assert (=> b!185159 (= e!128210 (= (_1!8658 lt!285239) (withMovedBitIndex!0 (_2!8658 lt!285239) (bvsub lt!285232 lt!285229))))))

(declare-fun b!185161 () Bool)

(declare-fun res!154086 () Bool)

(assert (=> b!185161 (=> res!154086 e!128218)))

(assert (=> b!185161 (= res!154086 (not (isPrefixOf!0 (_2!8657 lt!285228) (_2!8657 lt!285238))))))

(declare-fun b!185162 () Bool)

(declare-fun res!154099 () Bool)

(assert (=> b!185162 (=> res!154099 e!128218)))

(assert (=> b!185162 (= res!154099 (or (not (= (size!4322 (buf!4780 (_2!8657 lt!285238))) (size!4322 (buf!4780 thiss!1204)))) (not (= lt!285229 (bvsub (bvadd lt!285232 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185163 () Bool)

(declare-fun e!128217 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185163 (= e!128217 (invariant!0 (currentBit!9015 thiss!1204) (currentByte!9020 thiss!1204) (size!4322 (buf!4780 (_2!8657 lt!285238)))))))

(declare-fun b!185164 () Bool)

(declare-fun e!128215 () Bool)

(declare-fun array_inv!4063 (array!9799) Bool)

(assert (=> b!185164 (= e!128215 (array_inv!4063 (buf!4780 thiss!1204)))))

(declare-fun b!185165 () Bool)

(declare-fun e!128216 () Bool)

(assert (=> b!185165 (= e!128218 e!128216)))

(declare-fun res!154095 () Bool)

(assert (=> b!185165 (=> res!154095 e!128216)))

(declare-fun lt!285250 () (_ BitVec 64))

(declare-fun lt!285251 () tuple2!16026)

(declare-datatypes ((tuple2!16028 0))(
  ( (tuple2!16029 (_1!8659 BitStream!7752) (_2!8659 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16028)

(assert (=> b!185165 (= res!154095 (not (= (_1!8659 (readNBitsLSBFirstsLoopPure!0 (_1!8658 lt!285251) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285250)) (_2!8658 lt!285251))))))

(declare-fun lt!285241 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185165 (validate_offset_bits!1 ((_ sign_extend 32) (size!4322 (buf!4780 (_2!8657 lt!285238)))) ((_ sign_extend 32) (currentByte!9020 (_2!8657 lt!285228))) ((_ sign_extend 32) (currentBit!9015 (_2!8657 lt!285228))) lt!285241)))

(declare-fun lt!285230 () Unit!13258)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7752 array!9799 (_ BitVec 64)) Unit!13258)

(assert (=> b!185165 (= lt!285230 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8657 lt!285228) (buf!4780 (_2!8657 lt!285238)) lt!285241))))

(assert (=> b!185165 (= lt!285241 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16030 0))(
  ( (tuple2!16031 (_1!8660 BitStream!7752) (_2!8660 Bool)) )
))
(declare-fun lt!285249 () tuple2!16030)

(declare-fun lt!285245 () (_ BitVec 64))

(declare-fun lt!285242 () (_ BitVec 64))

(assert (=> b!185165 (= lt!285250 (bvor lt!285242 (ite (_2!8660 lt!285249) lt!285245 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!285240 () tuple2!16028)

(assert (=> b!185165 (= lt!285240 (readNBitsLSBFirstsLoopPure!0 (_1!8658 lt!285239) nBits!348 i!590 lt!285242))))

(declare-fun lt!285248 () (_ BitVec 64))

(assert (=> b!185165 (validate_offset_bits!1 ((_ sign_extend 32) (size!4322 (buf!4780 (_2!8657 lt!285238)))) ((_ sign_extend 32) (currentByte!9020 thiss!1204)) ((_ sign_extend 32) (currentBit!9015 thiss!1204)) lt!285248)))

(declare-fun lt!285244 () Unit!13258)

(assert (=> b!185165 (= lt!285244 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4780 (_2!8657 lt!285238)) lt!285248))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185165 (= lt!285242 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!285247 () Bool)

(assert (=> b!185165 (= (_2!8660 lt!285249) lt!285247)))

(declare-fun readBitPure!0 (BitStream!7752) tuple2!16030)

(assert (=> b!185165 (= lt!285249 (readBitPure!0 (_1!8658 lt!285239)))))

(declare-fun reader!0 (BitStream!7752 BitStream!7752) tuple2!16026)

(assert (=> b!185165 (= lt!285251 (reader!0 (_2!8657 lt!285228) (_2!8657 lt!285238)))))

(assert (=> b!185165 (= lt!285239 (reader!0 thiss!1204 (_2!8657 lt!285238)))))

(declare-fun e!128221 () Bool)

(assert (=> b!185165 e!128221))

(declare-fun res!154101 () Bool)

(assert (=> b!185165 (=> (not res!154101) (not e!128221))))

(declare-fun lt!285237 () tuple2!16030)

(declare-fun lt!285253 () tuple2!16030)

(assert (=> b!185165 (= res!154101 (= (bitIndex!0 (size!4322 (buf!4780 (_1!8660 lt!285237))) (currentByte!9020 (_1!8660 lt!285237)) (currentBit!9015 (_1!8660 lt!285237))) (bitIndex!0 (size!4322 (buf!4780 (_1!8660 lt!285253))) (currentByte!9020 (_1!8660 lt!285253)) (currentBit!9015 (_1!8660 lt!285253)))))))

(declare-fun lt!285246 () Unit!13258)

(declare-fun lt!285236 () BitStream!7752)

(declare-fun readBitPrefixLemma!0 (BitStream!7752 BitStream!7752) Unit!13258)

(assert (=> b!185165 (= lt!285246 (readBitPrefixLemma!0 lt!285236 (_2!8657 lt!285238)))))

(assert (=> b!185165 (= lt!285253 (readBitPure!0 (BitStream!7753 (buf!4780 (_2!8657 lt!285238)) (currentByte!9020 thiss!1204) (currentBit!9015 thiss!1204))))))

(assert (=> b!185165 (= lt!285237 (readBitPure!0 lt!285236))))

(assert (=> b!185165 e!128217))

(declare-fun res!154085 () Bool)

(assert (=> b!185165 (=> (not res!154085) (not e!128217))))

(assert (=> b!185165 (= res!154085 (invariant!0 (currentBit!9015 thiss!1204) (currentByte!9020 thiss!1204) (size!4322 (buf!4780 (_2!8657 lt!285228)))))))

(assert (=> b!185165 (= lt!285236 (BitStream!7753 (buf!4780 (_2!8657 lt!285228)) (currentByte!9020 thiss!1204) (currentBit!9015 thiss!1204)))))

(declare-fun b!185166 () Bool)

(declare-fun res!154084 () Bool)

(declare-fun e!128211 () Bool)

(assert (=> b!185166 (=> (not res!154084) (not e!128211))))

(assert (=> b!185166 (= res!154084 (not (= i!590 nBits!348)))))

(declare-fun b!185167 () Bool)

(declare-fun e!128212 () Bool)

(assert (=> b!185167 (= e!128209 e!128212)))

(declare-fun res!154087 () Bool)

(assert (=> b!185167 (=> (not res!154087) (not e!128212))))

(declare-fun lt!285235 () tuple2!16030)

(assert (=> b!185167 (= res!154087 (and (= (_2!8660 lt!285235) lt!285247) (= (_1!8660 lt!285235) (_2!8657 lt!285228))))))

(declare-fun readerFrom!0 (BitStream!7752 (_ BitVec 32) (_ BitVec 32)) BitStream!7752)

(assert (=> b!185167 (= lt!285235 (readBitPure!0 (readerFrom!0 (_2!8657 lt!285228) (currentBit!9015 thiss!1204) (currentByte!9020 thiss!1204))))))

(declare-fun b!185168 () Bool)

(declare-fun res!154091 () Bool)

(assert (=> b!185168 (=> (not res!154091) (not e!128211))))

(assert (=> b!185168 (= res!154091 (invariant!0 (currentBit!9015 thiss!1204) (currentByte!9020 thiss!1204) (size!4322 (buf!4780 thiss!1204))))))

(declare-fun b!185169 () Bool)

(declare-fun lt!285252 () (_ BitVec 64))

(assert (=> b!185169 (= e!128212 (= (bitIndex!0 (size!4322 (buf!4780 (_1!8660 lt!285235))) (currentByte!9020 (_1!8660 lt!285235)) (currentBit!9015 (_1!8660 lt!285235))) lt!285252))))

(declare-fun b!185170 () Bool)

(declare-fun e!128220 () Bool)

(assert (=> b!185170 (= e!128220 e!128209)))

(declare-fun res!154092 () Bool)

(assert (=> b!185170 (=> (not res!154092) (not e!128209))))

(declare-fun lt!285254 () (_ BitVec 64))

(assert (=> b!185170 (= res!154092 (= lt!285252 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!285254)))))

(assert (=> b!185170 (= lt!285252 (bitIndex!0 (size!4322 (buf!4780 (_2!8657 lt!285228))) (currentByte!9020 (_2!8657 lt!285228)) (currentBit!9015 (_2!8657 lt!285228))))))

(assert (=> b!185170 (= lt!285254 (bitIndex!0 (size!4322 (buf!4780 thiss!1204)) (currentByte!9020 thiss!1204) (currentBit!9015 thiss!1204)))))

(declare-fun b!185171 () Bool)

(assert (=> b!185171 (= e!128211 (not e!128219))))

(declare-fun res!154096 () Bool)

(assert (=> b!185171 (=> res!154096 e!128219)))

(assert (=> b!185171 (= res!154096 (not (= lt!285233 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!285232))))))

(assert (=> b!185171 (= lt!285233 (bitIndex!0 (size!4322 (buf!4780 (_2!8657 lt!285228))) (currentByte!9020 (_2!8657 lt!285228)) (currentBit!9015 (_2!8657 lt!285228))))))

(assert (=> b!185171 (= lt!285232 (bitIndex!0 (size!4322 (buf!4780 thiss!1204)) (currentByte!9020 thiss!1204) (currentBit!9015 thiss!1204)))))

(assert (=> b!185171 e!128220))

(declare-fun res!154100 () Bool)

(assert (=> b!185171 (=> (not res!154100) (not e!128220))))

(assert (=> b!185171 (= res!154100 (= (size!4322 (buf!4780 thiss!1204)) (size!4322 (buf!4780 (_2!8657 lt!285228)))))))

(declare-fun appendBit!0 (BitStream!7752 Bool) tuple2!16024)

(assert (=> b!185171 (= lt!285228 (appendBit!0 thiss!1204 lt!285247))))

(assert (=> b!185171 (= lt!285247 (not (= (bvand v!189 lt!285245) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185171 (= lt!285245 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185172 () Bool)

(declare-fun res!154094 () Bool)

(assert (=> b!185172 (=> res!154094 e!128218)))

(assert (=> b!185172 (= res!154094 (not (invariant!0 (currentBit!9015 (_2!8657 lt!285238)) (currentByte!9020 (_2!8657 lt!285238)) (size!4322 (buf!4780 (_2!8657 lt!285238))))))))

(declare-fun b!185173 () Bool)

(declare-fun res!154093 () Bool)

(assert (=> b!185173 (=> res!154093 e!128218)))

(assert (=> b!185173 (= res!154093 (not (isPrefixOf!0 thiss!1204 (_2!8657 lt!285228))))))

(declare-fun b!185160 () Bool)

(assert (=> b!185160 (= e!128221 (= (_2!8660 lt!285237) (_2!8660 lt!285253)))))

(declare-fun res!154097 () Bool)

(declare-fun e!128214 () Bool)

(assert (=> start!40342 (=> (not res!154097) (not e!128214))))

(assert (=> start!40342 (= res!154097 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40342 e!128214))

(assert (=> start!40342 true))

(declare-fun inv!12 (BitStream!7752) Bool)

(assert (=> start!40342 (and (inv!12 thiss!1204) e!128215)))

(declare-fun b!185174 () Bool)

(assert (=> b!185174 (= e!128216 (invariant!0 (currentBit!9015 (_2!8657 lt!285228)) (currentByte!9020 (_2!8657 lt!285228)) (size!4322 (buf!4780 (_2!8657 lt!285228)))))))

(assert (=> b!185174 e!128210))

(declare-fun res!154090 () Bool)

(assert (=> b!185174 (=> (not res!154090) (not e!128210))))

(declare-fun lt!285243 () tuple2!16028)

(assert (=> b!185174 (= res!154090 (and (= (_2!8659 lt!285240) (_2!8659 lt!285243)) (= (_1!8659 lt!285240) (_1!8659 lt!285243))))))

(declare-fun lt!285231 () Unit!13258)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13258)

(assert (=> b!185174 (= lt!285231 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8658 lt!285239) nBits!348 i!590 lt!285242))))

(assert (=> b!185174 (= lt!285243 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8658 lt!285239) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285250))))

(declare-fun b!185175 () Bool)

(assert (=> b!185175 (= e!128214 e!128211)))

(declare-fun res!154089 () Bool)

(assert (=> b!185175 (=> (not res!154089) (not e!128211))))

(assert (=> b!185175 (= res!154089 (validate_offset_bits!1 ((_ sign_extend 32) (size!4322 (buf!4780 thiss!1204))) ((_ sign_extend 32) (currentByte!9020 thiss!1204)) ((_ sign_extend 32) (currentBit!9015 thiss!1204)) lt!285248))))

(assert (=> b!185175 (= lt!285248 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!40342 res!154097) b!185175))

(assert (= (and b!185175 res!154089) b!185168))

(assert (= (and b!185168 res!154091) b!185166))

(assert (= (and b!185166 res!154084) b!185171))

(assert (= (and b!185171 res!154100) b!185170))

(assert (= (and b!185170 res!154092) b!185157))

(assert (= (and b!185157 res!154088) b!185167))

(assert (= (and b!185167 res!154087) b!185169))

(assert (= (and b!185171 (not res!154096)) b!185158))

(assert (= (and b!185158 (not res!154098)) b!185172))

(assert (= (and b!185172 (not res!154094)) b!185162))

(assert (= (and b!185162 (not res!154099)) b!185161))

(assert (= (and b!185161 (not res!154086)) b!185173))

(assert (= (and b!185173 (not res!154093)) b!185165))

(assert (= (and b!185165 res!154085) b!185163))

(assert (= (and b!185165 res!154101) b!185160))

(assert (= (and b!185165 (not res!154095)) b!185174))

(assert (= (and b!185174 res!154090) b!185159))

(assert (= start!40342 b!185164))

(declare-fun m!287743 () Bool)

(assert (=> b!185157 m!287743))

(declare-fun m!287745 () Bool)

(assert (=> b!185175 m!287745))

(declare-fun m!287747 () Bool)

(assert (=> b!185165 m!287747))

(declare-fun m!287749 () Bool)

(assert (=> b!185165 m!287749))

(declare-fun m!287751 () Bool)

(assert (=> b!185165 m!287751))

(declare-fun m!287753 () Bool)

(assert (=> b!185165 m!287753))

(declare-fun m!287755 () Bool)

(assert (=> b!185165 m!287755))

(declare-fun m!287757 () Bool)

(assert (=> b!185165 m!287757))

(declare-fun m!287759 () Bool)

(assert (=> b!185165 m!287759))

(declare-fun m!287761 () Bool)

(assert (=> b!185165 m!287761))

(declare-fun m!287763 () Bool)

(assert (=> b!185165 m!287763))

(declare-fun m!287765 () Bool)

(assert (=> b!185165 m!287765))

(declare-fun m!287767 () Bool)

(assert (=> b!185165 m!287767))

(declare-fun m!287769 () Bool)

(assert (=> b!185165 m!287769))

(declare-fun m!287771 () Bool)

(assert (=> b!185165 m!287771))

(declare-fun m!287773 () Bool)

(assert (=> b!185165 m!287773))

(declare-fun m!287775 () Bool)

(assert (=> b!185165 m!287775))

(declare-fun m!287777 () Bool)

(assert (=> b!185165 m!287777))

(declare-fun m!287779 () Bool)

(assert (=> start!40342 m!287779))

(declare-fun m!287781 () Bool)

(assert (=> b!185163 m!287781))

(declare-fun m!287783 () Bool)

(assert (=> b!185158 m!287783))

(declare-fun m!287785 () Bool)

(assert (=> b!185158 m!287785))

(declare-fun m!287787 () Bool)

(assert (=> b!185158 m!287787))

(declare-fun m!287789 () Bool)

(assert (=> b!185158 m!287789))

(declare-fun m!287791 () Bool)

(assert (=> b!185172 m!287791))

(declare-fun m!287793 () Bool)

(assert (=> b!185159 m!287793))

(declare-fun m!287795 () Bool)

(assert (=> b!185161 m!287795))

(assert (=> b!185173 m!287743))

(declare-fun m!287797 () Bool)

(assert (=> b!185168 m!287797))

(declare-fun m!287799 () Bool)

(assert (=> b!185169 m!287799))

(declare-fun m!287801 () Bool)

(assert (=> b!185174 m!287801))

(declare-fun m!287803 () Bool)

(assert (=> b!185174 m!287803))

(declare-fun m!287805 () Bool)

(assert (=> b!185174 m!287805))

(assert (=> b!185174 m!287805))

(declare-fun m!287807 () Bool)

(assert (=> b!185174 m!287807))

(declare-fun m!287809 () Bool)

(assert (=> b!185167 m!287809))

(assert (=> b!185167 m!287809))

(declare-fun m!287811 () Bool)

(assert (=> b!185167 m!287811))

(declare-fun m!287813 () Bool)

(assert (=> b!185164 m!287813))

(declare-fun m!287815 () Bool)

(assert (=> b!185170 m!287815))

(declare-fun m!287817 () Bool)

(assert (=> b!185170 m!287817))

(assert (=> b!185171 m!287815))

(assert (=> b!185171 m!287817))

(declare-fun m!287819 () Bool)

(assert (=> b!185171 m!287819))

(check-sat (not b!185170) (not b!185168) (not b!185167) (not b!185157) (not start!40342) (not b!185169) (not b!185173) (not b!185171) (not b!185161) (not b!185165) (not b!185159) (not b!185158) (not b!185174) (not b!185163) (not b!185175) (not b!185172) (not b!185164))
(check-sat)
