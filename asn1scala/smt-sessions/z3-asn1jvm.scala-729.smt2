; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20352 () Bool)

(assert start!20352)

(declare-fun b!102319 () Bool)

(declare-fun e!66944 () Bool)

(declare-datatypes ((array!4796 0))(
  ( (array!4797 (arr!2782 (Array (_ BitVec 32) (_ BitVec 8))) (size!2189 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3852 0))(
  ( (BitStream!3853 (buf!2549 array!4796) (currentByte!5022 (_ BitVec 32)) (currentBit!5017 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3852)

(declare-datatypes ((Unit!6274 0))(
  ( (Unit!6275) )
))
(declare-datatypes ((tuple2!8334 0))(
  ( (tuple2!8335 (_1!4422 Unit!6274) (_2!4422 BitStream!3852)) )
))
(declare-fun lt!148849 () tuple2!8334)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102319 (= e!66944 (invariant!0 (currentBit!5017 thiss!1305) (currentByte!5022 thiss!1305) (size!2189 (buf!2549 (_2!4422 lt!148849)))))))

(declare-fun b!102320 () Bool)

(declare-fun res!84123 () Bool)

(declare-fun e!66942 () Bool)

(assert (=> b!102320 (=> (not res!84123) (not e!66942))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102320 (= res!84123 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102321 () Bool)

(declare-fun e!66941 () Bool)

(assert (=> b!102321 (= e!66941 e!66942)))

(declare-fun res!84130 () Bool)

(assert (=> b!102321 (=> (not res!84130) (not e!66942))))

(declare-fun lt!148841 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102321 (= res!84130 (validate_offset_bits!1 ((_ sign_extend 32) (size!2189 (buf!2549 thiss!1305))) ((_ sign_extend 32) (currentByte!5022 thiss!1305)) ((_ sign_extend 32) (currentBit!5017 thiss!1305)) lt!148841))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!102321 (= lt!148841 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102322 () Bool)

(declare-fun e!66948 () Bool)

(declare-datatypes ((tuple2!8336 0))(
  ( (tuple2!8337 (_1!4423 BitStream!3852) (_2!4423 Bool)) )
))
(declare-fun lt!148843 () tuple2!8336)

(declare-fun lt!148844 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102322 (= e!66948 (= (bitIndex!0 (size!2189 (buf!2549 (_1!4423 lt!148843))) (currentByte!5022 (_1!4423 lt!148843)) (currentBit!5017 (_1!4423 lt!148843))) lt!148844))))

(declare-fun b!102323 () Bool)

(declare-fun e!66947 () Bool)

(declare-fun lt!148837 () tuple2!8336)

(declare-fun lt!148838 () tuple2!8336)

(assert (=> b!102323 (= e!66947 (= (_2!4423 lt!148837) (_2!4423 lt!148838)))))

(declare-fun b!102324 () Bool)

(declare-fun res!84122 () Bool)

(assert (=> b!102324 (=> (not res!84122) (not e!66942))))

(assert (=> b!102324 (= res!84122 (bvslt i!615 nBits!396))))

(declare-fun b!102325 () Bool)

(declare-fun e!66943 () Bool)

(assert (=> b!102325 (= e!66943 e!66948)))

(declare-fun res!84124 () Bool)

(assert (=> b!102325 (=> (not res!84124) (not e!66948))))

(declare-fun lt!148852 () Bool)

(declare-fun lt!148850 () tuple2!8334)

(assert (=> b!102325 (= res!84124 (and (= (_2!4423 lt!148843) lt!148852) (= (_1!4423 lt!148843) (_2!4422 lt!148850))))))

(declare-fun readBitPure!0 (BitStream!3852) tuple2!8336)

(declare-fun readerFrom!0 (BitStream!3852 (_ BitVec 32) (_ BitVec 32)) BitStream!3852)

(assert (=> b!102325 (= lt!148843 (readBitPure!0 (readerFrom!0 (_2!4422 lt!148850) (currentBit!5017 thiss!1305) (currentByte!5022 thiss!1305))))))

(declare-fun b!102318 () Bool)

(declare-fun e!66945 () Bool)

(assert (=> b!102318 (= e!66945 e!66943)))

(declare-fun res!84129 () Bool)

(assert (=> b!102318 (=> (not res!84129) (not e!66943))))

(declare-fun lt!148842 () (_ BitVec 64))

(assert (=> b!102318 (= res!84129 (= lt!148844 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148842)))))

(assert (=> b!102318 (= lt!148844 (bitIndex!0 (size!2189 (buf!2549 (_2!4422 lt!148850))) (currentByte!5022 (_2!4422 lt!148850)) (currentBit!5017 (_2!4422 lt!148850))))))

(assert (=> b!102318 (= lt!148842 (bitIndex!0 (size!2189 (buf!2549 thiss!1305)) (currentByte!5022 thiss!1305) (currentBit!5017 thiss!1305)))))

(declare-fun res!84125 () Bool)

(assert (=> start!20352 (=> (not res!84125) (not e!66941))))

(assert (=> start!20352 (= res!84125 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20352 e!66941))

(assert (=> start!20352 true))

(declare-fun e!66940 () Bool)

(declare-fun inv!12 (BitStream!3852) Bool)

(assert (=> start!20352 (and (inv!12 thiss!1305) e!66940)))

(declare-fun b!102326 () Bool)

(assert (=> b!102326 (= e!66942 (not true))))

(declare-datatypes ((tuple2!8338 0))(
  ( (tuple2!8339 (_1!4424 BitStream!3852) (_2!4424 BitStream!3852)) )
))
(declare-fun lt!148839 () tuple2!8338)

(declare-datatypes ((tuple2!8340 0))(
  ( (tuple2!8341 (_1!4425 BitStream!3852) (_2!4425 (_ BitVec 64))) )
))
(declare-fun lt!148840 () tuple2!8340)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8340)

(assert (=> b!102326 (= lt!148840 (readNLeastSignificantBitsLoopPure!0 (_1!4424 lt!148839) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102326 (validate_offset_bits!1 ((_ sign_extend 32) (size!2189 (buf!2549 (_2!4422 lt!148849)))) ((_ sign_extend 32) (currentByte!5022 thiss!1305)) ((_ sign_extend 32) (currentBit!5017 thiss!1305)) lt!148841)))

(declare-fun lt!148846 () Unit!6274)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3852 array!4796 (_ BitVec 64)) Unit!6274)

(assert (=> b!102326 (= lt!148846 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2549 (_2!4422 lt!148849)) lt!148841))))

(assert (=> b!102326 (= (_2!4423 (readBitPure!0 (_1!4424 lt!148839))) lt!148852)))

(declare-fun lt!148845 () tuple2!8338)

(declare-fun reader!0 (BitStream!3852 BitStream!3852) tuple2!8338)

(assert (=> b!102326 (= lt!148845 (reader!0 (_2!4422 lt!148850) (_2!4422 lt!148849)))))

(assert (=> b!102326 (= lt!148839 (reader!0 thiss!1305 (_2!4422 lt!148849)))))

(assert (=> b!102326 e!66947))

(declare-fun res!84128 () Bool)

(assert (=> b!102326 (=> (not res!84128) (not e!66947))))

(assert (=> b!102326 (= res!84128 (= (bitIndex!0 (size!2189 (buf!2549 (_1!4423 lt!148837))) (currentByte!5022 (_1!4423 lt!148837)) (currentBit!5017 (_1!4423 lt!148837))) (bitIndex!0 (size!2189 (buf!2549 (_1!4423 lt!148838))) (currentByte!5022 (_1!4423 lt!148838)) (currentBit!5017 (_1!4423 lt!148838)))))))

(declare-fun lt!148848 () Unit!6274)

(declare-fun lt!148847 () BitStream!3852)

(declare-fun readBitPrefixLemma!0 (BitStream!3852 BitStream!3852) Unit!6274)

(assert (=> b!102326 (= lt!148848 (readBitPrefixLemma!0 lt!148847 (_2!4422 lt!148849)))))

(assert (=> b!102326 (= lt!148838 (readBitPure!0 (BitStream!3853 (buf!2549 (_2!4422 lt!148849)) (currentByte!5022 thiss!1305) (currentBit!5017 thiss!1305))))))

(assert (=> b!102326 (= lt!148837 (readBitPure!0 lt!148847))))

(assert (=> b!102326 (= lt!148847 (BitStream!3853 (buf!2549 (_2!4422 lt!148850)) (currentByte!5022 thiss!1305) (currentBit!5017 thiss!1305)))))

(assert (=> b!102326 e!66944))

(declare-fun res!84127 () Bool)

(assert (=> b!102326 (=> (not res!84127) (not e!66944))))

(declare-fun isPrefixOf!0 (BitStream!3852 BitStream!3852) Bool)

(assert (=> b!102326 (= res!84127 (isPrefixOf!0 thiss!1305 (_2!4422 lt!148849)))))

(declare-fun lt!148851 () Unit!6274)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3852 BitStream!3852 BitStream!3852) Unit!6274)

(assert (=> b!102326 (= lt!148851 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4422 lt!148850) (_2!4422 lt!148849)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3852 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8334)

(assert (=> b!102326 (= lt!148849 (appendNLeastSignificantBitsLoop!0 (_2!4422 lt!148850) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102326 e!66945))

(declare-fun res!84131 () Bool)

(assert (=> b!102326 (=> (not res!84131) (not e!66945))))

(assert (=> b!102326 (= res!84131 (= (size!2189 (buf!2549 thiss!1305)) (size!2189 (buf!2549 (_2!4422 lt!148850)))))))

(declare-fun appendBit!0 (BitStream!3852 Bool) tuple2!8334)

(assert (=> b!102326 (= lt!148850 (appendBit!0 thiss!1305 lt!148852))))

(assert (=> b!102326 (= lt!148852 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102327 () Bool)

(declare-fun array_inv!1991 (array!4796) Bool)

(assert (=> b!102327 (= e!66940 (array_inv!1991 (buf!2549 thiss!1305)))))

(declare-fun b!102328 () Bool)

(declare-fun res!84121 () Bool)

(assert (=> b!102328 (=> (not res!84121) (not e!66944))))

(assert (=> b!102328 (= res!84121 (invariant!0 (currentBit!5017 thiss!1305) (currentByte!5022 thiss!1305) (size!2189 (buf!2549 (_2!4422 lt!148850)))))))

(declare-fun b!102329 () Bool)

(declare-fun res!84126 () Bool)

(assert (=> b!102329 (=> (not res!84126) (not e!66943))))

(assert (=> b!102329 (= res!84126 (isPrefixOf!0 thiss!1305 (_2!4422 lt!148850)))))

(assert (= (and start!20352 res!84125) b!102321))

(assert (= (and b!102321 res!84130) b!102320))

(assert (= (and b!102320 res!84123) b!102324))

(assert (= (and b!102324 res!84122) b!102326))

(assert (= (and b!102326 res!84131) b!102318))

(assert (= (and b!102318 res!84129) b!102329))

(assert (= (and b!102329 res!84126) b!102325))

(assert (= (and b!102325 res!84124) b!102322))

(assert (= (and b!102326 res!84127) b!102328))

(assert (= (and b!102328 res!84121) b!102319))

(assert (= (and b!102326 res!84128) b!102323))

(assert (= start!20352 b!102327))

(declare-fun m!148995 () Bool)

(assert (=> b!102320 m!148995))

(declare-fun m!148997 () Bool)

(assert (=> b!102325 m!148997))

(assert (=> b!102325 m!148997))

(declare-fun m!148999 () Bool)

(assert (=> b!102325 m!148999))

(declare-fun m!149001 () Bool)

(assert (=> b!102328 m!149001))

(declare-fun m!149003 () Bool)

(assert (=> b!102318 m!149003))

(declare-fun m!149005 () Bool)

(assert (=> b!102318 m!149005))

(declare-fun m!149007 () Bool)

(assert (=> start!20352 m!149007))

(declare-fun m!149009 () Bool)

(assert (=> b!102319 m!149009))

(declare-fun m!149011 () Bool)

(assert (=> b!102321 m!149011))

(declare-fun m!149013 () Bool)

(assert (=> b!102322 m!149013))

(declare-fun m!149015 () Bool)

(assert (=> b!102329 m!149015))

(declare-fun m!149017 () Bool)

(assert (=> b!102326 m!149017))

(declare-fun m!149019 () Bool)

(assert (=> b!102326 m!149019))

(declare-fun m!149021 () Bool)

(assert (=> b!102326 m!149021))

(declare-fun m!149023 () Bool)

(assert (=> b!102326 m!149023))

(declare-fun m!149025 () Bool)

(assert (=> b!102326 m!149025))

(declare-fun m!149027 () Bool)

(assert (=> b!102326 m!149027))

(declare-fun m!149029 () Bool)

(assert (=> b!102326 m!149029))

(declare-fun m!149031 () Bool)

(assert (=> b!102326 m!149031))

(declare-fun m!149033 () Bool)

(assert (=> b!102326 m!149033))

(declare-fun m!149035 () Bool)

(assert (=> b!102326 m!149035))

(declare-fun m!149037 () Bool)

(assert (=> b!102326 m!149037))

(declare-fun m!149039 () Bool)

(assert (=> b!102326 m!149039))

(declare-fun m!149041 () Bool)

(assert (=> b!102326 m!149041))

(declare-fun m!149043 () Bool)

(assert (=> b!102326 m!149043))

(declare-fun m!149045 () Bool)

(assert (=> b!102326 m!149045))

(declare-fun m!149047 () Bool)

(assert (=> b!102326 m!149047))

(declare-fun m!149049 () Bool)

(assert (=> b!102327 m!149049))

(check-sat (not b!102320) (not b!102322) (not b!102318) (not b!102321) (not start!20352) (not b!102328) (not b!102327) (not b!102326) (not b!102325) (not b!102329) (not b!102319))
