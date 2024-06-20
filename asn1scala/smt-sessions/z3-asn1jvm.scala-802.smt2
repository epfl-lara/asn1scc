; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23224 () Bool)

(assert start!23224)

(declare-fun b!117952 () Bool)

(declare-fun e!77330 () Bool)

(declare-fun e!77323 () Bool)

(assert (=> b!117952 (= e!77330 e!77323)))

(declare-fun res!97602 () Bool)

(assert (=> b!117952 (=> (not res!97602) (not e!77323))))

(declare-fun lt!181009 () (_ BitVec 64))

(declare-fun lt!181012 () (_ BitVec 64))

(assert (=> b!117952 (= res!97602 (= lt!181009 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!181012)))))

(declare-datatypes ((array!5302 0))(
  ( (array!5303 (arr!2998 (Array (_ BitVec 32) (_ BitVec 8))) (size!2405 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4284 0))(
  ( (BitStream!4285 (buf!2821 array!5302) (currentByte!5470 (_ BitVec 32)) (currentBit!5465 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7257 0))(
  ( (Unit!7258) )
))
(declare-datatypes ((tuple2!9864 0))(
  ( (tuple2!9865 (_1!5197 Unit!7257) (_2!5197 BitStream!4284)) )
))
(declare-fun lt!181028 () tuple2!9864)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117952 (= lt!181009 (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))))))

(declare-fun thiss!1305 () BitStream!4284)

(assert (=> b!117952 (= lt!181012 (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)))))

(declare-fun b!117953 () Bool)

(declare-fun res!97601 () Bool)

(declare-fun e!77324 () Bool)

(assert (=> b!117953 (=> (not res!97601) (not e!77324))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117953 (= res!97601 (invariant!0 (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181028)))))))

(declare-fun b!117954 () Bool)

(declare-fun e!77327 () Bool)

(declare-fun e!77326 () Bool)

(assert (=> b!117954 (= e!77327 (not e!77326))))

(declare-fun res!97597 () Bool)

(assert (=> b!117954 (=> res!97597 e!77326)))

(declare-fun lt!181010 () (_ BitVec 64))

(declare-datatypes ((tuple2!9866 0))(
  ( (tuple2!9867 (_1!5198 BitStream!4284) (_2!5198 BitStream!4284)) )
))
(declare-fun lt!181027 () tuple2!9866)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!9868 0))(
  ( (tuple2!9869 (_1!5199 BitStream!4284) (_2!5199 Bool)) )
))
(declare-fun lt!181014 () tuple2!9868)

(declare-fun lt!181029 () (_ BitVec 64))

(declare-datatypes ((tuple2!9870 0))(
  ( (tuple2!9871 (_1!5200 BitStream!4284) (_2!5200 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9870)

(assert (=> b!117954 (= res!97597 (not (= (_1!5200 (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181027) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!181010 (ite (_2!5199 lt!181014) lt!181029 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5198 lt!181027))))))

(declare-fun lt!181015 () tuple2!9864)

(declare-fun lt!181020 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117954 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028))) lt!181020)))

(declare-fun lt!181011 () Unit!7257)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4284 array!5302 (_ BitVec 64)) Unit!7257)

(assert (=> b!117954 (= lt!181011 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5197 lt!181028) (buf!2821 (_2!5197 lt!181015)) lt!181020))))

(assert (=> b!117954 (= lt!181020 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!181023 () tuple2!9866)

(declare-fun lt!181017 () tuple2!9870)

(assert (=> b!117954 (= lt!181017 (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181023) nBits!396 i!615 lt!181010))))

(declare-fun lt!181016 () (_ BitVec 64))

(assert (=> b!117954 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305)) lt!181016)))

(declare-fun lt!181021 () Unit!7257)

(assert (=> b!117954 (= lt!181021 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2821 (_2!5197 lt!181015)) lt!181016))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117954 (= lt!181010 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!181024 () Bool)

(assert (=> b!117954 (= (_2!5199 lt!181014) lt!181024)))

(declare-fun readBitPure!0 (BitStream!4284) tuple2!9868)

(assert (=> b!117954 (= lt!181014 (readBitPure!0 (_1!5198 lt!181023)))))

(declare-fun reader!0 (BitStream!4284 BitStream!4284) tuple2!9866)

(assert (=> b!117954 (= lt!181027 (reader!0 (_2!5197 lt!181028) (_2!5197 lt!181015)))))

(assert (=> b!117954 (= lt!181023 (reader!0 thiss!1305 (_2!5197 lt!181015)))))

(declare-fun e!77331 () Bool)

(assert (=> b!117954 e!77331))

(declare-fun res!97595 () Bool)

(assert (=> b!117954 (=> (not res!97595) (not e!77331))))

(declare-fun lt!181022 () tuple2!9868)

(declare-fun lt!181013 () tuple2!9868)

(assert (=> b!117954 (= res!97595 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181022))) (currentByte!5470 (_1!5199 lt!181022)) (currentBit!5465 (_1!5199 lt!181022))) (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181013))) (currentByte!5470 (_1!5199 lt!181013)) (currentBit!5465 (_1!5199 lt!181013)))))))

(declare-fun lt!181019 () Unit!7257)

(declare-fun lt!181025 () BitStream!4284)

(declare-fun readBitPrefixLemma!0 (BitStream!4284 BitStream!4284) Unit!7257)

(assert (=> b!117954 (= lt!181019 (readBitPrefixLemma!0 lt!181025 (_2!5197 lt!181015)))))

(assert (=> b!117954 (= lt!181013 (readBitPure!0 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305))))))

(assert (=> b!117954 (= lt!181022 (readBitPure!0 lt!181025))))

(assert (=> b!117954 (= lt!181025 (BitStream!4285 (buf!2821 (_2!5197 lt!181028)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)))))

(assert (=> b!117954 e!77324))

(declare-fun res!97596 () Bool)

(assert (=> b!117954 (=> (not res!97596) (not e!77324))))

(declare-fun isPrefixOf!0 (BitStream!4284 BitStream!4284) Bool)

(assert (=> b!117954 (= res!97596 (isPrefixOf!0 thiss!1305 (_2!5197 lt!181015)))))

(declare-fun lt!181026 () Unit!7257)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4284 BitStream!4284 BitStream!4284) Unit!7257)

(assert (=> b!117954 (= lt!181026 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5197 lt!181028) (_2!5197 lt!181015)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4284 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9864)

(assert (=> b!117954 (= lt!181015 (appendNLeastSignificantBitsLoop!0 (_2!5197 lt!181028) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117954 e!77330))

(declare-fun res!97591 () Bool)

(assert (=> b!117954 (=> (not res!97591) (not e!77330))))

(assert (=> b!117954 (= res!97591 (= (size!2405 (buf!2821 thiss!1305)) (size!2405 (buf!2821 (_2!5197 lt!181028)))))))

(declare-fun appendBit!0 (BitStream!4284 Bool) tuple2!9864)

(assert (=> b!117954 (= lt!181028 (appendBit!0 thiss!1305 lt!181024))))

(assert (=> b!117954 (= lt!181024 (not (= (bvand v!199 lt!181029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117954 (= lt!181029 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!117955 () Bool)

(assert (=> b!117955 (= e!77324 (invariant!0 (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181015)))))))

(declare-fun b!117956 () Bool)

(assert (=> b!117956 (= e!77326 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5198 lt!181023)))) ((_ sign_extend 32) (currentByte!5470 (_1!5198 lt!181023))) ((_ sign_extend 32) (currentBit!5465 (_1!5198 lt!181023))) lt!181016))))

(declare-fun b!117957 () Bool)

(declare-fun res!97599 () Bool)

(assert (=> b!117957 (=> (not res!97599) (not e!77323))))

(assert (=> b!117957 (= res!97599 (isPrefixOf!0 thiss!1305 (_2!5197 lt!181028)))))

(declare-fun b!117958 () Bool)

(declare-fun res!97600 () Bool)

(assert (=> b!117958 (=> (not res!97600) (not e!77327))))

(assert (=> b!117958 (= res!97600 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117959 () Bool)

(assert (=> b!117959 (= e!77331 (= (_2!5199 lt!181022) (_2!5199 lt!181013)))))

(declare-fun b!117961 () Bool)

(declare-fun e!77329 () Bool)

(assert (=> b!117961 (= e!77329 e!77327)))

(declare-fun res!97593 () Bool)

(assert (=> b!117961 (=> (not res!97593) (not e!77327))))

(assert (=> b!117961 (= res!97593 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 thiss!1305))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305)) lt!181016))))

(assert (=> b!117961 (= lt!181016 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117962 () Bool)

(declare-fun e!77325 () Bool)

(declare-fun array_inv!2207 (array!5302) Bool)

(assert (=> b!117962 (= e!77325 (array_inv!2207 (buf!2821 thiss!1305)))))

(declare-fun res!97598 () Bool)

(assert (=> start!23224 (=> (not res!97598) (not e!77329))))

(assert (=> start!23224 (= res!97598 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23224 e!77329))

(assert (=> start!23224 true))

(declare-fun inv!12 (BitStream!4284) Bool)

(assert (=> start!23224 (and (inv!12 thiss!1305) e!77325)))

(declare-fun b!117960 () Bool)

(declare-fun e!77328 () Bool)

(assert (=> b!117960 (= e!77323 e!77328)))

(declare-fun res!97592 () Bool)

(assert (=> b!117960 (=> (not res!97592) (not e!77328))))

(declare-fun lt!181018 () tuple2!9868)

(assert (=> b!117960 (= res!97592 (and (= (_2!5199 lt!181018) lt!181024) (= (_1!5199 lt!181018) (_2!5197 lt!181028))))))

(declare-fun readerFrom!0 (BitStream!4284 (_ BitVec 32) (_ BitVec 32)) BitStream!4284)

(assert (=> b!117960 (= lt!181018 (readBitPure!0 (readerFrom!0 (_2!5197 lt!181028) (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305))))))

(declare-fun b!117963 () Bool)

(assert (=> b!117963 (= e!77328 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181018))) (currentByte!5470 (_1!5199 lt!181018)) (currentBit!5465 (_1!5199 lt!181018))) lt!181009))))

(declare-fun b!117964 () Bool)

(declare-fun res!97594 () Bool)

(assert (=> b!117964 (=> (not res!97594) (not e!77327))))

(assert (=> b!117964 (= res!97594 (bvslt i!615 nBits!396))))

(assert (= (and start!23224 res!97598) b!117961))

(assert (= (and b!117961 res!97593) b!117958))

