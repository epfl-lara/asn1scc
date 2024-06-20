; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28020 () Bool)

(assert start!28020)

(declare-fun b!145250 () Bool)

(declare-fun res!121444 () Bool)

(declare-fun e!96842 () Bool)

(assert (=> b!145250 (=> (not res!121444) (not e!96842))))

(declare-datatypes ((array!6612 0))(
  ( (array!6613 (arr!3727 (Array (_ BitVec 32) (_ BitVec 8))) (size!2994 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5246 0))(
  ( (BitStream!5247 (buf!3433 array!6612) (currentByte!6323 (_ BitVec 32)) (currentBit!6318 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9061 0))(
  ( (Unit!9062) )
))
(declare-datatypes ((tuple2!12994 0))(
  ( (tuple2!12995 (_1!6843 Unit!9061) (_2!6843 BitStream!5246)) )
))
(declare-fun lt!225007 () tuple2!12994)

(declare-fun thiss!1634 () BitStream!5246)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145250 (= res!121444 (= (bitIndex!0 (size!2994 (buf!3433 (_2!6843 lt!225007))) (currentByte!6323 (_2!6843 lt!225007)) (currentBit!6318 (_2!6843 lt!225007))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2994 (buf!3433 thiss!1634)) (currentByte!6323 thiss!1634) (currentBit!6318 thiss!1634)))))))

(declare-fun arr!237 () array!6612)

(declare-datatypes ((tuple2!12996 0))(
  ( (tuple2!12997 (_1!6844 BitStream!5246) (_2!6844 (_ BitVec 8))) )
))
(declare-fun lt!225008 () tuple2!12996)

(declare-datatypes ((tuple2!12998 0))(
  ( (tuple2!12999 (_1!6845 BitStream!5246) (_2!6845 BitStream!5246)) )
))
(declare-fun lt!225000 () tuple2!12998)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!145251 () Bool)

(assert (=> b!145251 (= e!96842 (and (= (_2!6844 lt!225008) (select (arr!3727 arr!237) from!447)) (= (_1!6844 lt!225008) (_2!6845 lt!225000))))))

(declare-fun readBytePure!0 (BitStream!5246) tuple2!12996)

(assert (=> b!145251 (= lt!225008 (readBytePure!0 (_1!6845 lt!225000)))))

(declare-fun reader!0 (BitStream!5246 BitStream!5246) tuple2!12998)

(assert (=> b!145251 (= lt!225000 (reader!0 thiss!1634 (_2!6843 lt!225007)))))

(declare-fun b!145253 () Bool)

(declare-fun e!96837 () Bool)

(declare-fun e!96838 () Bool)

(assert (=> b!145253 (= e!96837 (not e!96838))))

(declare-fun res!121440 () Bool)

(assert (=> b!145253 (=> res!121440 e!96838)))

(declare-datatypes ((tuple2!13000 0))(
  ( (tuple2!13001 (_1!6846 BitStream!5246) (_2!6846 array!6612)) )
))
(declare-fun lt!225002 () tuple2!13000)

(declare-fun lt!225009 () tuple2!12998)

