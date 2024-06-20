; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22976 () Bool)

(assert start!22976)

(declare-fun b!116306 () Bool)

(declare-fun e!76223 () Bool)

(declare-fun e!76220 () Bool)

(assert (=> b!116306 (= e!76223 e!76220)))

(declare-fun res!96151 () Bool)

(assert (=> b!116306 (=> (not res!96151) (not e!76220))))

(declare-datatypes ((array!5240 0))(
  ( (array!5241 (arr!2970 (Array (_ BitVec 32) (_ BitVec 8))) (size!2377 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4228 0))(
  ( (BitStream!4229 (buf!2787 array!5240) (currentByte!5424 (_ BitVec 32)) (currentBit!5419 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4228)

(declare-fun lt!177756 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116306 (= res!96151 (validate_offset_bits!1 ((_ sign_extend 32) (size!2377 (buf!2787 thiss!1305))) ((_ sign_extend 32) (currentByte!5424 thiss!1305)) ((_ sign_extend 32) (currentBit!5419 thiss!1305)) lt!177756))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116306 (= lt!177756 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116307 () Bool)

(declare-datatypes ((tuple2!9616 0))(
  ( (tuple2!9617 (_1!5073 BitStream!4228) (_2!5073 Bool)) )
))
(declare-fun lt!177757 () tuple2!9616)

(declare-fun lt!177750 () (_ BitVec 32))

(assert (=> b!116307 (= e!76220 (not (or (not (_2!5073 lt!177757)) (let ((bdg!5751 (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (or (= bdg!5751 (bvand i!615 #b10000000000000000000000000000000)) (= bdg!5751 (bvand lt!177750 #b10000000000000000000000000000000)))))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9618 0))(
  ( (tuple2!9619 (_1!5074 BitStream!4228) (_2!5074 (_ BitVec 64))) )
))
(declare-fun lt!177744 () tuple2!9618)

(declare-datatypes ((tuple2!9620 0))(
  ( (tuple2!9621 (_1!5075 BitStream!4228) (_2!5075 BitStream!4228)) )
))
(declare-fun lt!177751 () tuple2!9620)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9618)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116307 (= lt!177744 (readNLeastSignificantBitsLoopPure!0 (_1!5075 lt!177751) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-datatypes ((Unit!7159 0))(
  ( (Unit!7160) )
))
(declare-datatypes ((tuple2!9622 0))(
  ( (tuple2!9623 (_1!5076 Unit!7159) (_2!5076 BitStream!4228)) )
))
(declare-fun lt!177746 () tuple2!9622)

(assert (=> b!116307 (validate_offset_bits!1 ((_ sign_extend 32) (size!2377 (buf!2787 (_2!5076 lt!177746)))) ((_ sign_extend 32) (currentByte!5424 thiss!1305)) ((_ sign_extend 32) (currentBit!5419 thiss!1305)) lt!177756)))

(declare-fun lt!177749 () Unit!7159)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4228 array!5240 (_ BitVec 64)) Unit!7159)

(assert (=> b!116307 (= lt!177749 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2787 (_2!5076 lt!177746)) lt!177756))))

(declare-fun lt!177748 () Bool)

(assert (=> b!116307 (= (_2!5073 lt!177757) lt!177748)))

(declare-fun readBitPure!0 (BitStream!4228) tuple2!9616)

(assert (=> b!116307 (= lt!177757 (readBitPure!0 (_1!5075 lt!177751)))))

(declare-fun lt!177758 () tuple2!9620)

(declare-fun lt!177755 () tuple2!9622)

(declare-fun reader!0 (BitStream!4228 BitStream!4228) tuple2!9620)

(assert (=> b!116307 (= lt!177758 (reader!0 (_2!5076 lt!177755) (_2!5076 lt!177746)))))

(assert (=> b!116307 (= lt!177751 (reader!0 thiss!1305 (_2!5076 lt!177746)))))

(declare-fun e!76217 () Bool)

(assert (=> b!116307 e!76217))

(declare-fun res!96154 () Bool)

(assert (=> b!116307 (=> (not res!96154) (not e!76217))))

(declare-fun lt!177753 () tuple2!9616)

(declare-fun lt!177747 () tuple2!9616)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116307 (= res!96154 (= (bitIndex!0 (size!2377 (buf!2787 (_1!5073 lt!177753))) (currentByte!5424 (_1!5073 lt!177753)) (currentBit!5419 (_1!5073 lt!177753))) (bitIndex!0 (size!2377 (buf!2787 (_1!5073 lt!177747))) (currentByte!5424 (_1!5073 lt!177747)) (currentBit!5419 (_1!5073 lt!177747)))))))

(declare-fun lt!177745 () Unit!7159)

(declare-fun lt!177743 () BitStream!4228)

(declare-fun readBitPrefixLemma!0 (BitStream!4228 BitStream!4228) Unit!7159)

(assert (=> b!116307 (= lt!177745 (readBitPrefixLemma!0 lt!177743 (_2!5076 lt!177746)))))

(assert (=> b!116307 (= lt!177747 (readBitPure!0 (BitStream!4229 (buf!2787 (_2!5076 lt!177746)) (currentByte!5424 thiss!1305) (currentBit!5419 thiss!1305))))))

(assert (=> b!116307 (= lt!177753 (readBitPure!0 lt!177743))))

(assert (=> b!116307 (= lt!177743 (BitStream!4229 (buf!2787 (_2!5076 lt!177755)) (currentByte!5424 thiss!1305) (currentBit!5419 thiss!1305)))))

(declare-fun e!76222 () Bool)

(assert (=> b!116307 e!76222))

(declare-fun res!96157 () Bool)

(assert (=> b!116307 (=> (not res!96157) (not e!76222))))

(declare-fun isPrefixOf!0 (BitStream!4228 BitStream!4228) Bool)

(assert (=> b!116307 (= res!96157 (isPrefixOf!0 thiss!1305 (_2!5076 lt!177746)))))

(declare-fun lt!177752 () Unit!7159)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4228 BitStream!4228 BitStream!4228) Unit!7159)

(assert (=> b!116307 (= lt!177752 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5076 lt!177755) (_2!5076 lt!177746)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4228 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9622)

(assert (=> b!116307 (= lt!177746 (appendNLeastSignificantBitsLoop!0 (_2!5076 lt!177755) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76224 () Bool)

(assert (=> b!116307 e!76224))

(declare-fun res!96159 () Bool)

(assert (=> b!116307 (=> (not res!96159) (not e!76224))))

(assert (=> b!116307 (= res!96159 (= (size!2377 (buf!2787 thiss!1305)) (size!2377 (buf!2787 (_2!5076 lt!177755)))))))

(declare-fun appendBit!0 (BitStream!4228 Bool) tuple2!9622)

(assert (=> b!116307 (= lt!177755 (appendBit!0 thiss!1305 lt!177748))))

(assert (=> b!116307 (= lt!177748 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) lt!177750))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116307 (= lt!177750 (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))

(declare-fun b!116308 () Bool)

(declare-fun e!76221 () Bool)

(assert (=> b!116308 (= e!76224 e!76221)))

(declare-fun res!96149 () Bool)

(assert (=> b!116308 (=> (not res!96149) (not e!76221))))

(declare-fun lt!177742 () (_ BitVec 64))

(declare-fun lt!177759 () (_ BitVec 64))

(assert (=> b!116308 (= res!96149 (= lt!177742 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177759)))))

(assert (=> b!116308 (= lt!177742 (bitIndex!0 (size!2377 (buf!2787 (_2!5076 lt!177755))) (currentByte!5424 (_2!5076 lt!177755)) (currentBit!5419 (_2!5076 lt!177755))))))

(assert (=> b!116308 (= lt!177759 (bitIndex!0 (size!2377 (buf!2787 thiss!1305)) (currentByte!5424 thiss!1305) (currentBit!5419 thiss!1305)))))

(declare-fun b!116309 () Bool)

(declare-fun e!76219 () Bool)

(declare-fun array_inv!2179 (array!5240) Bool)

(assert (=> b!116309 (= e!76219 (array_inv!2179 (buf!2787 thiss!1305)))))

(declare-fun b!116310 () Bool)

(declare-fun res!96156 () Bool)

(assert (=> b!116310 (=> (not res!96156) (not e!76221))))

(assert (=> b!116310 (= res!96156 (isPrefixOf!0 thiss!1305 (_2!5076 lt!177755)))))

(declare-fun b!116311 () Bool)

(declare-fun res!96152 () Bool)

(assert (=> b!116311 (=> (not res!96152) (not e!76222))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116311 (= res!96152 (invariant!0 (currentBit!5419 thiss!1305) (currentByte!5424 thiss!1305) (size!2377 (buf!2787 (_2!5076 lt!177755)))))))

(declare-fun res!96150 () Bool)

(assert (=> start!22976 (=> (not res!96150) (not e!76223))))

(assert (=> start!22976 (= res!96150 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22976 e!76223))

(assert (=> start!22976 true))

(declare-fun inv!12 (BitStream!4228) Bool)

(assert (=> start!22976 (and (inv!12 thiss!1305) e!76219)))

(declare-fun b!116312 () Bool)

(declare-fun e!76216 () Bool)

(declare-fun lt!177754 () tuple2!9616)

(assert (=> b!116312 (= e!76216 (= (bitIndex!0 (size!2377 (buf!2787 (_1!5073 lt!177754))) (currentByte!5424 (_1!5073 lt!177754)) (currentBit!5419 (_1!5073 lt!177754))) lt!177742))))

(declare-fun b!116313 () Bool)

(assert (=> b!116313 (= e!76222 (invariant!0 (currentBit!5419 thiss!1305) (currentByte!5424 thiss!1305) (size!2377 (buf!2787 (_2!5076 lt!177746)))))))

(declare-fun b!116314 () Bool)

(declare-fun res!96155 () Bool)

(assert (=> b!116314 (=> (not res!96155) (not e!76220))))

(assert (=> b!116314 (= res!96155 (bvslt i!615 nBits!396))))

(declare-fun b!116315 () Bool)

(assert (=> b!116315 (= e!76217 (= (_2!5073 lt!177753) (_2!5073 lt!177747)))))

(declare-fun b!116316 () Bool)

(assert (=> b!116316 (= e!76221 e!76216)))

(declare-fun res!96153 () Bool)

(assert (=> b!116316 (=> (not res!96153) (not e!76216))))

(assert (=> b!116316 (= res!96153 (and (= (_2!5073 lt!177754) lt!177748) (= (_1!5073 lt!177754) (_2!5076 lt!177755))))))

(declare-fun readerFrom!0 (BitStream!4228 (_ BitVec 32) (_ BitVec 32)) BitStream!4228)

(assert (=> b!116316 (= lt!177754 (readBitPure!0 (readerFrom!0 (_2!5076 lt!177755) (currentBit!5419 thiss!1305) (currentByte!5424 thiss!1305))))))

(declare-fun b!116317 () Bool)

(declare-fun res!96158 () Bool)

(assert (=> b!116317 (=> (not res!96158) (not e!76220))))

(assert (=> b!116317 (= res!96158 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22976 res!96150) b!116306))

(assert (= (and b!116306 res!96151) b!116317))

(assert (= (and b!116317 res!96158) b!116314))

(assert (= (and b!116314 res!96155) b!116307))

(assert (= (and b!116307 res!96159) b!116308))

(assert (= (and b!116308 res!96149) b!116310))

(assert (= (and b!116310 res!96156) b!116316))

(assert (= (and b!116316 res!96153) b!116312))

(assert (= (and b!116307 res!96157) b!116311))

(assert (= (and b!116311 res!96152) b!116313))

(assert (= (and b!116307 res!96154) b!116315))

(assert (= start!22976 b!116309))

(declare-fun m!174155 () Bool)

(assert (=> b!116309 m!174155))

(declare-fun m!174157 () Bool)

(assert (=> b!116310 m!174157))

(declare-fun m!174159 () Bool)

(assert (=> b!116307 m!174159))

(declare-fun m!174161 () Bool)

(assert (=> b!116307 m!174161))

(declare-fun m!174163 () Bool)

(assert (=> b!116307 m!174163))

(declare-fun m!174165 () Bool)

(assert (=> b!116307 m!174165))

(declare-fun m!174167 () Bool)

(assert (=> b!116307 m!174167))

(declare-fun m!174169 () Bool)

(assert (=> b!116307 m!174169))

(declare-fun m!174171 () Bool)

(assert (=> b!116307 m!174171))

(declare-fun m!174173 () Bool)

(assert (=> b!116307 m!174173))

(declare-fun m!174175 () Bool)

(assert (=> b!116307 m!174175))

(declare-fun m!174177 () Bool)

(assert (=> b!116307 m!174177))

(declare-fun m!174179 () Bool)

(assert (=> b!116307 m!174179))

(declare-fun m!174181 () Bool)

(assert (=> b!116307 m!174181))

(declare-fun m!174183 () Bool)

(assert (=> b!116307 m!174183))

(declare-fun m!174185 () Bool)

(assert (=> b!116307 m!174185))

(declare-fun m!174187 () Bool)

(assert (=> b!116307 m!174187))

(declare-fun m!174189 () Bool)

(assert (=> b!116307 m!174189))

(declare-fun m!174191 () Bool)

(assert (=> b!116308 m!174191))

(declare-fun m!174193 () Bool)

(assert (=> b!116308 m!174193))

(declare-fun m!174195 () Bool)

(assert (=> b!116316 m!174195))

(assert (=> b!116316 m!174195))

(declare-fun m!174197 () Bool)

(assert (=> b!116316 m!174197))

(declare-fun m!174199 () Bool)

(assert (=> b!116317 m!174199))

(declare-fun m!174201 () Bool)

(assert (=> b!116313 m!174201))

(declare-fun m!174203 () Bool)

(assert (=> b!116306 m!174203))

(declare-fun m!174205 () Bool)

(assert (=> b!116311 m!174205))

(declare-fun m!174207 () Bool)

(assert (=> b!116312 m!174207))

(declare-fun m!174209 () Bool)

(assert (=> start!22976 m!174209))

(push 1)

(assert (not b!116309))

(assert (not b!116307))

(assert (not b!116311))

(assert (not start!22976))

(assert (not b!116313))

(assert (not b!116310))

(assert (not b!116308))

(assert (not b!116316))

(assert (not b!116306))

(assert (not b!116317))

(assert (not b!116312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