(assert (= (and b!117958 res!97600) b!117964))

(assert (= (and b!117964 res!97594) b!117954))

(assert (= (and b!117954 res!97591) b!117952))

(assert (= (and b!117952 res!97602) b!117957))

(assert (= (and b!117957 res!97599) b!117960))

(assert (= (and b!117960 res!97592) b!117963))

(assert (= (and b!117954 res!97596) b!117953))

(assert (= (and b!117953 res!97601) b!117955))

(assert (= (and b!117954 res!97595) b!117959))

(assert (= (and b!117954 (not res!97597)) b!117956))

(assert (= start!23224 b!117962))

(declare-fun m!177003 () Bool)

(assert (=> b!117953 m!177003))

(declare-fun m!177005 () Bool)

(assert (=> b!117955 m!177005))

(declare-fun m!177007 () Bool)

(assert (=> b!117960 m!177007))

(assert (=> b!117960 m!177007))

(declare-fun m!177009 () Bool)

(assert (=> b!117960 m!177009))

(declare-fun m!177011 () Bool)

(assert (=> start!23224 m!177011))

(declare-fun m!177013 () Bool)

(assert (=> b!117961 m!177013))

(declare-fun m!177015 () Bool)

(assert (=> b!117954 m!177015))

(declare-fun m!177017 () Bool)

(assert (=> b!117954 m!177017))

(declare-fun m!177019 () Bool)

(assert (=> b!117954 m!177019))

(declare-fun m!177021 () Bool)

(assert (=> b!117954 m!177021))

(declare-fun m!177023 () Bool)

(assert (=> b!117954 m!177023))

(declare-fun m!177025 () Bool)

(assert (=> b!117954 m!177025))

(declare-fun m!177027 () Bool)

(assert (=> b!117954 m!177027))

(declare-fun m!177029 () Bool)

(assert (=> b!117954 m!177029))

(declare-fun m!177031 () Bool)

(assert (=> b!117954 m!177031))

(declare-fun m!177033 () Bool)

(assert (=> b!117954 m!177033))

(declare-fun m!177035 () Bool)

(assert (=> b!117954 m!177035))

(declare-fun m!177037 () Bool)

(assert (=> b!117954 m!177037))

(declare-fun m!177039 () Bool)

(assert (=> b!117954 m!177039))

(declare-fun m!177041 () Bool)

(assert (=> b!117954 m!177041))

(declare-fun m!177043 () Bool)

(assert (=> b!117954 m!177043))

(declare-fun m!177045 () Bool)

(assert (=> b!117954 m!177045))

(declare-fun m!177047 () Bool)

(assert (=> b!117954 m!177047))

(declare-fun m!177049 () Bool)

(assert (=> b!117954 m!177049))

(declare-fun m!177051 () Bool)

(assert (=> b!117954 m!177051))

(declare-fun m!177053 () Bool)

(assert (=> b!117957 m!177053))

(declare-fun m!177055 () Bool)

(assert (=> b!117962 m!177055))

(declare-fun m!177057 () Bool)

(assert (=> b!117958 m!177057))

(declare-fun m!177059 () Bool)

(assert (=> b!117952 m!177059))

(declare-fun m!177061 () Bool)

(assert (=> b!117952 m!177061))

(declare-fun m!177063 () Bool)

(assert (=> b!117956 m!177063))

(declare-fun m!177065 () Bool)

(assert (=> b!117963 m!177065))

(check-sat (not b!117955) (not b!117962) (not b!117956) (not b!117958) (not b!117960) (not b!117954) (not b!117957) (not b!117963) (not b!117952) (not b!117953) (not b!117961) (not start!23224))
(check-sat)
(get-model)

(declare-fun d!37704 () Bool)

(assert (=> d!37704 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!117958 d!37704))

(declare-fun d!37706 () Bool)

(declare-datatypes ((tuple2!9880 0))(
  ( (tuple2!9881 (_1!5205 Bool) (_2!5205 BitStream!4284)) )
))
(declare-fun lt!181095 () tuple2!9880)

(declare-fun readBit!0 (BitStream!4284) tuple2!9880)

(assert (=> d!37706 (= lt!181095 (readBit!0 (readerFrom!0 (_2!5197 lt!181028) (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305))))))

(assert (=> d!37706 (= (readBitPure!0 (readerFrom!0 (_2!5197 lt!181028) (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305))) (tuple2!9869 (_2!5205 lt!181095) (_1!5205 lt!181095)))))

(declare-fun bs!9125 () Bool)

(assert (= bs!9125 d!37706))

(assert (=> bs!9125 m!177007))

(declare-fun m!177131 () Bool)

(assert (=> bs!9125 m!177131))

(assert (=> b!117960 d!37706))

(declare-fun d!37708 () Bool)

(declare-fun e!77364 () Bool)

(assert (=> d!37708 e!77364))

(declare-fun res!97642 () Bool)

(assert (=> d!37708 (=> (not res!97642) (not e!77364))))

(assert (=> d!37708 (= res!97642 (invariant!0 (currentBit!5465 (_2!5197 lt!181028)) (currentByte!5470 (_2!5197 lt!181028)) (size!2405 (buf!2821 (_2!5197 lt!181028)))))))

(assert (=> d!37708 (= (readerFrom!0 (_2!5197 lt!181028) (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305)) (BitStream!4285 (buf!2821 (_2!5197 lt!181028)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)))))

(declare-fun b!118006 () Bool)

(assert (=> b!118006 (= e!77364 (invariant!0 (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181028)))))))

(assert (= (and d!37708 res!97642) b!118006))

(declare-fun m!177133 () Bool)

(assert (=> d!37708 m!177133))

(assert (=> b!118006 m!177003))

(assert (=> b!117960 d!37708))

(declare-fun d!37710 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37710 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 thiss!1305))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305)) lt!181016) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 thiss!1305))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305))) lt!181016))))

(declare-fun bs!9126 () Bool)

(assert (= bs!9126 d!37710))

(declare-fun m!177135 () Bool)

(assert (=> bs!9126 m!177135))

(assert (=> b!117961 d!37710))

(declare-fun d!37712 () Bool)

(declare-fun e!77367 () Bool)

(assert (=> d!37712 e!77367))

(declare-fun res!97647 () Bool)

(assert (=> d!37712 (=> (not res!97647) (not e!77367))))

(declare-fun lt!181109 () (_ BitVec 64))

(declare-fun lt!181108 () (_ BitVec 64))

(declare-fun lt!181113 () (_ BitVec 64))

(assert (=> d!37712 (= res!97647 (= lt!181113 (bvsub lt!181108 lt!181109)))))

(assert (=> d!37712 (or (= (bvand lt!181108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181108 lt!181109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37712 (= lt!181109 (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181018)))) ((_ sign_extend 32) (currentByte!5470 (_1!5199 lt!181018))) ((_ sign_extend 32) (currentBit!5465 (_1!5199 lt!181018)))))))

(declare-fun lt!181112 () (_ BitVec 64))

(declare-fun lt!181111 () (_ BitVec 64))

(assert (=> d!37712 (= lt!181108 (bvmul lt!181112 lt!181111))))

(assert (=> d!37712 (or (= lt!181112 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181111 (bvsdiv (bvmul lt!181112 lt!181111) lt!181112)))))

(assert (=> d!37712 (= lt!181111 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37712 (= lt!181112 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181018)))))))

(assert (=> d!37712 (= lt!181113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5470 (_1!5199 lt!181018))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5465 (_1!5199 lt!181018)))))))

(assert (=> d!37712 (invariant!0 (currentBit!5465 (_1!5199 lt!181018)) (currentByte!5470 (_1!5199 lt!181018)) (size!2405 (buf!2821 (_1!5199 lt!181018))))))

(assert (=> d!37712 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181018))) (currentByte!5470 (_1!5199 lt!181018)) (currentBit!5465 (_1!5199 lt!181018))) lt!181113)))

(declare-fun b!118011 () Bool)

(declare-fun res!97648 () Bool)

(assert (=> b!118011 (=> (not res!97648) (not e!77367))))

(assert (=> b!118011 (= res!97648 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181113))))

(declare-fun b!118012 () Bool)

(declare-fun lt!181110 () (_ BitVec 64))

(assert (=> b!118012 (= e!77367 (bvsle lt!181113 (bvmul lt!181110 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118012 (or (= lt!181110 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181110 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181110)))))

(assert (=> b!118012 (= lt!181110 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181018)))))))

(assert (= (and d!37712 res!97647) b!118011))

(assert (= (and b!118011 res!97648) b!118012))

(declare-fun m!177137 () Bool)

(assert (=> d!37712 m!177137))

(declare-fun m!177139 () Bool)

(assert (=> d!37712 m!177139))

(assert (=> b!117963 d!37712))

(declare-fun d!37714 () Bool)

(declare-fun e!77368 () Bool)

(assert (=> d!37714 e!77368))

(declare-fun res!97649 () Bool)

(assert (=> d!37714 (=> (not res!97649) (not e!77368))))

(declare-fun lt!181119 () (_ BitVec 64))

(declare-fun lt!181115 () (_ BitVec 64))

(declare-fun lt!181114 () (_ BitVec 64))

(assert (=> d!37714 (= res!97649 (= lt!181119 (bvsub lt!181114 lt!181115)))))

(assert (=> d!37714 (or (= (bvand lt!181114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181114 lt!181115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37714 (= lt!181115 (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181028)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028)))))))

(declare-fun lt!181118 () (_ BitVec 64))

(declare-fun lt!181117 () (_ BitVec 64))

(assert (=> d!37714 (= lt!181114 (bvmul lt!181118 lt!181117))))

(assert (=> d!37714 (or (= lt!181118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181117 (bvsdiv (bvmul lt!181118 lt!181117) lt!181118)))))

(assert (=> d!37714 (= lt!181117 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37714 (= lt!181118 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181028)))))))

(assert (=> d!37714 (= lt!181119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028)))))))

(assert (=> d!37714 (invariant!0 (currentBit!5465 (_2!5197 lt!181028)) (currentByte!5470 (_2!5197 lt!181028)) (size!2405 (buf!2821 (_2!5197 lt!181028))))))

(assert (=> d!37714 (= (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))) lt!181119)))

(declare-fun b!118013 () Bool)

(declare-fun res!97650 () Bool)

(assert (=> b!118013 (=> (not res!97650) (not e!77368))))

(assert (=> b!118013 (= res!97650 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181119))))

(declare-fun b!118014 () Bool)

(declare-fun lt!181116 () (_ BitVec 64))

