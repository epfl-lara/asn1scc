; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24154 () Bool)

(assert start!24154)

(declare-fun b!122154 () Bool)

(declare-fun e!80002 () Bool)

(declare-datatypes ((array!5404 0))(
  ( (array!5405 (arr!3037 (Array (_ BitVec 32) (_ BitVec 8))) (size!2444 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4362 0))(
  ( (BitStream!4363 (buf!2884 array!5404) (currentByte!5581 (_ BitVec 32)) (currentBit!5576 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4362)

(declare-datatypes ((Unit!7527 0))(
  ( (Unit!7528) )
))
(declare-datatypes ((tuple2!10272 0))(
  ( (tuple2!10273 (_1!5401 Unit!7527) (_2!5401 BitStream!4362)) )
))
(declare-fun lt!192018 () tuple2!10272)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122154 (= e!80002 (invariant!0 (currentBit!5576 thiss!1305) (currentByte!5581 thiss!1305) (size!2444 (buf!2884 (_2!5401 lt!192018)))))))

(declare-fun b!122155 () Bool)

(declare-fun e!80004 () Bool)

(declare-fun e!80010 () Bool)

(assert (=> b!122155 (= e!80004 e!80010)))

(declare-fun res!101208 () Bool)

(assert (=> b!122155 (=> (not res!101208) (not e!80010))))

(declare-fun lt!192003 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122155 (= res!101208 (validate_offset_bits!1 ((_ sign_extend 32) (size!2444 (buf!2884 thiss!1305))) ((_ sign_extend 32) (currentByte!5581 thiss!1305)) ((_ sign_extend 32) (currentBit!5576 thiss!1305)) lt!192003))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!122155 (= lt!192003 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122156 () Bool)

(declare-fun res!101202 () Bool)

(assert (=> b!122156 (=> (not res!101202) (not e!80002))))

(declare-fun lt!191998 () tuple2!10272)

(assert (=> b!122156 (= res!101202 (invariant!0 (currentBit!5576 thiss!1305) (currentByte!5581 thiss!1305) (size!2444 (buf!2884 (_2!5401 lt!191998)))))))

(declare-fun b!122157 () Bool)

(declare-fun e!80009 () Bool)

(declare-fun e!80005 () Bool)

(assert (=> b!122157 (= e!80009 e!80005)))

(declare-fun res!101207 () Bool)

(assert (=> b!122157 (=> (not res!101207) (not e!80005))))

(declare-fun lt!192006 () Bool)

(declare-datatypes ((tuple2!10274 0))(
  ( (tuple2!10275 (_1!5402 BitStream!4362) (_2!5402 Bool)) )
))
(declare-fun lt!192014 () tuple2!10274)

(assert (=> b!122157 (= res!101207 (and (= (_2!5402 lt!192014) lt!192006) (= (_1!5402 lt!192014) (_2!5401 lt!191998))))))

(declare-fun readBitPure!0 (BitStream!4362) tuple2!10274)

(declare-fun readerFrom!0 (BitStream!4362 (_ BitVec 32) (_ BitVec 32)) BitStream!4362)

(assert (=> b!122157 (= lt!192014 (readBitPure!0 (readerFrom!0 (_2!5401 lt!191998) (currentBit!5576 thiss!1305) (currentByte!5581 thiss!1305))))))

(declare-fun b!122158 () Bool)

(declare-fun res!101199 () Bool)

(assert (=> b!122158 (=> (not res!101199) (not e!80010))))

(assert (=> b!122158 (= res!101199 (bvslt i!615 nBits!396))))

(declare-fun b!122159 () Bool)

(declare-fun res!101196 () Bool)

(assert (=> b!122159 (=> (not res!101196) (not e!80009))))

(declare-fun isPrefixOf!0 (BitStream!4362 BitStream!4362) Bool)

(assert (=> b!122159 (= res!101196 (isPrefixOf!0 thiss!1305 (_2!5401 lt!191998)))))

(declare-fun b!122160 () Bool)

(declare-fun e!80007 () Bool)

(declare-fun lt!191992 () tuple2!10274)

(declare-fun lt!192001 () tuple2!10274)

(assert (=> b!122160 (= e!80007 (= (_2!5402 lt!191992) (_2!5402 lt!192001)))))

(declare-fun b!122161 () Bool)

(declare-fun lt!192010 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122161 (= e!80005 (= (bitIndex!0 (size!2444 (buf!2884 (_1!5402 lt!192014))) (currentByte!5581 (_1!5402 lt!192014)) (currentBit!5576 (_1!5402 lt!192014))) lt!192010))))

(declare-fun b!122162 () Bool)

(declare-fun res!101203 () Bool)

(assert (=> b!122162 (=> (not res!101203) (not e!80010))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122162 (= res!101203 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122163 () Bool)

(declare-fun e!80006 () Bool)

(assert (=> b!122163 (= e!80010 (not e!80006))))

(declare-fun res!101206 () Bool)

(assert (=> b!122163 (=> res!101206 e!80006)))

(declare-datatypes ((tuple2!10276 0))(
  ( (tuple2!10277 (_1!5403 BitStream!4362) (_2!5403 (_ BitVec 64))) )
))
(declare-fun lt!191993 () tuple2!10276)

(declare-datatypes ((tuple2!10278 0))(
  ( (tuple2!10279 (_1!5404 BitStream!4362) (_2!5404 BitStream!4362)) )
))
(declare-fun lt!192017 () tuple2!10278)

(assert (=> b!122163 (= res!101206 (not (= (_1!5403 lt!191993) (_2!5404 lt!192017))))))

(declare-fun lt!191995 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10276)

(assert (=> b!122163 (= lt!191993 (readNLeastSignificantBitsLoopPure!0 (_1!5404 lt!192017) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191995))))

(declare-fun lt!192000 () (_ BitVec 64))

(assert (=> b!122163 (validate_offset_bits!1 ((_ sign_extend 32) (size!2444 (buf!2884 (_2!5401 lt!192018)))) ((_ sign_extend 32) (currentByte!5581 (_2!5401 lt!191998))) ((_ sign_extend 32) (currentBit!5576 (_2!5401 lt!191998))) lt!192000)))

(declare-fun lt!191997 () Unit!7527)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4362 array!5404 (_ BitVec 64)) Unit!7527)

(assert (=> b!122163 (= lt!191997 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5401 lt!191998) (buf!2884 (_2!5401 lt!192018)) lt!192000))))

(assert (=> b!122163 (= lt!192000 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!191994 () (_ BitVec 64))

(declare-fun lt!192005 () (_ BitVec 64))

(declare-fun lt!192004 () tuple2!10274)

(assert (=> b!122163 (= lt!191995 (bvor lt!191994 (ite (_2!5402 lt!192004) lt!192005 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!192002 () tuple2!10278)

(declare-fun lt!192015 () tuple2!10276)

(assert (=> b!122163 (= lt!192015 (readNLeastSignificantBitsLoopPure!0 (_1!5404 lt!192002) nBits!396 i!615 lt!191994))))

(assert (=> b!122163 (validate_offset_bits!1 ((_ sign_extend 32) (size!2444 (buf!2884 (_2!5401 lt!192018)))) ((_ sign_extend 32) (currentByte!5581 thiss!1305)) ((_ sign_extend 32) (currentBit!5576 thiss!1305)) lt!192003)))

(declare-fun lt!191990 () Unit!7527)

(assert (=> b!122163 (= lt!191990 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2884 (_2!5401 lt!192018)) lt!192003))))

(assert (=> b!122163 (= lt!191994 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!122163 (= (_2!5402 lt!192004) lt!192006)))

(assert (=> b!122163 (= lt!192004 (readBitPure!0 (_1!5404 lt!192002)))))

(declare-fun reader!0 (BitStream!4362 BitStream!4362) tuple2!10278)

(assert (=> b!122163 (= lt!192017 (reader!0 (_2!5401 lt!191998) (_2!5401 lt!192018)))))

(assert (=> b!122163 (= lt!192002 (reader!0 thiss!1305 (_2!5401 lt!192018)))))

(assert (=> b!122163 e!80007))

(declare-fun res!101197 () Bool)

(assert (=> b!122163 (=> (not res!101197) (not e!80007))))

(assert (=> b!122163 (= res!101197 (= (bitIndex!0 (size!2444 (buf!2884 (_1!5402 lt!191992))) (currentByte!5581 (_1!5402 lt!191992)) (currentBit!5576 (_1!5402 lt!191992))) (bitIndex!0 (size!2444 (buf!2884 (_1!5402 lt!192001))) (currentByte!5581 (_1!5402 lt!192001)) (currentBit!5576 (_1!5402 lt!192001)))))))

(declare-fun lt!192011 () Unit!7527)

(declare-fun lt!192007 () BitStream!4362)

(declare-fun readBitPrefixLemma!0 (BitStream!4362 BitStream!4362) Unit!7527)

(assert (=> b!122163 (= lt!192011 (readBitPrefixLemma!0 lt!192007 (_2!5401 lt!192018)))))

(assert (=> b!122163 (= lt!192001 (readBitPure!0 (BitStream!4363 (buf!2884 (_2!5401 lt!192018)) (currentByte!5581 thiss!1305) (currentBit!5576 thiss!1305))))))

(assert (=> b!122163 (= lt!191992 (readBitPure!0 lt!192007))))

(assert (=> b!122163 (= lt!192007 (BitStream!4363 (buf!2884 (_2!5401 lt!191998)) (currentByte!5581 thiss!1305) (currentBit!5576 thiss!1305)))))

(assert (=> b!122163 e!80002))

(declare-fun res!101204 () Bool)

(assert (=> b!122163 (=> (not res!101204) (not e!80002))))

(assert (=> b!122163 (= res!101204 (isPrefixOf!0 thiss!1305 (_2!5401 lt!192018)))))

(declare-fun lt!192012 () Unit!7527)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4362 BitStream!4362 BitStream!4362) Unit!7527)

(assert (=> b!122163 (= lt!192012 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5401 lt!191998) (_2!5401 lt!192018)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4362 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10272)

(assert (=> b!122163 (= lt!192018 (appendNLeastSignificantBitsLoop!0 (_2!5401 lt!191998) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!80003 () Bool)

(assert (=> b!122163 e!80003))

(declare-fun res!101200 () Bool)

(assert (=> b!122163 (=> (not res!101200) (not e!80003))))

(assert (=> b!122163 (= res!101200 (= (size!2444 (buf!2884 thiss!1305)) (size!2444 (buf!2884 (_2!5401 lt!191998)))))))

(declare-fun appendBit!0 (BitStream!4362 Bool) tuple2!10272)

(assert (=> b!122163 (= lt!191998 (appendBit!0 thiss!1305 lt!192006))))

(assert (=> b!122163 (= lt!192006 (not (= (bvand v!199 lt!192005) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122163 (= lt!192005 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122164 () Bool)

(declare-fun e!80008 () Bool)

(declare-fun array_inv!2246 (array!5404) Bool)

(assert (=> b!122164 (= e!80008 (array_inv!2246 (buf!2884 thiss!1305)))))

(declare-fun b!122165 () Bool)

(assert (=> b!122165 (= e!80003 e!80009)))

(declare-fun res!101198 () Bool)

(assert (=> b!122165 (=> (not res!101198) (not e!80009))))

(declare-fun lt!191996 () (_ BitVec 64))

(assert (=> b!122165 (= res!101198 (= lt!192010 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!191996)))))

(assert (=> b!122165 (= lt!192010 (bitIndex!0 (size!2444 (buf!2884 (_2!5401 lt!191998))) (currentByte!5581 (_2!5401 lt!191998)) (currentBit!5576 (_2!5401 lt!191998))))))

(assert (=> b!122165 (= lt!191996 (bitIndex!0 (size!2444 (buf!2884 thiss!1305)) (currentByte!5581 thiss!1305) (currentBit!5576 thiss!1305)))))

(declare-fun b!122166 () Bool)

(declare-fun lt!192013 () (_ BitVec 64))

(declare-fun e!80000 () Bool)

(declare-fun lt!191991 () BitStream!4362)

(declare-fun lt!192009 () (_ BitVec 64))

(assert (=> b!122166 (= e!80000 (and (= lt!192009 (bvsub lt!192013 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5404 lt!192017) lt!191991)) (and (= (_2!5403 lt!192015) (_2!5403 lt!191993)) (= (_1!5403 lt!192015) (_2!5404 lt!192002))))))))

(declare-fun res!101201 () Bool)

(assert (=> start!24154 (=> (not res!101201) (not e!80004))))

(assert (=> start!24154 (= res!101201 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24154 e!80004))

(assert (=> start!24154 true))

(declare-fun inv!12 (BitStream!4362) Bool)

(assert (=> start!24154 (and (inv!12 thiss!1305) e!80008)))

(declare-fun lt!191999 () (_ BitVec 64))

(declare-fun b!122167 () Bool)

(assert (=> b!122167 (= e!80006 (or (not (= (_1!5404 lt!192017) lt!191991)) (not (= (size!2444 (buf!2884 thiss!1305)) (size!2444 (buf!2884 (_2!5401 lt!192018))))) (not (= lt!191999 (bvadd lt!192009 lt!192003))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!122167 e!80000))

(declare-fun res!101205 () Bool)

(assert (=> b!122167 (=> (not res!101205) (not e!80000))))

(declare-fun withMovedBitIndex!0 (BitStream!4362 (_ BitVec 64)) BitStream!4362)

(assert (=> b!122167 (= res!101205 (= (_1!5404 lt!192017) (withMovedBitIndex!0 (_2!5404 lt!192017) (bvsub lt!192013 lt!191999))))))

(assert (=> b!122167 (= lt!192013 (bitIndex!0 (size!2444 (buf!2884 (_2!5401 lt!191998))) (currentByte!5581 (_2!5401 lt!191998)) (currentBit!5576 (_2!5401 lt!191998))))))

(assert (=> b!122167 (= (_1!5404 lt!192002) (withMovedBitIndex!0 (_2!5404 lt!192002) (bvsub lt!192009 lt!191999)))))

(assert (=> b!122167 (= lt!191999 (bitIndex!0 (size!2444 (buf!2884 (_2!5401 lt!192018))) (currentByte!5581 (_2!5401 lt!192018)) (currentBit!5576 (_2!5401 lt!192018))))))

(assert (=> b!122167 (= lt!192009 (bitIndex!0 (size!2444 (buf!2884 thiss!1305)) (currentByte!5581 thiss!1305) (currentBit!5576 thiss!1305)))))

(declare-fun lt!192016 () tuple2!10276)

(assert (=> b!122167 (and (= (_2!5403 lt!192015) (_2!5403 lt!192016)) (= (_1!5403 lt!192015) (_1!5403 lt!192016)))))

(declare-fun lt!192008 () Unit!7527)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7527)

(assert (=> b!122167 (= lt!192008 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5404 lt!192002) nBits!396 i!615 lt!191994))))

(assert (=> b!122167 (= lt!192016 (readNLeastSignificantBitsLoopPure!0 lt!191991 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191995))))

(assert (=> b!122167 (= lt!191991 (withMovedBitIndex!0 (_1!5404 lt!192002) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!24154 res!101201) b!122155))

(assert (= (and b!122155 res!101208) b!122162))

(assert (= (and b!122162 res!101203) b!122158))

(assert (= (and b!122158 res!101199) b!122163))

(assert (= (and b!122163 res!101200) b!122165))

(assert (= (and b!122165 res!101198) b!122159))

(assert (= (and b!122159 res!101196) b!122157))

(assert (= (and b!122157 res!101207) b!122161))

(assert (= (and b!122163 res!101204) b!122156))

(assert (= (and b!122156 res!101202) b!122154))

(assert (= (and b!122163 res!101197) b!122160))

(assert (= (and b!122163 (not res!101206)) b!122167))

(assert (= (and b!122167 res!101205) b!122166))

(assert (= start!24154 b!122164))

(declare-fun m!185455 () Bool)

(assert (=> b!122167 m!185455))

(declare-fun m!185457 () Bool)

(assert (=> b!122167 m!185457))

(declare-fun m!185459 () Bool)

(assert (=> b!122167 m!185459))

(declare-fun m!185461 () Bool)

(assert (=> b!122167 m!185461))

(declare-fun m!185463 () Bool)

(assert (=> b!122167 m!185463))

(declare-fun m!185465 () Bool)

(assert (=> b!122167 m!185465))

(declare-fun m!185467 () Bool)

(assert (=> b!122167 m!185467))

(declare-fun m!185469 () Bool)

(assert (=> b!122167 m!185469))

(assert (=> b!122165 m!185467))

(assert (=> b!122165 m!185457))

(declare-fun m!185471 () Bool)

(assert (=> b!122161 m!185471))

(declare-fun m!185473 () Bool)

(assert (=> b!122156 m!185473))

(declare-fun m!185475 () Bool)

(assert (=> b!122162 m!185475))

(declare-fun m!185477 () Bool)

(assert (=> b!122155 m!185477))

(declare-fun m!185479 () Bool)

(assert (=> b!122163 m!185479))

(declare-fun m!185481 () Bool)

(assert (=> b!122163 m!185481))

(declare-fun m!185483 () Bool)

(assert (=> b!122163 m!185483))

(declare-fun m!185485 () Bool)

(assert (=> b!122163 m!185485))

(declare-fun m!185487 () Bool)

(assert (=> b!122163 m!185487))

(declare-fun m!185489 () Bool)

(assert (=> b!122163 m!185489))

(declare-fun m!185491 () Bool)

(assert (=> b!122163 m!185491))

(declare-fun m!185493 () Bool)

(assert (=> b!122163 m!185493))

(declare-fun m!185495 () Bool)

(assert (=> b!122163 m!185495))

(declare-fun m!185497 () Bool)

(assert (=> b!122163 m!185497))

(declare-fun m!185499 () Bool)

(assert (=> b!122163 m!185499))

(declare-fun m!185501 () Bool)

(assert (=> b!122163 m!185501))

(declare-fun m!185503 () Bool)

(assert (=> b!122163 m!185503))

(declare-fun m!185505 () Bool)

(assert (=> b!122163 m!185505))

(declare-fun m!185507 () Bool)

(assert (=> b!122163 m!185507))

(declare-fun m!185509 () Bool)

(assert (=> b!122163 m!185509))

(declare-fun m!185511 () Bool)

(assert (=> b!122163 m!185511))

(declare-fun m!185513 () Bool)

(assert (=> b!122163 m!185513))

(declare-fun m!185515 () Bool)

(assert (=> b!122163 m!185515))

(declare-fun m!185517 () Bool)

(assert (=> b!122157 m!185517))

(assert (=> b!122157 m!185517))

(declare-fun m!185519 () Bool)

(assert (=> b!122157 m!185519))

(declare-fun m!185521 () Bool)

(assert (=> b!122164 m!185521))

(declare-fun m!185523 () Bool)

(assert (=> start!24154 m!185523))

(declare-fun m!185525 () Bool)

(assert (=> b!122159 m!185525))

(declare-fun m!185527 () Bool)

(assert (=> b!122154 m!185527))

(check-sat (not b!122157) (not b!122163) (not start!24154) (not b!122159) (not b!122164) (not b!122165) (not b!122161) (not b!122167) (not b!122156) (not b!122154) (not b!122162) (not b!122155))
(check-sat)