(assert (=> b!145253 (= res!121440 (or (not (= (size!2994 (_2!6846 lt!225002)) (size!2994 arr!237))) (not (= (_1!6846 lt!225002) (_2!6845 lt!225009)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5246 array!6612 (_ BitVec 32) (_ BitVec 32)) tuple2!13000)

(assert (=> b!145253 (= lt!225002 (readByteArrayLoopPure!0 (_1!6845 lt!225009) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225014 () tuple2!12994)

(declare-fun lt!225003 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145253 (validate_offset_bits!1 ((_ sign_extend 32) (size!2994 (buf!3433 (_2!6843 lt!225014)))) ((_ sign_extend 32) (currentByte!6323 (_2!6843 lt!225007))) ((_ sign_extend 32) (currentBit!6318 (_2!6843 lt!225007))) lt!225003)))

(declare-fun lt!225010 () Unit!9061)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5246 array!6612 (_ BitVec 64)) Unit!9061)

(assert (=> b!145253 (= lt!225010 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6843 lt!225007) (buf!3433 (_2!6843 lt!225014)) lt!225003))))

(assert (=> b!145253 (= lt!225009 (reader!0 (_2!6843 lt!225007) (_2!6843 lt!225014)))))

(declare-fun b!145254 () Bool)

(declare-fun res!121448 () Bool)

(assert (=> b!145254 (=> (not res!121448) (not e!96837))))

(declare-fun isPrefixOf!0 (BitStream!5246 BitStream!5246) Bool)

(assert (=> b!145254 (= res!121448 (isPrefixOf!0 (_2!6843 lt!225007) (_2!6843 lt!225014)))))

(declare-fun b!145255 () Bool)

(declare-fun res!121442 () Bool)

(declare-fun e!96839 () Bool)

(assert (=> b!145255 (=> (not res!121442) (not e!96839))))

(assert (=> b!145255 (= res!121442 (bvslt from!447 to!404))))

(declare-fun b!145256 () Bool)

(declare-fun res!121450 () Bool)

(assert (=> b!145256 (=> (not res!121450) (not e!96842))))

(assert (=> b!145256 (= res!121450 (isPrefixOf!0 thiss!1634 (_2!6843 lt!225007)))))

(declare-fun b!145257 () Bool)

(declare-fun e!96836 () Bool)

(assert (=> b!145257 (= e!96836 e!96837)))

(declare-fun res!121445 () Bool)

(assert (=> b!145257 (=> (not res!121445) (not e!96837))))

(assert (=> b!145257 (= res!121445 (= (bitIndex!0 (size!2994 (buf!3433 (_2!6843 lt!225014))) (currentByte!6323 (_2!6843 lt!225014)) (currentBit!6318 (_2!6843 lt!225014))) (bvadd (bitIndex!0 (size!2994 (buf!3433 (_2!6843 lt!225007))) (currentByte!6323 (_2!6843 lt!225007)) (currentBit!6318 (_2!6843 lt!225007))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!225003))))))

(assert (=> b!145257 (= lt!225003 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145258 () Bool)

(declare-fun res!121443 () Bool)

(assert (=> b!145258 (=> (not res!121443) (not e!96839))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145258 (= res!121443 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2994 (buf!3433 thiss!1634))) ((_ sign_extend 32) (currentByte!6323 thiss!1634)) ((_ sign_extend 32) (currentBit!6318 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145259 () Bool)

(declare-fun e!96835 () Bool)

(declare-fun array_inv!2783 (array!6612) Bool)

(assert (=> b!145259 (= e!96835 (array_inv!2783 (buf!3433 thiss!1634)))))

(declare-fun b!145260 () Bool)

(assert (=> b!145260 (= e!96839 (not (or (not (= (bvand from!447 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!447 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!225013 () (_ BitVec 32))

(assert (=> b!145260 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2994 (buf!3433 (_2!6843 lt!225014)))) ((_ sign_extend 32) (currentByte!6323 (_2!6843 lt!225007))) ((_ sign_extend 32) (currentBit!6318 (_2!6843 lt!225007))) lt!225013)))

(declare-fun lt!225004 () Unit!9061)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5246 array!6612 (_ BitVec 32)) Unit!9061)

(assert (=> b!145260 (= lt!225004 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6843 lt!225007) (buf!3433 (_2!6843 lt!225014)) lt!225013))))

(declare-fun e!96843 () Bool)

(assert (=> b!145260 e!96843))

(declare-fun res!121439 () Bool)

(assert (=> b!145260 (=> (not res!121439) (not e!96843))))

(assert (=> b!145260 (= res!121439 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2994 (buf!3433 (_2!6843 lt!225014)))) ((_ sign_extend 32) (currentByte!6323 thiss!1634)) ((_ sign_extend 32) (currentBit!6318 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!225016 () Unit!9061)

(assert (=> b!145260 (= lt!225016 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3433 (_2!6843 lt!225014)) (bvsub to!404 from!447)))))

(declare-fun lt!225006 () tuple2!12998)

(assert (=> b!145260 (= (_2!6844 (readBytePure!0 (_1!6845 lt!225006))) (select (arr!3727 arr!237) from!447))))

(declare-fun lt!225017 () tuple2!12998)

(assert (=> b!145260 (= lt!225017 (reader!0 (_2!6843 lt!225007) (_2!6843 lt!225014)))))

(assert (=> b!145260 (= lt!225006 (reader!0 thiss!1634 (_2!6843 lt!225014)))))

(declare-fun e!96841 () Bool)

(assert (=> b!145260 e!96841))

(declare-fun res!121447 () Bool)

(assert (=> b!145260 (=> (not res!121447) (not e!96841))))

(declare-fun lt!225005 () tuple2!12996)

(declare-fun lt!225018 () tuple2!12996)

(assert (=> b!145260 (= res!121447 (= (bitIndex!0 (size!2994 (buf!3433 (_1!6844 lt!225005))) (currentByte!6323 (_1!6844 lt!225005)) (currentBit!6318 (_1!6844 lt!225005))) (bitIndex!0 (size!2994 (buf!3433 (_1!6844 lt!225018))) (currentByte!6323 (_1!6844 lt!225018)) (currentBit!6318 (_1!6844 lt!225018)))))))

(declare-fun lt!225012 () Unit!9061)

(declare-fun lt!225011 () BitStream!5246)

(declare-fun readBytePrefixLemma!0 (BitStream!5246 BitStream!5246) Unit!9061)

(assert (=> b!145260 (= lt!225012 (readBytePrefixLemma!0 lt!225011 (_2!6843 lt!225014)))))

(assert (=> b!145260 (= lt!225018 (readBytePure!0 (BitStream!5247 (buf!3433 (_2!6843 lt!225014)) (currentByte!6323 thiss!1634) (currentBit!6318 thiss!1634))))))

(assert (=> b!145260 (= lt!225005 (readBytePure!0 lt!225011))))

(assert (=> b!145260 (= lt!225011 (BitStream!5247 (buf!3433 (_2!6843 lt!225007)) (currentByte!6323 thiss!1634) (currentBit!6318 thiss!1634)))))

(declare-fun e!96840 () Bool)

(assert (=> b!145260 e!96840))

(declare-fun res!121446 () Bool)

(assert (=> b!145260 (=> (not res!121446) (not e!96840))))

(assert (=> b!145260 (= res!121446 (isPrefixOf!0 thiss!1634 (_2!6843 lt!225014)))))

(declare-fun lt!225001 () Unit!9061)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5246 BitStream!5246 BitStream!5246) Unit!9061)

(assert (=> b!145260 (= lt!225001 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6843 lt!225007) (_2!6843 lt!225014)))))

(assert (=> b!145260 e!96836))

(declare-fun res!121438 () Bool)

(assert (=> b!145260 (=> (not res!121438) (not e!96836))))

(assert (=> b!145260 (= res!121438 (= (size!2994 (buf!3433 (_2!6843 lt!225007))) (size!2994 (buf!3433 (_2!6843 lt!225014)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5246 array!6612 (_ BitVec 32) (_ BitVec 32)) tuple2!12994)

(assert (=> b!145260 (= lt!225014 (appendByteArrayLoop!0 (_2!6843 lt!225007) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145260 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2994 (buf!3433 (_2!6843 lt!225007)))) ((_ sign_extend 32) (currentByte!6323 (_2!6843 lt!225007))) ((_ sign_extend 32) (currentBit!6318 (_2!6843 lt!225007))) lt!225013)))

(assert (=> b!145260 (= lt!225013 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!225015 () Unit!9061)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5246 BitStream!5246 (_ BitVec 64) (_ BitVec 32)) Unit!9061)

(assert (=> b!145260 (= lt!225015 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6843 lt!225007) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145260 e!96842))

(declare-fun res!121437 () Bool)

(assert (=> b!145260 (=> (not res!121437) (not e!96842))))

(assert (=> b!145260 (= res!121437 (= (size!2994 (buf!3433 thiss!1634)) (size!2994 (buf!3433 (_2!6843 lt!225007)))))))

(declare-fun appendByte!0 (BitStream!5246 (_ BitVec 8)) tuple2!12994)

(assert (=> b!145260 (= lt!225007 (appendByte!0 thiss!1634 (select (arr!3727 arr!237) from!447)))))

(declare-fun b!145261 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145261 (= e!96840 (invariant!0 (currentBit!6318 thiss!1634) (currentByte!6323 thiss!1634) (size!2994 (buf!3433 (_2!6843 lt!225007)))))))

(declare-fun b!145262 () Bool)

(assert (=> b!145262 (= e!96841 (= (_2!6844 lt!225005) (_2!6844 lt!225018)))))

(declare-fun b!145263 () Bool)

(assert (=> b!145263 (= e!96843 (= (_1!6846 (readByteArrayLoopPure!0 (_1!6845 lt!225006) arr!237 from!447 to!404)) (_2!6845 lt!225006)))))

(declare-fun b!145264 () Bool)

(declare-fun res!121449 () Bool)

(assert (=> b!145264 (=> (not res!121449) (not e!96839))))

(assert (=> b!145264 (= res!121449 (invariant!0 (currentBit!6318 thiss!1634) (currentByte!6323 thiss!1634) (size!2994 (buf!3433 thiss!1634))))))

(declare-fun res!121441 () Bool)

(assert (=> start!28020 (=> (not res!121441) (not e!96839))))

(assert (=> start!28020 (= res!121441 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2994 arr!237))))))

(assert (=> start!28020 e!96839))

(assert (=> start!28020 true))

(assert (=> start!28020 (array_inv!2783 arr!237)))

(declare-fun inv!12 (BitStream!5246) Bool)

(assert (=> start!28020 (and (inv!12 thiss!1634) e!96835)))

(declare-fun b!145252 () Bool)

(declare-fun arrayRangesEq!310 (array!6612 array!6612 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145252 (= e!96838 (not (arrayRangesEq!310 arr!237 (_2!6846 lt!225002) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!28020 res!121441) b!145258))

(assert (= (and b!145258 res!121443) b!145255))

(assert (= (and b!145255 res!121442) b!145264))

(assert (= (and b!145264 res!121449) b!145260))

(assert (= (and b!145260 res!121437) b!145250))

(assert (= (and b!145250 res!121444) b!145256))

(assert (= (and b!145256 res!121450) b!145251))

(assert (= (and b!145260 res!121438) b!145257))

(assert (= (and b!145257 res!121445) b!145254))

(assert (= (and b!145254 res!121448) b!145253))

(assert (= (and b!145253 (not res!121440)) b!145252))

(assert (= (and b!145260 res!121446) b!145261))

(assert (= (and b!145260 res!121447) b!145262))

(assert (= (and b!145260 res!121439) b!145263))

(assert (= start!28020 b!145259))

(declare-fun m!223431 () Bool)

(assert (=> b!145257 m!223431))

(declare-fun m!223433 () Bool)

(assert (=> b!145257 m!223433))

(declare-fun m!223435 () Bool)

(assert (=> b!145258 m!223435))

(declare-fun m!223437 () Bool)

(assert (=> b!145252 m!223437))

(declare-fun m!223439 () Bool)

(assert (=> b!145260 m!223439))

(declare-fun m!223441 () Bool)

(assert (=> b!145260 m!223441))

(declare-fun m!223443 () Bool)

(assert (=> b!145260 m!223443))

(declare-fun m!223445 () Bool)

(assert (=> b!145260 m!223445))

(declare-fun m!223447 () Bool)

(assert (=> b!145260 m!223447))

(declare-fun m!223449 () Bool)

(assert (=> b!145260 m!223449))

(declare-fun m!223451 () Bool)

(assert (=> b!145260 m!223451))

(declare-fun m!223453 () Bool)

(assert (=> b!145260 m!223453))

(declare-fun m!223455 () Bool)

(assert (=> b!145260 m!223455))

(declare-fun m!223457 () Bool)

(assert (=> b!145260 m!223457))

(declare-fun m!223459 () Bool)

(assert (=> b!145260 m!223459))

(assert (=> b!145260 m!223455))

(declare-fun m!223461 () Bool)

(assert (=> b!145260 m!223461))

(declare-fun m!223463 () Bool)

(assert (=> b!145260 m!223463))

(declare-fun m!223465 () Bool)

(assert (=> b!145260 m!223465))

(declare-fun m!223467 () Bool)

(assert (=> b!145260 m!223467))

(declare-fun m!223469 () Bool)

(assert (=> b!145260 m!223469))

(declare-fun m!223471 () Bool)

(assert (=> b!145260 m!223471))

(declare-fun m!223473 () Bool)

(assert (=> b!145260 m!223473))

(declare-fun m!223475 () Bool)

(assert (=> b!145260 m!223475))

(declare-fun m!223477 () Bool)

(assert (=> b!145263 m!223477))

(assert (=> b!145250 m!223433))

(declare-fun m!223479 () Bool)

(assert (=> b!145250 m!223479))

(declare-fun m!223481 () Bool)

(assert (=> b!145264 m!223481))

(declare-fun m!223483 () Bool)

(assert (=> b!145254 m!223483))

(declare-fun m!223485 () Bool)

(assert (=> b!145253 m!223485))

(declare-fun m!223487 () Bool)

(assert (=> b!145253 m!223487))

(declare-fun m!223489 () Bool)

(assert (=> b!145253 m!223489))

(assert (=> b!145253 m!223441))

(declare-fun m!223491 () Bool)

(assert (=> b!145259 m!223491))

(declare-fun m!223493 () Bool)

(assert (=> b!145256 m!223493))

(declare-fun m!223495 () Bool)

(assert (=> start!28020 m!223495))

(declare-fun m!223497 () Bool)

(assert (=> start!28020 m!223497))

(declare-fun m!223499 () Bool)

(assert (=> b!145261 m!223499))

(assert (=> b!145251 m!223455))

(declare-fun m!223501 () Bool)

(assert (=> b!145251 m!223501))

(declare-fun m!223503 () Bool)

(assert (=> b!145251 m!223503))

(push 1)

(assert (not b!145258))

(assert (not b!145251))

(assert (not b!145250))

(assert (not b!145259))

(assert (not b!145256))

(assert (not b!145257))

(assert (not b!145254))

(assert (not start!28020))

(assert (not b!145260))

(assert (not b!145261))

(assert (not b!145253))

(assert (not b!145252))

(assert (not b!145263))

(assert (not b!145264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