(assert (=> b!118014 (= e!77368 (bvsle lt!181119 (bvmul lt!181116 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118014 (or (= lt!181116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181116)))))

(assert (=> b!118014 (= lt!181116 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181028)))))))

(assert (= (and d!37714 res!97649) b!118013))

(assert (= (and b!118013 res!97650) b!118014))

(declare-fun m!177141 () Bool)

(assert (=> d!37714 m!177141))

(assert (=> d!37714 m!177133))

(assert (=> b!117952 d!37714))

(declare-fun d!37716 () Bool)

(declare-fun e!77369 () Bool)

(assert (=> d!37716 e!77369))

(declare-fun res!97651 () Bool)

(assert (=> d!37716 (=> (not res!97651) (not e!77369))))

(declare-fun lt!181120 () (_ BitVec 64))

(declare-fun lt!181125 () (_ BitVec 64))

(declare-fun lt!181121 () (_ BitVec 64))

(assert (=> d!37716 (= res!97651 (= lt!181125 (bvsub lt!181120 lt!181121)))))

(assert (=> d!37716 (or (= (bvand lt!181120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181120 lt!181121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37716 (= lt!181121 (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 thiss!1305))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305))))))

(declare-fun lt!181124 () (_ BitVec 64))

(declare-fun lt!181123 () (_ BitVec 64))

(assert (=> d!37716 (= lt!181120 (bvmul lt!181124 lt!181123))))

(assert (=> d!37716 (or (= lt!181124 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181123 (bvsdiv (bvmul lt!181124 lt!181123) lt!181124)))))

(assert (=> d!37716 (= lt!181123 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37716 (= lt!181124 ((_ sign_extend 32) (size!2405 (buf!2821 thiss!1305))))))

(assert (=> d!37716 (= lt!181125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5470 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5465 thiss!1305))))))

(assert (=> d!37716 (invariant!0 (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305) (size!2405 (buf!2821 thiss!1305)))))

(assert (=> d!37716 (= (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)) lt!181125)))

(declare-fun b!118015 () Bool)

(declare-fun res!97652 () Bool)

(assert (=> b!118015 (=> (not res!97652) (not e!77369))))

(assert (=> b!118015 (= res!97652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181125))))

(declare-fun b!118016 () Bool)

(declare-fun lt!181122 () (_ BitVec 64))

(assert (=> b!118016 (= e!77369 (bvsle lt!181125 (bvmul lt!181122 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118016 (or (= lt!181122 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181122 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181122)))))

(assert (=> b!118016 (= lt!181122 ((_ sign_extend 32) (size!2405 (buf!2821 thiss!1305))))))

(assert (= (and d!37716 res!97651) b!118015))

(assert (= (and b!118015 res!97652) b!118016))

(assert (=> d!37716 m!177135))

(declare-fun m!177143 () Bool)

(assert (=> d!37716 m!177143))

(assert (=> b!117952 d!37716))

(declare-fun d!37718 () Bool)

(assert (=> d!37718 (= (array_inv!2207 (buf!2821 thiss!1305)) (bvsge (size!2405 (buf!2821 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!117962 d!37718))

(declare-fun d!37720 () Bool)

(assert (=> d!37720 (= (invariant!0 (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181028)))) (and (bvsge (currentBit!5465 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5465 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5470 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181028)))) (and (= (currentBit!5465 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181028))))))))))

(assert (=> b!117953 d!37720))

(declare-fun d!37722 () Bool)

(assert (=> d!37722 (= (invariant!0 (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181015)))) (and (bvsge (currentBit!5465 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5465 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5470 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181015)))) (and (= (currentBit!5465 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5470 thiss!1305) (size!2405 (buf!2821 (_2!5197 lt!181015))))))))))

(assert (=> b!117955 d!37722))

(declare-fun d!37724 () Bool)

(assert (=> d!37724 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305) (size!2405 (buf!2821 thiss!1305))))))

(declare-fun bs!9127 () Bool)

(assert (= bs!9127 d!37724))

(assert (=> bs!9127 m!177143))

(assert (=> start!23224 d!37724))

(declare-fun d!37726 () Bool)

(assert (=> d!37726 (isPrefixOf!0 thiss!1305 (_2!5197 lt!181015))))

(declare-fun lt!181128 () Unit!7257)

(declare-fun choose!30 (BitStream!4284 BitStream!4284 BitStream!4284) Unit!7257)

(assert (=> d!37726 (= lt!181128 (choose!30 thiss!1305 (_2!5197 lt!181028) (_2!5197 lt!181015)))))

(assert (=> d!37726 (isPrefixOf!0 thiss!1305 (_2!5197 lt!181028))))

(assert (=> d!37726 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5197 lt!181028) (_2!5197 lt!181015)) lt!181128)))

(declare-fun bs!9128 () Bool)

(assert (= bs!9128 d!37726))

(assert (=> bs!9128 m!177045))

(declare-fun m!177145 () Bool)

(assert (=> bs!9128 m!177145))

(assert (=> bs!9128 m!177053))

(assert (=> b!117954 d!37726))

(declare-fun d!37728 () Bool)

(declare-fun res!97660 () Bool)

(declare-fun e!77375 () Bool)

(assert (=> d!37728 (=> (not res!97660) (not e!77375))))

(assert (=> d!37728 (= res!97660 (= (size!2405 (buf!2821 thiss!1305)) (size!2405 (buf!2821 (_2!5197 lt!181015)))))))

(assert (=> d!37728 (= (isPrefixOf!0 thiss!1305 (_2!5197 lt!181015)) e!77375)))

(declare-fun b!118023 () Bool)

(declare-fun res!97659 () Bool)

(assert (=> b!118023 (=> (not res!97659) (not e!77375))))

(assert (=> b!118023 (= res!97659 (bvsle (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)) (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181015))) (currentByte!5470 (_2!5197 lt!181015)) (currentBit!5465 (_2!5197 lt!181015)))))))

(declare-fun b!118024 () Bool)

(declare-fun e!77374 () Bool)

(assert (=> b!118024 (= e!77375 e!77374)))

(declare-fun res!97661 () Bool)

(assert (=> b!118024 (=> res!97661 e!77374)))

(assert (=> b!118024 (= res!97661 (= (size!2405 (buf!2821 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118025 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5302 array!5302 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118025 (= e!77374 (arrayBitRangesEq!0 (buf!2821 thiss!1305) (buf!2821 (_2!5197 lt!181015)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305))))))

(assert (= (and d!37728 res!97660) b!118023))

(assert (= (and b!118023 res!97659) b!118024))

(assert (= (and b!118024 (not res!97661)) b!118025))

(assert (=> b!118023 m!177061))

(declare-fun m!177147 () Bool)

(assert (=> b!118023 m!177147))

(assert (=> b!118025 m!177061))

(assert (=> b!118025 m!177061))

(declare-fun m!177149 () Bool)

(assert (=> b!118025 m!177149))

(assert (=> b!117954 d!37728))

(declare-fun d!37730 () Bool)

(declare-fun lt!181129 () tuple2!9880)

(assert (=> d!37730 (= lt!181129 (readBit!0 (_1!5198 lt!181023)))))

(assert (=> d!37730 (= (readBitPure!0 (_1!5198 lt!181023)) (tuple2!9869 (_2!5205 lt!181129) (_1!5205 lt!181129)))))

(declare-fun bs!9129 () Bool)

(assert (= bs!9129 d!37730))

(declare-fun m!177151 () Bool)

(assert (=> bs!9129 m!177151))

(assert (=> b!117954 d!37730))

(declare-fun d!37732 () Bool)

(declare-fun e!77378 () Bool)

(assert (=> d!37732 e!77378))

(declare-fun res!97664 () Bool)

(assert (=> d!37732 (=> (not res!97664) (not e!77378))))

(declare-fun lt!181139 () tuple2!9868)

(declare-fun lt!181141 () tuple2!9868)

(assert (=> d!37732 (= res!97664 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181139))) (currentByte!5470 (_1!5199 lt!181139)) (currentBit!5465 (_1!5199 lt!181139))) (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181141))) (currentByte!5470 (_1!5199 lt!181141)) (currentBit!5465 (_1!5199 lt!181141)))))))

(declare-fun lt!181138 () Unit!7257)

(declare-fun lt!181140 () BitStream!4284)

(declare-fun choose!50 (BitStream!4284 BitStream!4284 BitStream!4284 tuple2!9868 tuple2!9868 BitStream!4284 Bool tuple2!9868 tuple2!9868 BitStream!4284 Bool) Unit!7257)

(assert (=> d!37732 (= lt!181138 (choose!50 lt!181025 (_2!5197 lt!181015) lt!181140 lt!181139 (tuple2!9869 (_1!5199 lt!181139) (_2!5199 lt!181139)) (_1!5199 lt!181139) (_2!5199 lt!181139) lt!181141 (tuple2!9869 (_1!5199 lt!181141) (_2!5199 lt!181141)) (_1!5199 lt!181141) (_2!5199 lt!181141)))))

(assert (=> d!37732 (= lt!181141 (readBitPure!0 lt!181140))))

(assert (=> d!37732 (= lt!181139 (readBitPure!0 lt!181025))))

(assert (=> d!37732 (= lt!181140 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 lt!181025) (currentBit!5465 lt!181025)))))

(assert (=> d!37732 (invariant!0 (currentBit!5465 lt!181025) (currentByte!5470 lt!181025) (size!2405 (buf!2821 (_2!5197 lt!181015))))))

(assert (=> d!37732 (= (readBitPrefixLemma!0 lt!181025 (_2!5197 lt!181015)) lt!181138)))

(declare-fun b!118028 () Bool)

(assert (=> b!118028 (= e!77378 (= (_2!5199 lt!181139) (_2!5199 lt!181141)))))

(assert (= (and d!37732 res!97664) b!118028))

(declare-fun m!177153 () Bool)

(assert (=> d!37732 m!177153))

(declare-fun m!177155 () Bool)

(assert (=> d!37732 m!177155))

(declare-fun m!177157 () Bool)

(assert (=> d!37732 m!177157))

(declare-fun m!177159 () Bool)

(assert (=> d!37732 m!177159))

(declare-fun m!177161 () Bool)

(assert (=> d!37732 m!177161))

(assert (=> d!37732 m!177023))

(assert (=> b!117954 d!37732))

(declare-fun d!37734 () Bool)

(declare-datatypes ((tuple2!9882 0))(
  ( (tuple2!9883 (_1!5206 (_ BitVec 64)) (_2!5206 BitStream!4284)) )
))
(declare-fun lt!181144 () tuple2!9882)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9882)

(assert (=> d!37734 (= lt!181144 (readNLeastSignificantBitsLoop!0 (_1!5198 lt!181027) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!181010 (ite (_2!5199 lt!181014) lt!181029 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!37734 (= (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181027) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!181010 (ite (_2!5199 lt!181014) lt!181029 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9871 (_2!5206 lt!181144) (_1!5206 lt!181144)))))

(declare-fun bs!9130 () Bool)

(assert (= bs!9130 d!37734))

(declare-fun m!177163 () Bool)

(assert (=> bs!9130 m!177163))

(assert (=> b!117954 d!37734))

(declare-fun d!37736 () Bool)

(assert (=> d!37736 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028))) lt!181020)))

(declare-fun lt!181147 () Unit!7257)

(declare-fun choose!9 (BitStream!4284 array!5302 (_ BitVec 64) BitStream!4284) Unit!7257)

(assert (=> d!37736 (= lt!181147 (choose!9 (_2!5197 lt!181028) (buf!2821 (_2!5197 lt!181015)) lt!181020 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028)))))))

(assert (=> d!37736 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5197 lt!181028) (buf!2821 (_2!5197 lt!181015)) lt!181020) lt!181147)))

(declare-fun bs!9131 () Bool)

(assert (= bs!9131 d!37736))

(assert (=> bs!9131 m!177027))

(declare-fun m!177165 () Bool)

(assert (=> bs!9131 m!177165))

(assert (=> b!117954 d!37736))

(declare-fun b!118039 () Bool)

(declare-fun res!97671 () Bool)

(declare-fun e!77384 () Bool)

(assert (=> b!118039 (=> (not res!97671) (not e!77384))))

(declare-fun lt!181193 () tuple2!9866)

(assert (=> b!118039 (= res!97671 (isPrefixOf!0 (_1!5198 lt!181193) (_2!5197 lt!181028)))))

(declare-fun d!37738 () Bool)

(assert (=> d!37738 e!77384))

(declare-fun res!97673 () Bool)

(assert (=> d!37738 (=> (not res!97673) (not e!77384))))

(assert (=> d!37738 (= res!97673 (isPrefixOf!0 (_1!5198 lt!181193) (_2!5198 lt!181193)))))

(declare-fun lt!181194 () BitStream!4284)

(assert (=> d!37738 (= lt!181193 (tuple2!9867 lt!181194 (_2!5197 lt!181015)))))

(declare-fun lt!181205 () Unit!7257)

(declare-fun lt!181197 () Unit!7257)

(assert (=> d!37738 (= lt!181205 lt!181197)))

(assert (=> d!37738 (isPrefixOf!0 lt!181194 (_2!5197 lt!181015))))

(assert (=> d!37738 (= lt!181197 (lemmaIsPrefixTransitive!0 lt!181194 (_2!5197 lt!181015) (_2!5197 lt!181015)))))

(declare-fun lt!181196 () Unit!7257)

(declare-fun lt!181188 () Unit!7257)

(assert (=> d!37738 (= lt!181196 lt!181188)))

(assert (=> d!37738 (isPrefixOf!0 lt!181194 (_2!5197 lt!181015))))

(assert (=> d!37738 (= lt!181188 (lemmaIsPrefixTransitive!0 lt!181194 (_2!5197 lt!181028) (_2!5197 lt!181015)))))

(declare-fun lt!181198 () Unit!7257)

(declare-fun e!77383 () Unit!7257)

(assert (=> d!37738 (= lt!181198 e!77383)))

(declare-fun c!7093 () Bool)

(assert (=> d!37738 (= c!7093 (not (= (size!2405 (buf!2821 (_2!5197 lt!181028))) #b00000000000000000000000000000000)))))

(declare-fun lt!181189 () Unit!7257)

(declare-fun lt!181201 () Unit!7257)

(assert (=> d!37738 (= lt!181189 lt!181201)))

(assert (=> d!37738 (isPrefixOf!0 (_2!5197 lt!181015) (_2!5197 lt!181015))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4284) Unit!7257)

(assert (=> d!37738 (= lt!181201 (lemmaIsPrefixRefl!0 (_2!5197 lt!181015)))))

(declare-fun lt!181199 () Unit!7257)

(declare-fun lt!181206 () Unit!7257)

(assert (=> d!37738 (= lt!181199 lt!181206)))

(assert (=> d!37738 (= lt!181206 (lemmaIsPrefixRefl!0 (_2!5197 lt!181015)))))

(declare-fun lt!181207 () Unit!7257)

(declare-fun lt!181192 () Unit!7257)

(assert (=> d!37738 (= lt!181207 lt!181192)))

(assert (=> d!37738 (isPrefixOf!0 lt!181194 lt!181194)))

(assert (=> d!37738 (= lt!181192 (lemmaIsPrefixRefl!0 lt!181194))))

(declare-fun lt!181195 () Unit!7257)

(declare-fun lt!181202 () Unit!7257)

(assert (=> d!37738 (= lt!181195 lt!181202)))

(assert (=> d!37738 (isPrefixOf!0 (_2!5197 lt!181028) (_2!5197 lt!181028))))

(assert (=> d!37738 (= lt!181202 (lemmaIsPrefixRefl!0 (_2!5197 lt!181028)))))

(assert (=> d!37738 (= lt!181194 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))))))

(assert (=> d!37738 (isPrefixOf!0 (_2!5197 lt!181028) (_2!5197 lt!181015))))

(assert (=> d!37738 (= (reader!0 (_2!5197 lt!181028) (_2!5197 lt!181015)) lt!181193)))

(declare-fun b!118040 () Bool)

(declare-fun Unit!7261 () Unit!7257)

(assert (=> b!118040 (= e!77383 Unit!7261)))

(declare-fun b!118041 () Bool)

(declare-fun res!97672 () Bool)

(assert (=> b!118041 (=> (not res!97672) (not e!77384))))

(assert (=> b!118041 (= res!97672 (isPrefixOf!0 (_2!5198 lt!181193) (_2!5197 lt!181015)))))

(declare-fun lt!181203 () (_ BitVec 64))

(declare-fun lt!181190 () (_ BitVec 64))

(declare-fun b!118042 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4284 (_ BitVec 64)) BitStream!4284)

(assert (=> b!118042 (= e!77384 (= (_1!5198 lt!181193) (withMovedBitIndex!0 (_2!5198 lt!181193) (bvsub lt!181203 lt!181190))))))

(assert (=> b!118042 (or (= (bvand lt!181203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181190 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181203 lt!181190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118042 (= lt!181190 (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181015))) (currentByte!5470 (_2!5197 lt!181015)) (currentBit!5465 (_2!5197 lt!181015))))))

(assert (=> b!118042 (= lt!181203 (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))))))

(declare-fun b!118043 () Bool)

(declare-fun lt!181200 () Unit!7257)

(assert (=> b!118043 (= e!77383 lt!181200)))

(declare-fun lt!181191 () (_ BitVec 64))

(assert (=> b!118043 (= lt!181191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!181204 () (_ BitVec 64))

(assert (=> b!118043 (= lt!181204 (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5302 array!5302 (_ BitVec 64) (_ BitVec 64)) Unit!7257)

(assert (=> b!118043 (= lt!181200 (arrayBitRangesEqSymmetric!0 (buf!2821 (_2!5197 lt!181028)) (buf!2821 (_2!5197 lt!181015)) lt!181191 lt!181204))))

(assert (=> b!118043 (arrayBitRangesEq!0 (buf!2821 (_2!5197 lt!181015)) (buf!2821 (_2!5197 lt!181028)) lt!181191 lt!181204)))

(assert (= (and d!37738 c!7093) b!118043))

(assert (= (and d!37738 (not c!7093)) b!118040))

(assert (= (and d!37738 res!97673) b!118039))

(assert (= (and b!118039 res!97671) b!118041))

(assert (= (and b!118041 res!97672) b!118042))

(declare-fun m!177167 () Bool)

(assert (=> b!118042 m!177167))

(assert (=> b!118042 m!177147))

(assert (=> b!118042 m!177059))

(declare-fun m!177169 () Bool)

(assert (=> b!118041 m!177169))

(declare-fun m!177171 () Bool)

(assert (=> b!118039 m!177171))

(declare-fun m!177173 () Bool)

(assert (=> d!37738 m!177173))

(declare-fun m!177175 () Bool)

(assert (=> d!37738 m!177175))

(declare-fun m!177177 () Bool)

(assert (=> d!37738 m!177177))

(declare-fun m!177179 () Bool)

(assert (=> d!37738 m!177179))

(declare-fun m!177181 () Bool)

(assert (=> d!37738 m!177181))

(declare-fun m!177183 () Bool)

(assert (=> d!37738 m!177183))

(declare-fun m!177185 () Bool)

(assert (=> d!37738 m!177185))

(declare-fun m!177187 () Bool)

(assert (=> d!37738 m!177187))

(declare-fun m!177189 () Bool)

(assert (=> d!37738 m!177189))

(declare-fun m!177191 () Bool)

(assert (=> d!37738 m!177191))

(declare-fun m!177193 () Bool)

(assert (=> d!37738 m!177193))

(assert (=> b!118043 m!177059))

(declare-fun m!177195 () Bool)

(assert (=> b!118043 m!177195))

(declare-fun m!177197 () Bool)

(assert (=> b!118043 m!177197))

(assert (=> b!117954 d!37738))

(declare-fun d!37740 () Bool)

(declare-fun lt!181208 () tuple2!9880)

(assert (=> d!37740 (= lt!181208 (readBit!0 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305))))))

(assert (=> d!37740 (= (readBitPure!0 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305))) (tuple2!9869 (_2!5205 lt!181208) (_1!5205 lt!181208)))))

(declare-fun bs!9132 () Bool)

(assert (= bs!9132 d!37740))

(declare-fun m!177199 () Bool)

(assert (=> bs!9132 m!177199))

(assert (=> b!117954 d!37740))

(declare-fun d!37742 () Bool)

(declare-fun e!77462 () Bool)

(assert (=> d!37742 e!77462))

(declare-fun res!97795 () Bool)

(assert (=> d!37742 (=> (not res!97795) (not e!77462))))

(declare-fun lt!181604 () tuple2!9864)

(assert (=> d!37742 (= res!97795 (= (size!2405 (buf!2821 (_2!5197 lt!181028))) (size!2405 (buf!2821 (_2!5197 lt!181604)))))))

(declare-fun e!77464 () tuple2!9864)

(assert (=> d!37742 (= lt!181604 e!77464)))

(declare-fun c!7106 () Bool)

(assert (=> d!37742 (= c!7106 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37742 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37742 (= (appendNLeastSignificantBitsLoop!0 (_2!5197 lt!181028) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!181604)))

(declare-fun b!118185 () Bool)

(declare-fun lt!181584 () tuple2!9868)

(declare-fun lt!181586 () tuple2!9864)

(assert (=> b!118185 (= lt!181584 (readBitPure!0 (readerFrom!0 (_2!5197 lt!181586) (currentBit!5465 (_2!5197 lt!181028)) (currentByte!5470 (_2!5197 lt!181028)))))))

(declare-fun lt!181601 () Bool)

(declare-fun res!97800 () Bool)

(assert (=> b!118185 (= res!97800 (and (= (_2!5199 lt!181584) lt!181601) (= (_1!5199 lt!181584) (_2!5197 lt!181586))))))

(declare-fun e!77461 () Bool)

(assert (=> b!118185 (=> (not res!97800) (not e!77461))))

(declare-fun e!77466 () Bool)

(assert (=> b!118185 (= e!77466 e!77461)))

(declare-fun b!118186 () Bool)

(assert (=> b!118186 (= e!77461 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181584))) (currentByte!5470 (_1!5199 lt!181584)) (currentBit!5465 (_1!5199 lt!181584))) (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181586))) (currentByte!5470 (_2!5197 lt!181586)) (currentBit!5465 (_2!5197 lt!181586)))))))

(declare-fun b!118187 () Bool)

(declare-fun e!77465 () Bool)

(declare-fun lt!181582 () (_ BitVec 64))

(assert (=> b!118187 (= e!77465 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181028)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028))) lt!181582))))

(declare-fun b!118188 () Bool)

(declare-fun res!97796 () Bool)

(assert (=> b!118188 (=> (not res!97796) (not e!77462))))

(assert (=> b!118188 (= res!97796 (isPrefixOf!0 (_2!5197 lt!181028) (_2!5197 lt!181604)))))

(declare-fun bm!1526 () Bool)

(declare-fun lt!181610 () BitStream!4284)

(declare-fun call!1529 () Bool)

(declare-fun lt!181595 () tuple2!9864)

(assert (=> bm!1526 (= call!1529 (isPrefixOf!0 (ite c!7106 (_2!5197 lt!181028) lt!181610) (ite c!7106 (_2!5197 lt!181595) lt!181610)))))

(declare-fun b!118189 () Bool)

(declare-fun Unit!7262 () Unit!7257)

(assert (=> b!118189 (= e!77464 (tuple2!9865 Unit!7262 (_2!5197 lt!181595)))))

(assert (=> b!118189 (= lt!181601 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118189 (= lt!181586 (appendBit!0 (_2!5197 lt!181028) lt!181601))))

(declare-fun res!97793 () Bool)

(assert (=> b!118189 (= res!97793 (= (size!2405 (buf!2821 (_2!5197 lt!181028))) (size!2405 (buf!2821 (_2!5197 lt!181586)))))))

(assert (=> b!118189 (=> (not res!97793) (not e!77466))))

(assert (=> b!118189 e!77466))

(declare-fun lt!181607 () tuple2!9864)

(assert (=> b!118189 (= lt!181607 lt!181586)))

(assert (=> b!118189 (= lt!181595 (appendNLeastSignificantBitsLoop!0 (_2!5197 lt!181607) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!181596 () Unit!7257)

(assert (=> b!118189 (= lt!181596 (lemmaIsPrefixTransitive!0 (_2!5197 lt!181028) (_2!5197 lt!181607) (_2!5197 lt!181595)))))

(assert (=> b!118189 call!1529))

(declare-fun lt!181592 () Unit!7257)

(assert (=> b!118189 (= lt!181592 lt!181596)))

(assert (=> b!118189 (invariant!0 (currentBit!5465 (_2!5197 lt!181028)) (currentByte!5470 (_2!5197 lt!181028)) (size!2405 (buf!2821 (_2!5197 lt!181607))))))

(declare-fun lt!181578 () BitStream!4284)

(assert (=> b!118189 (= lt!181578 (BitStream!4285 (buf!2821 (_2!5197 lt!181607)) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))))))

(assert (=> b!118189 (invariant!0 (currentBit!5465 lt!181578) (currentByte!5470 lt!181578) (size!2405 (buf!2821 (_2!5197 lt!181595))))))

(declare-fun lt!181594 () BitStream!4284)

(assert (=> b!118189 (= lt!181594 (BitStream!4285 (buf!2821 (_2!5197 lt!181595)) (currentByte!5470 lt!181578) (currentBit!5465 lt!181578)))))

(declare-fun lt!181615 () tuple2!9868)

(assert (=> b!118189 (= lt!181615 (readBitPure!0 lt!181578))))

(declare-fun lt!181591 () tuple2!9868)

(assert (=> b!118189 (= lt!181591 (readBitPure!0 lt!181594))))

(declare-fun lt!181575 () Unit!7257)

(assert (=> b!118189 (= lt!181575 (readBitPrefixLemma!0 lt!181578 (_2!5197 lt!181595)))))

(declare-fun res!97798 () Bool)

(assert (=> b!118189 (= res!97798 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181615))) (currentByte!5470 (_1!5199 lt!181615)) (currentBit!5465 (_1!5199 lt!181615))) (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181591))) (currentByte!5470 (_1!5199 lt!181591)) (currentBit!5465 (_1!5199 lt!181591)))))))

(declare-fun e!77460 () Bool)

(assert (=> b!118189 (=> (not res!97798) (not e!77460))))

(assert (=> b!118189 e!77460))

(declare-fun lt!181608 () Unit!7257)

(assert (=> b!118189 (= lt!181608 lt!181575)))

(declare-fun lt!181600 () tuple2!9866)

(assert (=> b!118189 (= lt!181600 (reader!0 (_2!5197 lt!181028) (_2!5197 lt!181595)))))

(declare-fun lt!181609 () tuple2!9866)

(assert (=> b!118189 (= lt!181609 (reader!0 (_2!5197 lt!181607) (_2!5197 lt!181595)))))

(declare-fun lt!181580 () tuple2!9868)

(assert (=> b!118189 (= lt!181580 (readBitPure!0 (_1!5198 lt!181600)))))

(assert (=> b!118189 (= (_2!5199 lt!181580) lt!181601)))

(declare-fun lt!181577 () Unit!7257)

(declare-fun Unit!7263 () Unit!7257)

(assert (=> b!118189 (= lt!181577 Unit!7263)))

(declare-fun lt!181589 () (_ BitVec 64))

(assert (=> b!118189 (= lt!181589 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!181571 () (_ BitVec 64))

(assert (=> b!118189 (= lt!181571 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!181606 () Unit!7257)

(assert (=> b!118189 (= lt!181606 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5197 lt!181028) (buf!2821 (_2!5197 lt!181595)) lt!181571))))

(assert (=> b!118189 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181595)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028))) lt!181571)))

(declare-fun lt!181585 () Unit!7257)

(assert (=> b!118189 (= lt!181585 lt!181606)))

(declare-fun lt!181573 () tuple2!9870)

(assert (=> b!118189 (= lt!181573 (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181600) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181589))))

(declare-fun lt!181599 () (_ BitVec 64))

(assert (=> b!118189 (= lt!181599 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!181588 () Unit!7257)

(assert (=> b!118189 (= lt!181588 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5197 lt!181607) (buf!2821 (_2!5197 lt!181595)) lt!181599))))

(assert (=> b!118189 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181595)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181607))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181607))) lt!181599)))

(declare-fun lt!181598 () Unit!7257)

(assert (=> b!118189 (= lt!181598 lt!181588)))

(declare-fun lt!181576 () tuple2!9870)

(assert (=> b!118189 (= lt!181576 (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181609) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!181589 (ite (_2!5199 lt!181580) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!181614 () tuple2!9870)

(assert (=> b!118189 (= lt!181614 (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181600) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181589))))

(declare-fun c!7105 () Bool)

(assert (=> b!118189 (= c!7105 (_2!5199 (readBitPure!0 (_1!5198 lt!181600))))))

(declare-fun lt!181612 () tuple2!9870)

(declare-fun e!77463 () (_ BitVec 64))

(assert (=> b!118189 (= lt!181612 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5198 lt!181600) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!181589 e!77463)))))

(declare-fun lt!181579 () Unit!7257)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7257)

(assert (=> b!118189 (= lt!181579 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5198 lt!181600) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181589))))

(assert (=> b!118189 (and (= (_2!5200 lt!181614) (_2!5200 lt!181612)) (= (_1!5200 lt!181614) (_1!5200 lt!181612)))))

(declare-fun lt!181574 () Unit!7257)

(assert (=> b!118189 (= lt!181574 lt!181579)))

(assert (=> b!118189 (= (_1!5198 lt!181600) (withMovedBitIndex!0 (_2!5198 lt!181600) (bvsub (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))) (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181595))) (currentByte!5470 (_2!5197 lt!181595)) (currentBit!5465 (_2!5197 lt!181595))))))))

(declare-fun lt!181602 () Unit!7257)

(declare-fun Unit!7264 () Unit!7257)

(assert (=> b!118189 (= lt!181602 Unit!7264)))

(assert (=> b!118189 (= (_1!5198 lt!181609) (withMovedBitIndex!0 (_2!5198 lt!181609) (bvsub (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181607))) (currentByte!5470 (_2!5197 lt!181607)) (currentBit!5465 (_2!5197 lt!181607))) (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181595))) (currentByte!5470 (_2!5197 lt!181595)) (currentBit!5465 (_2!5197 lt!181595))))))))

(declare-fun lt!181593 () Unit!7257)

(declare-fun Unit!7265 () Unit!7257)

(assert (=> b!118189 (= lt!181593 Unit!7265)))

(assert (=> b!118189 (= (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))) (bvsub (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181607))) (currentByte!5470 (_2!5197 lt!181607)) (currentBit!5465 (_2!5197 lt!181607))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!181587 () Unit!7257)

(declare-fun Unit!7266 () Unit!7257)

(assert (=> b!118189 (= lt!181587 Unit!7266)))

(assert (=> b!118189 (= (_2!5200 lt!181573) (_2!5200 lt!181576))))

(declare-fun lt!181611 () Unit!7257)

(declare-fun Unit!7267 () Unit!7257)

(assert (=> b!118189 (= lt!181611 Unit!7267)))

(assert (=> b!118189 (= (_1!5200 lt!181573) (_2!5198 lt!181600))))

(declare-fun b!118190 () Bool)

(assert (=> b!118190 (= e!77463 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!118191 () Bool)

(assert (=> b!118191 (= e!77460 (= (_2!5199 lt!181615) (_2!5199 lt!181591)))))

(declare-fun b!118192 () Bool)

(declare-fun res!97797 () Bool)

(assert (=> b!118192 (=> (not res!97797) (not e!77462))))

(declare-fun lt!181572 () (_ BitVec 64))

(declare-fun lt!181605 () (_ BitVec 64))

(assert (=> b!118192 (= res!97797 (= (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181604))) (currentByte!5470 (_2!5197 lt!181604)) (currentBit!5465 (_2!5197 lt!181604))) (bvadd lt!181572 lt!181605)))))

(assert (=> b!118192 (or (not (= (bvand lt!181572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181605 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!181572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!181572 lt!181605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118192 (= lt!181605 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118192 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118192 (= lt!181572 (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))))))

(declare-fun b!118193 () Bool)

(assert (=> b!118193 (= e!77463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!118194 () Bool)

(declare-fun res!97794 () Bool)

(assert (=> b!118194 (= res!97794 (= (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181586))) (currentByte!5470 (_2!5197 lt!181586)) (currentBit!5465 (_2!5197 lt!181586))) (bvadd (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!118194 (=> (not res!97794) (not e!77466))))

(declare-fun b!118195 () Bool)

(declare-fun lt!181613 () Unit!7257)

(assert (=> b!118195 (= e!77464 (tuple2!9865 lt!181613 (_2!5197 lt!181028)))))

(assert (=> b!118195 (= lt!181610 (_2!5197 lt!181028))))

(assert (=> b!118195 (= lt!181613 (lemmaIsPrefixRefl!0 lt!181610))))

(assert (=> b!118195 call!1529))

(declare-fun b!118196 () Bool)

(declare-fun res!97799 () Bool)

(assert (=> b!118196 (= res!97799 (isPrefixOf!0 (_2!5197 lt!181028) (_2!5197 lt!181586)))))

(assert (=> b!118196 (=> (not res!97799) (not e!77466))))

(declare-fun lt!181597 () tuple2!9870)

(declare-fun b!118197 () Bool)

(declare-fun lt!181590 () tuple2!9866)

(assert (=> b!118197 (= e!77462 (and (= (_2!5200 lt!181597) v!199) (= (_1!5200 lt!181597) (_2!5198 lt!181590))))))

(declare-fun lt!181603 () (_ BitVec 64))

(assert (=> b!118197 (= lt!181597 (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181590) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181603))))

(declare-fun lt!181581 () Unit!7257)

(declare-fun lt!181583 () Unit!7257)

(assert (=> b!118197 (= lt!181581 lt!181583)))

(assert (=> b!118197 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181604)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028))) lt!181582)))

(assert (=> b!118197 (= lt!181583 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5197 lt!181028) (buf!2821 (_2!5197 lt!181604)) lt!181582))))

(assert (=> b!118197 e!77465))

(declare-fun res!97801 () Bool)

(assert (=> b!118197 (=> (not res!97801) (not e!77465))))

(assert (=> b!118197 (= res!97801 (and (= (size!2405 (buf!2821 (_2!5197 lt!181028))) (size!2405 (buf!2821 (_2!5197 lt!181604)))) (bvsge lt!181582 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118197 (= lt!181582 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118197 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118197 (= lt!181603 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!118197 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118197 (= lt!181590 (reader!0 (_2!5197 lt!181028) (_2!5197 lt!181604)))))

(assert (= (and d!37742 c!7106) b!118189))

(assert (= (and d!37742 (not c!7106)) b!118195))

(assert (= (and b!118189 res!97793) b!118194))

(assert (= (and b!118194 res!97794) b!118196))

(assert (= (and b!118196 res!97799) b!118185))

(assert (= (and b!118185 res!97800) b!118186))

(assert (= (and b!118189 res!97798) b!118191))

(assert (= (and b!118189 c!7105) b!118190))

(assert (= (and b!118189 (not c!7105)) b!118193))

(assert (= (or b!118189 b!118195) bm!1526))

(assert (= (and d!37742 res!97795) b!118192))

(assert (= (and b!118192 res!97797) b!118188))

(assert (= (and b!118188 res!97796) b!118197))

(assert (= (and b!118197 res!97801) b!118187))

(declare-fun m!177397 () Bool)

(assert (=> bm!1526 m!177397))

(declare-fun m!177399 () Bool)

(assert (=> b!118188 m!177399))

(declare-fun m!177401 () Bool)

(assert (=> b!118185 m!177401))

(assert (=> b!118185 m!177401))

(declare-fun m!177403 () Bool)

(assert (=> b!118185 m!177403))

(declare-fun m!177405 () Bool)

(assert (=> b!118197 m!177405))

(declare-fun m!177407 () Bool)

(assert (=> b!118197 m!177407))

(declare-fun m!177409 () Bool)

(assert (=> b!118197 m!177409))

(declare-fun m!177411 () Bool)

(assert (=> b!118197 m!177411))

(declare-fun m!177413 () Bool)

(assert (=> b!118197 m!177413))

(declare-fun m!177415 () Bool)

(assert (=> b!118196 m!177415))

(declare-fun m!177417 () Bool)

(assert (=> b!118186 m!177417))

(declare-fun m!177419 () Bool)

(assert (=> b!118186 m!177419))

(declare-fun m!177421 () Bool)

(assert (=> b!118195 m!177421))

(assert (=> b!118189 m!177405))

(declare-fun m!177423 () Bool)

(assert (=> b!118189 m!177423))

(declare-fun m!177425 () Bool)

(assert (=> b!118189 m!177425))

(declare-fun m!177427 () Bool)

(assert (=> b!118189 m!177427))

(declare-fun m!177429 () Bool)

(assert (=> b!118189 m!177429))

(declare-fun m!177431 () Bool)

(assert (=> b!118189 m!177431))

(declare-fun m!177433 () Bool)

(assert (=> b!118189 m!177433))

(declare-fun m!177435 () Bool)

(assert (=> b!118189 m!177435))

(declare-fun m!177437 () Bool)

(assert (=> b!118189 m!177437))

(declare-fun m!177439 () Bool)

(assert (=> b!118189 m!177439))

(declare-fun m!177441 () Bool)

(assert (=> b!118189 m!177441))

(declare-fun m!177443 () Bool)

(assert (=> b!118189 m!177443))

(declare-fun m!177445 () Bool)

(assert (=> b!118189 m!177445))

(declare-fun m!177447 () Bool)

(assert (=> b!118189 m!177447))

(declare-fun m!177449 () Bool)

(assert (=> b!118189 m!177449))

(declare-fun m!177451 () Bool)

(assert (=> b!118189 m!177451))

(declare-fun m!177453 () Bool)

(assert (=> b!118189 m!177453))

(declare-fun m!177455 () Bool)

(assert (=> b!118189 m!177455))

(declare-fun m!177457 () Bool)

(assert (=> b!118189 m!177457))

(assert (=> b!118189 m!177059))

(declare-fun m!177459 () Bool)

(assert (=> b!118189 m!177459))

(declare-fun m!177461 () Bool)

(assert (=> b!118189 m!177461))

(declare-fun m!177463 () Bool)

(assert (=> b!118189 m!177463))

(declare-fun m!177465 () Bool)

(assert (=> b!118189 m!177465))

(declare-fun m!177467 () Bool)

(assert (=> b!118189 m!177467))

(declare-fun m!177469 () Bool)

(assert (=> b!118189 m!177469))

(declare-fun m!177471 () Bool)

(assert (=> b!118189 m!177471))

(assert (=> b!118189 m!177429))

(declare-fun m!177473 () Bool)

(assert (=> b!118189 m!177473))

(declare-fun m!177475 () Bool)

(assert (=> b!118192 m!177475))

(assert (=> b!118192 m!177059))

(declare-fun m!177477 () Bool)

(assert (=> b!118187 m!177477))

(assert (=> b!118194 m!177419))

(assert (=> b!118194 m!177059))

(assert (=> b!117954 d!37742))

(declare-fun b!118198 () Bool)

(declare-fun res!97802 () Bool)

(declare-fun e!77468 () Bool)

(assert (=> b!118198 (=> (not res!97802) (not e!77468))))

(declare-fun lt!181621 () tuple2!9866)

(assert (=> b!118198 (= res!97802 (isPrefixOf!0 (_1!5198 lt!181621) thiss!1305))))

(declare-fun d!37830 () Bool)

(assert (=> d!37830 e!77468))

(declare-fun res!97804 () Bool)

(assert (=> d!37830 (=> (not res!97804) (not e!77468))))

(assert (=> d!37830 (= res!97804 (isPrefixOf!0 (_1!5198 lt!181621) (_2!5198 lt!181621)))))

(declare-fun lt!181622 () BitStream!4284)

(assert (=> d!37830 (= lt!181621 (tuple2!9867 lt!181622 (_2!5197 lt!181015)))))

(declare-fun lt!181633 () Unit!7257)

(declare-fun lt!181625 () Unit!7257)

(assert (=> d!37830 (= lt!181633 lt!181625)))

(assert (=> d!37830 (isPrefixOf!0 lt!181622 (_2!5197 lt!181015))))

(assert (=> d!37830 (= lt!181625 (lemmaIsPrefixTransitive!0 lt!181622 (_2!5197 lt!181015) (_2!5197 lt!181015)))))

(declare-fun lt!181624 () Unit!7257)

(declare-fun lt!181616 () Unit!7257)

(assert (=> d!37830 (= lt!181624 lt!181616)))

(assert (=> d!37830 (isPrefixOf!0 lt!181622 (_2!5197 lt!181015))))

(assert (=> d!37830 (= lt!181616 (lemmaIsPrefixTransitive!0 lt!181622 thiss!1305 (_2!5197 lt!181015)))))

(declare-fun lt!181626 () Unit!7257)

(declare-fun e!77467 () Unit!7257)

(assert (=> d!37830 (= lt!181626 e!77467)))

(declare-fun c!7107 () Bool)

(assert (=> d!37830 (= c!7107 (not (= (size!2405 (buf!2821 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!181617 () Unit!7257)

(declare-fun lt!181629 () Unit!7257)

(assert (=> d!37830 (= lt!181617 lt!181629)))

(assert (=> d!37830 (isPrefixOf!0 (_2!5197 lt!181015) (_2!5197 lt!181015))))

(assert (=> d!37830 (= lt!181629 (lemmaIsPrefixRefl!0 (_2!5197 lt!181015)))))

(declare-fun lt!181627 () Unit!7257)

(declare-fun lt!181634 () Unit!7257)

(assert (=> d!37830 (= lt!181627 lt!181634)))

(assert (=> d!37830 (= lt!181634 (lemmaIsPrefixRefl!0 (_2!5197 lt!181015)))))

(declare-fun lt!181635 () Unit!7257)

(declare-fun lt!181620 () Unit!7257)

(assert (=> d!37830 (= lt!181635 lt!181620)))

(assert (=> d!37830 (isPrefixOf!0 lt!181622 lt!181622)))

(assert (=> d!37830 (= lt!181620 (lemmaIsPrefixRefl!0 lt!181622))))

(declare-fun lt!181623 () Unit!7257)

(declare-fun lt!181630 () Unit!7257)

(assert (=> d!37830 (= lt!181623 lt!181630)))

(assert (=> d!37830 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37830 (= lt!181630 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37830 (= lt!181622 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)))))

(assert (=> d!37830 (isPrefixOf!0 thiss!1305 (_2!5197 lt!181015))))

(assert (=> d!37830 (= (reader!0 thiss!1305 (_2!5197 lt!181015)) lt!181621)))

(declare-fun b!118199 () Bool)

(declare-fun Unit!7268 () Unit!7257)

(assert (=> b!118199 (= e!77467 Unit!7268)))

(declare-fun b!118200 () Bool)

(declare-fun res!97803 () Bool)

(assert (=> b!118200 (=> (not res!97803) (not e!77468))))

(assert (=> b!118200 (= res!97803 (isPrefixOf!0 (_2!5198 lt!181621) (_2!5197 lt!181015)))))

(declare-fun lt!181631 () (_ BitVec 64))

(declare-fun b!118201 () Bool)

(declare-fun lt!181618 () (_ BitVec 64))

(assert (=> b!118201 (= e!77468 (= (_1!5198 lt!181621) (withMovedBitIndex!0 (_2!5198 lt!181621) (bvsub lt!181631 lt!181618))))))

(assert (=> b!118201 (or (= (bvand lt!181631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181631 lt!181618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118201 (= lt!181618 (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181015))) (currentByte!5470 (_2!5197 lt!181015)) (currentBit!5465 (_2!5197 lt!181015))))))

(assert (=> b!118201 (= lt!181631 (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)))))

(declare-fun b!118202 () Bool)

(declare-fun lt!181628 () Unit!7257)

(assert (=> b!118202 (= e!77467 lt!181628)))

(declare-fun lt!181619 () (_ BitVec 64))

(assert (=> b!118202 (= lt!181619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!181632 () (_ BitVec 64))

(assert (=> b!118202 (= lt!181632 (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)))))

(assert (=> b!118202 (= lt!181628 (arrayBitRangesEqSymmetric!0 (buf!2821 thiss!1305) (buf!2821 (_2!5197 lt!181015)) lt!181619 lt!181632))))

(assert (=> b!118202 (arrayBitRangesEq!0 (buf!2821 (_2!5197 lt!181015)) (buf!2821 thiss!1305) lt!181619 lt!181632)))

(assert (= (and d!37830 c!7107) b!118202))

(assert (= (and d!37830 (not c!7107)) b!118199))

(assert (= (and d!37830 res!97804) b!118198))

(assert (= (and b!118198 res!97802) b!118200))

(assert (= (and b!118200 res!97803) b!118201))

(declare-fun m!177479 () Bool)

(assert (=> b!118201 m!177479))

(assert (=> b!118201 m!177147))

(assert (=> b!118201 m!177061))

(declare-fun m!177481 () Bool)

(assert (=> b!118200 m!177481))

(declare-fun m!177483 () Bool)

(assert (=> b!118198 m!177483))

(declare-fun m!177485 () Bool)

(assert (=> d!37830 m!177485))

(declare-fun m!177487 () Bool)

(assert (=> d!37830 m!177487))

(declare-fun m!177489 () Bool)

(assert (=> d!37830 m!177489))

(declare-fun m!177491 () Bool)

(assert (=> d!37830 m!177491))

(declare-fun m!177493 () Bool)

(assert (=> d!37830 m!177493))

(assert (=> d!37830 m!177183))

(assert (=> d!37830 m!177185))

(assert (=> d!37830 m!177045))

(declare-fun m!177495 () Bool)

(assert (=> d!37830 m!177495))

(declare-fun m!177497 () Bool)

(assert (=> d!37830 m!177497))

(declare-fun m!177499 () Bool)

(assert (=> d!37830 m!177499))

(assert (=> b!118202 m!177061))

(declare-fun m!177501 () Bool)

(assert (=> b!118202 m!177501))

(declare-fun m!177503 () Bool)

(assert (=> b!118202 m!177503))

(assert (=> b!117954 d!37830))

(declare-fun d!37832 () Bool)

(declare-fun lt!181636 () tuple2!9880)

(assert (=> d!37832 (= lt!181636 (readBit!0 lt!181025))))

(assert (=> d!37832 (= (readBitPure!0 lt!181025) (tuple2!9869 (_2!5205 lt!181636) (_1!5205 lt!181636)))))

(declare-fun bs!9150 () Bool)

(assert (= bs!9150 d!37832))

(declare-fun m!177505 () Bool)

(assert (=> bs!9150 m!177505))

(assert (=> b!117954 d!37832))

(declare-fun d!37834 () Bool)

(declare-fun lt!181637 () tuple2!9882)

(assert (=> d!37834 (= lt!181637 (readNLeastSignificantBitsLoop!0 (_1!5198 lt!181023) nBits!396 i!615 lt!181010))))

(assert (=> d!37834 (= (readNLeastSignificantBitsLoopPure!0 (_1!5198 lt!181023) nBits!396 i!615 lt!181010) (tuple2!9871 (_2!5206 lt!181637) (_1!5206 lt!181637)))))

(declare-fun bs!9151 () Bool)

(assert (= bs!9151 d!37834))

(declare-fun m!177507 () Bool)

(assert (=> bs!9151 m!177507))

(assert (=> b!117954 d!37834))

(declare-fun d!37836 () Bool)

(declare-fun e!77469 () Bool)

(assert (=> d!37836 e!77469))

(declare-fun res!97805 () Bool)

(assert (=> d!37836 (=> (not res!97805) (not e!77469))))

(declare-fun lt!181643 () (_ BitVec 64))

(declare-fun lt!181639 () (_ BitVec 64))

(declare-fun lt!181638 () (_ BitVec 64))

(assert (=> d!37836 (= res!97805 (= lt!181643 (bvsub lt!181638 lt!181639)))))

(assert (=> d!37836 (or (= (bvand lt!181638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181638 lt!181639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37836 (= lt!181639 (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181022)))) ((_ sign_extend 32) (currentByte!5470 (_1!5199 lt!181022))) ((_ sign_extend 32) (currentBit!5465 (_1!5199 lt!181022)))))))

(declare-fun lt!181642 () (_ BitVec 64))

(declare-fun lt!181641 () (_ BitVec 64))

(assert (=> d!37836 (= lt!181638 (bvmul lt!181642 lt!181641))))

(assert (=> d!37836 (or (= lt!181642 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181641 (bvsdiv (bvmul lt!181642 lt!181641) lt!181642)))))

(assert (=> d!37836 (= lt!181641 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37836 (= lt!181642 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181022)))))))

(assert (=> d!37836 (= lt!181643 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5470 (_1!5199 lt!181022))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5465 (_1!5199 lt!181022)))))))

(assert (=> d!37836 (invariant!0 (currentBit!5465 (_1!5199 lt!181022)) (currentByte!5470 (_1!5199 lt!181022)) (size!2405 (buf!2821 (_1!5199 lt!181022))))))

(assert (=> d!37836 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181022))) (currentByte!5470 (_1!5199 lt!181022)) (currentBit!5465 (_1!5199 lt!181022))) lt!181643)))

(declare-fun b!118203 () Bool)

(declare-fun res!97806 () Bool)

(assert (=> b!118203 (=> (not res!97806) (not e!77469))))

(assert (=> b!118203 (= res!97806 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181643))))

(declare-fun b!118204 () Bool)

(declare-fun lt!181640 () (_ BitVec 64))

(assert (=> b!118204 (= e!77469 (bvsle lt!181643 (bvmul lt!181640 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118204 (or (= lt!181640 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181640 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181640)))))

(assert (=> b!118204 (= lt!181640 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181022)))))))

(assert (= (and d!37836 res!97805) b!118203))

(assert (= (and b!118203 res!97806) b!118204))

(declare-fun m!177509 () Bool)

(assert (=> d!37836 m!177509))

(declare-fun m!177511 () Bool)

(assert (=> d!37836 m!177511))

(assert (=> b!117954 d!37836))

(declare-fun d!37838 () Bool)

(assert (=> d!37838 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!117954 d!37838))

(declare-fun d!37840 () Bool)

(assert (=> d!37840 (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305)) lt!181016)))

(declare-fun lt!181644 () Unit!7257)

(assert (=> d!37840 (= lt!181644 (choose!9 thiss!1305 (buf!2821 (_2!5197 lt!181015)) lt!181016 (BitStream!4285 (buf!2821 (_2!5197 lt!181015)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305))))))

(assert (=> d!37840 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2821 (_2!5197 lt!181015)) lt!181016) lt!181644)))

(declare-fun bs!9152 () Bool)

(assert (= bs!9152 d!37840))

(assert (=> bs!9152 m!177041))

(declare-fun m!177513 () Bool)

(assert (=> bs!9152 m!177513))

(assert (=> b!117954 d!37840))

(declare-fun d!37842 () Bool)

(assert (=> d!37842 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305)) lt!181016) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305))) lt!181016))))

(declare-fun bs!9153 () Bool)

(assert (= bs!9153 d!37842))

(declare-fun m!177515 () Bool)

(assert (=> bs!9153 m!177515))

(assert (=> b!117954 d!37842))

(declare-fun b!118215 () Bool)

(declare-fun res!97818 () Bool)

(declare-fun e!77475 () Bool)

(assert (=> b!118215 (=> (not res!97818) (not e!77475))))

(declare-fun lt!181656 () tuple2!9864)

(assert (=> b!118215 (= res!97818 (isPrefixOf!0 thiss!1305 (_2!5197 lt!181656)))))

(declare-fun b!118216 () Bool)

(declare-fun e!77474 () Bool)

(assert (=> b!118216 (= e!77475 e!77474)))

(declare-fun res!97817 () Bool)

(assert (=> b!118216 (=> (not res!97817) (not e!77474))))

(declare-fun lt!181654 () tuple2!9868)

(assert (=> b!118216 (= res!97817 (and (= (_2!5199 lt!181654) lt!181024) (= (_1!5199 lt!181654) (_2!5197 lt!181656))))))

(assert (=> b!118216 (= lt!181654 (readBitPure!0 (readerFrom!0 (_2!5197 lt!181656) (currentBit!5465 thiss!1305) (currentByte!5470 thiss!1305))))))

(declare-fun b!118217 () Bool)

(assert (=> b!118217 (= e!77474 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181654))) (currentByte!5470 (_1!5199 lt!181654)) (currentBit!5465 (_1!5199 lt!181654))) (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181656))) (currentByte!5470 (_2!5197 lt!181656)) (currentBit!5465 (_2!5197 lt!181656)))))))

(declare-fun b!118214 () Bool)

(declare-fun res!97815 () Bool)

(assert (=> b!118214 (=> (not res!97815) (not e!77475))))

(declare-fun lt!181653 () (_ BitVec 64))

(declare-fun lt!181655 () (_ BitVec 64))

(assert (=> b!118214 (= res!97815 (= (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181656))) (currentByte!5470 (_2!5197 lt!181656)) (currentBit!5465 (_2!5197 lt!181656))) (bvadd lt!181655 lt!181653)))))

(assert (=> b!118214 (or (not (= (bvand lt!181655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181653 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!181655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!181655 lt!181653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118214 (= lt!181653 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!118214 (= lt!181655 (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)))))

(declare-fun d!37844 () Bool)

(assert (=> d!37844 e!77475))

(declare-fun res!97816 () Bool)

(assert (=> d!37844 (=> (not res!97816) (not e!77475))))

(assert (=> d!37844 (= res!97816 (= (size!2405 (buf!2821 thiss!1305)) (size!2405 (buf!2821 (_2!5197 lt!181656)))))))

(declare-fun choose!16 (BitStream!4284 Bool) tuple2!9864)

(assert (=> d!37844 (= lt!181656 (choose!16 thiss!1305 lt!181024))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37844 (validate_offset_bit!0 ((_ sign_extend 32) (size!2405 (buf!2821 thiss!1305))) ((_ sign_extend 32) (currentByte!5470 thiss!1305)) ((_ sign_extend 32) (currentBit!5465 thiss!1305)))))

(assert (=> d!37844 (= (appendBit!0 thiss!1305 lt!181024) lt!181656)))

(assert (= (and d!37844 res!97816) b!118214))

(assert (= (and b!118214 res!97815) b!118215))

(assert (= (and b!118215 res!97818) b!118216))

(assert (= (and b!118216 res!97817) b!118217))

(declare-fun m!177517 () Bool)

(assert (=> b!118214 m!177517))

(assert (=> b!118214 m!177061))

(declare-fun m!177519 () Bool)

(assert (=> b!118217 m!177519))

(assert (=> b!118217 m!177517))

(declare-fun m!177521 () Bool)

(assert (=> b!118215 m!177521))

(declare-fun m!177523 () Bool)

(assert (=> b!118216 m!177523))

(assert (=> b!118216 m!177523))

(declare-fun m!177525 () Bool)

(assert (=> b!118216 m!177525))

(declare-fun m!177527 () Bool)

(assert (=> d!37844 m!177527))

(declare-fun m!177529 () Bool)

(assert (=> d!37844 m!177529))

(assert (=> b!117954 d!37844))

(declare-fun d!37846 () Bool)

(assert (=> d!37846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028))) lt!181020) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 (_2!5197 lt!181015)))) ((_ sign_extend 32) (currentByte!5470 (_2!5197 lt!181028))) ((_ sign_extend 32) (currentBit!5465 (_2!5197 lt!181028)))) lt!181020))))

(declare-fun bs!9154 () Bool)

(assert (= bs!9154 d!37846))

(declare-fun m!177531 () Bool)

(assert (=> bs!9154 m!177531))

(assert (=> b!117954 d!37846))

(declare-fun d!37848 () Bool)

(declare-fun e!77476 () Bool)

(assert (=> d!37848 e!77476))

(declare-fun res!97819 () Bool)

(assert (=> d!37848 (=> (not res!97819) (not e!77476))))

(declare-fun lt!181662 () (_ BitVec 64))

(declare-fun lt!181657 () (_ BitVec 64))

(declare-fun lt!181658 () (_ BitVec 64))

(assert (=> d!37848 (= res!97819 (= lt!181662 (bvsub lt!181657 lt!181658)))))

(assert (=> d!37848 (or (= (bvand lt!181657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181658 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181657 lt!181658) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37848 (= lt!181658 (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181013)))) ((_ sign_extend 32) (currentByte!5470 (_1!5199 lt!181013))) ((_ sign_extend 32) (currentBit!5465 (_1!5199 lt!181013)))))))

(declare-fun lt!181661 () (_ BitVec 64))

(declare-fun lt!181660 () (_ BitVec 64))

(assert (=> d!37848 (= lt!181657 (bvmul lt!181661 lt!181660))))

(assert (=> d!37848 (or (= lt!181661 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181660 (bvsdiv (bvmul lt!181661 lt!181660) lt!181661)))))

(assert (=> d!37848 (= lt!181660 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37848 (= lt!181661 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181013)))))))

(assert (=> d!37848 (= lt!181662 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5470 (_1!5199 lt!181013))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5465 (_1!5199 lt!181013)))))))

(assert (=> d!37848 (invariant!0 (currentBit!5465 (_1!5199 lt!181013)) (currentByte!5470 (_1!5199 lt!181013)) (size!2405 (buf!2821 (_1!5199 lt!181013))))))

(assert (=> d!37848 (= (bitIndex!0 (size!2405 (buf!2821 (_1!5199 lt!181013))) (currentByte!5470 (_1!5199 lt!181013)) (currentBit!5465 (_1!5199 lt!181013))) lt!181662)))

(declare-fun b!118218 () Bool)

(declare-fun res!97820 () Bool)

(assert (=> b!118218 (=> (not res!97820) (not e!77476))))

(assert (=> b!118218 (= res!97820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181662))))

(declare-fun b!118219 () Bool)

(declare-fun lt!181659 () (_ BitVec 64))

(assert (=> b!118219 (= e!77476 (bvsle lt!181662 (bvmul lt!181659 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118219 (or (= lt!181659 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181659 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181659)))))

(assert (=> b!118219 (= lt!181659 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5199 lt!181013)))))))

(assert (= (and d!37848 res!97819) b!118218))

(assert (= (and b!118218 res!97820) b!118219))

(declare-fun m!177533 () Bool)

(assert (=> d!37848 m!177533))

(declare-fun m!177535 () Bool)

(assert (=> d!37848 m!177535))

(assert (=> b!117954 d!37848))

(declare-fun d!37850 () Bool)

(assert (=> d!37850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5198 lt!181023)))) ((_ sign_extend 32) (currentByte!5470 (_1!5198 lt!181023))) ((_ sign_extend 32) (currentBit!5465 (_1!5198 lt!181023))) lt!181016) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2405 (buf!2821 (_1!5198 lt!181023)))) ((_ sign_extend 32) (currentByte!5470 (_1!5198 lt!181023))) ((_ sign_extend 32) (currentBit!5465 (_1!5198 lt!181023)))) lt!181016))))

(declare-fun bs!9155 () Bool)

(assert (= bs!9155 d!37850))

(declare-fun m!177537 () Bool)

(assert (=> bs!9155 m!177537))

(assert (=> b!117956 d!37850))

(declare-fun d!37852 () Bool)

(declare-fun res!97822 () Bool)

(declare-fun e!77478 () Bool)

(assert (=> d!37852 (=> (not res!97822) (not e!77478))))

(assert (=> d!37852 (= res!97822 (= (size!2405 (buf!2821 thiss!1305)) (size!2405 (buf!2821 (_2!5197 lt!181028)))))))

(assert (=> d!37852 (= (isPrefixOf!0 thiss!1305 (_2!5197 lt!181028)) e!77478)))

(declare-fun b!118220 () Bool)

(declare-fun res!97821 () Bool)

(assert (=> b!118220 (=> (not res!97821) (not e!77478))))

(assert (=> b!118220 (= res!97821 (bvsle (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305)) (bitIndex!0 (size!2405 (buf!2821 (_2!5197 lt!181028))) (currentByte!5470 (_2!5197 lt!181028)) (currentBit!5465 (_2!5197 lt!181028)))))))

(declare-fun b!118221 () Bool)

(declare-fun e!77477 () Bool)

(assert (=> b!118221 (= e!77478 e!77477)))

(declare-fun res!97823 () Bool)

(assert (=> b!118221 (=> res!97823 e!77477)))

(assert (=> b!118221 (= res!97823 (= (size!2405 (buf!2821 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118222 () Bool)

(assert (=> b!118222 (= e!77477 (arrayBitRangesEq!0 (buf!2821 thiss!1305) (buf!2821 (_2!5197 lt!181028)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2405 (buf!2821 thiss!1305)) (currentByte!5470 thiss!1305) (currentBit!5465 thiss!1305))))))

(assert (= (and d!37852 res!97822) b!118220))

(assert (= (and b!118220 res!97821) b!118221))

(assert (= (and b!118221 (not res!97823)) b!118222))

(assert (=> b!118220 m!177061))

(assert (=> b!118220 m!177059))

(assert (=> b!118222 m!177061))

(assert (=> b!118222 m!177061))

(declare-fun m!177539 () Bool)

(assert (=> b!118222 m!177539))

(assert (=> b!117957 d!37852))

(check-sat (not b!118042) (not d!37706) (not d!37842) (not b!118215) (not bm!1526) (not b!118043) (not d!37832) (not b!118039) (not d!37712) (not b!118041) (not d!37740) (not b!118200) (not b!118006) (not d!37708) (not d!37830) (not d!37738) (not d!37734) (not d!37724) (not d!37848) (not d!37850) (not b!118188) (not d!37846) (not d!37834) (not d!37736) (not b!118186) (not b!118222) (not b!118216) (not d!37730) (not b!118220) (not b!118185) (not b!118198) (not d!37836) (not b!118194) (not b!118187) (not b!118196) (not d!37732) (not b!118192) (not b!118201) (not d!37710) (not d!37726) (not d!37844) (not b!118025) (not b!118214) (not b!118023) (not d!37716) (not d!37714) (not b!118195) (not b!118202) (not b!118197) (not b!118217) (not d!37840) (not b!118189))
(check-sat)
