; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28938 () Bool)

(assert start!28938)

(declare-fun b!150432 () Bool)

(declare-fun e!100461 () Bool)

(declare-fun e!100462 () Bool)

(assert (=> b!150432 (= e!100461 e!100462)))

(declare-fun res!126091 () Bool)

(assert (=> b!150432 (=> res!126091 e!100462)))

(declare-datatypes ((array!6731 0))(
  ( (array!6732 (arr!3839 (Array (_ BitVec 32) (_ BitVec 8))) (size!3046 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5350 0))(
  ( (BitStream!5351 (buf!3527 array!6731) (currentByte!6447 (_ BitVec 32)) (currentBit!6442 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9492 0))(
  ( (Unit!9493) )
))
(declare-datatypes ((tuple2!13452 0))(
  ( (tuple2!13453 (_1!7093 Unit!9492) (_2!7093 BitStream!5350)) )
))
(declare-fun lt!235103 () tuple2!13452)

(declare-fun thiss!1634 () BitStream!5350)

(declare-fun lt!235112 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150432 (= res!126091 (not (= (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235103))) (currentByte!6447 (_2!7093 lt!235103)) (currentBit!6442 (_2!7093 lt!235103))) (bvadd (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235112)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!150432 (= lt!235112 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!150433 () Bool)

(declare-fun res!126105 () Bool)

(declare-fun e!100471 () Bool)

(assert (=> b!150433 (=> (not res!126105) (not e!100471))))

(declare-fun lt!235111 () tuple2!13452)

(declare-fun isPrefixOf!0 (BitStream!5350 BitStream!5350) Bool)

(assert (=> b!150433 (= res!126105 (isPrefixOf!0 thiss!1634 (_2!7093 lt!235111)))))

(declare-fun b!150434 () Bool)

(declare-fun res!126101 () Bool)

(declare-fun e!100468 () Bool)

(assert (=> b!150434 (=> (not res!126101) (not e!100468))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150434 (= res!126101 (invariant!0 (currentBit!6442 thiss!1634) (currentByte!6447 thiss!1634) (size!3046 (buf!3527 thiss!1634))))))

(declare-fun b!150435 () Bool)

(declare-fun e!100463 () Bool)

(declare-fun array_inv!2835 (array!6731) Bool)

(assert (=> b!150435 (= e!100463 (array_inv!2835 (buf!3527 thiss!1634)))))

(declare-fun res!126097 () Bool)

(assert (=> start!28938 (=> (not res!126097) (not e!100468))))

(declare-fun arr!237 () array!6731)

(assert (=> start!28938 (= res!126097 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3046 arr!237))))))

(assert (=> start!28938 e!100468))

(assert (=> start!28938 true))

(assert (=> start!28938 (array_inv!2835 arr!237)))

(declare-fun inv!12 (BitStream!5350) Bool)

(assert (=> start!28938 (and (inv!12 thiss!1634) e!100463)))

(declare-fun b!150436 () Bool)

(declare-fun res!126095 () Bool)

(assert (=> b!150436 (=> res!126095 e!100462)))

(assert (=> b!150436 (= res!126095 (bvslt lt!235112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!150437 () Bool)

(declare-fun res!126098 () Bool)

(assert (=> b!150437 (=> (not res!126098) (not e!100468))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150437 (= res!126098 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!150438 () Bool)

(declare-fun e!100464 () Bool)

(declare-fun e!100465 () Bool)

(assert (=> b!150438 (= e!100464 e!100465)))

(declare-fun res!126106 () Bool)

(assert (=> b!150438 (=> (not res!126106) (not e!100465))))

(declare-fun lt!235114 () (_ BitVec 64))

(assert (=> b!150438 (= res!126106 (= (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235103))) (currentByte!6447 (_2!7093 lt!235103)) (currentBit!6442 (_2!7093 lt!235103))) (bvadd (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235114))))))

(assert (=> b!150438 (= lt!235114 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!150439 () Bool)

(declare-datatypes ((tuple2!13454 0))(
  ( (tuple2!13455 (_1!7094 BitStream!5350) (_2!7094 (_ BitVec 8))) )
))
(declare-fun lt!235105 () tuple2!13454)

(declare-datatypes ((tuple2!13456 0))(
  ( (tuple2!13457 (_1!7095 BitStream!5350) (_2!7095 BitStream!5350)) )
))
(declare-fun lt!235106 () tuple2!13456)

(assert (=> b!150439 (= e!100471 (and (= (_2!7094 lt!235105) (select (arr!3839 arr!237) from!447)) (= (_1!7094 lt!235105) (_2!7095 lt!235106))))))

(declare-fun readBytePure!0 (BitStream!5350) tuple2!13454)

(assert (=> b!150439 (= lt!235105 (readBytePure!0 (_1!7095 lt!235106)))))

(declare-fun reader!0 (BitStream!5350 BitStream!5350) tuple2!13456)

(assert (=> b!150439 (= lt!235106 (reader!0 thiss!1634 (_2!7093 lt!235111)))))

(declare-fun b!150440 () Bool)

(declare-fun e!100470 () Bool)

(assert (=> b!150440 (= e!100470 (invariant!0 (currentBit!6442 thiss!1634) (currentByte!6447 thiss!1634) (size!3046 (buf!3527 (_2!7093 lt!235111)))))))

(declare-fun b!150441 () Bool)

(declare-fun e!100466 () Bool)

(assert (=> b!150441 (= e!100468 (not e!100466))))

(declare-fun res!126096 () Bool)

(assert (=> b!150441 (=> res!126096 e!100466)))

(declare-datatypes ((tuple2!13458 0))(
  ( (tuple2!13459 (_1!7096 BitStream!5350) (_2!7096 array!6731)) )
))
(declare-fun lt!235120 () tuple2!13458)

(declare-fun lt!235099 () tuple2!13458)

(declare-fun arrayRangesEq!362 (array!6731 array!6731 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150441 (= res!126096 (not (arrayRangesEq!362 (_2!7096 lt!235120) (_2!7096 lt!235099) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!235102 () tuple2!13458)

(assert (=> b!150441 (arrayRangesEq!362 (_2!7096 lt!235120) (_2!7096 lt!235102) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235115 () tuple2!13456)

(declare-fun lt!235110 () Unit!9492)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5350 array!6731 (_ BitVec 32) (_ BitVec 32)) Unit!9492)

(assert (=> b!150441 (= lt!235110 (readByteArrayLoopArrayPrefixLemma!0 (_1!7095 lt!235115) arr!237 from!447 to!404))))

(declare-fun lt!235107 () array!6731)

(declare-fun readByteArrayLoopPure!0 (BitStream!5350 array!6731 (_ BitVec 32) (_ BitVec 32)) tuple2!13458)

(declare-fun withMovedByteIndex!0 (BitStream!5350 (_ BitVec 32)) BitStream!5350)

(assert (=> b!150441 (= lt!235102 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7095 lt!235115) #b00000000000000000000000000000001) lt!235107 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235118 () tuple2!13456)

(assert (=> b!150441 (= lt!235099 (readByteArrayLoopPure!0 (_1!7095 lt!235118) lt!235107 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235116 () tuple2!13454)

(assert (=> b!150441 (= lt!235107 (array!6732 (store (arr!3839 arr!237) from!447 (_2!7094 lt!235116)) (size!3046 arr!237)))))

(declare-fun lt!235095 () (_ BitVec 32))

(assert (=> b!150441 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235095)))

(declare-fun lt!235119 () Unit!9492)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5350 array!6731 (_ BitVec 32)) Unit!9492)

(assert (=> b!150441 (= lt!235119 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7093 lt!235111) (buf!3527 (_2!7093 lt!235103)) lt!235095))))

(assert (=> b!150441 (= (_1!7096 lt!235120) (_2!7095 lt!235115))))

(assert (=> b!150441 (= lt!235120 (readByteArrayLoopPure!0 (_1!7095 lt!235115) arr!237 from!447 to!404))))

(assert (=> b!150441 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!235098 () Unit!9492)

(assert (=> b!150441 (= lt!235098 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3527 (_2!7093 lt!235103)) (bvsub to!404 from!447)))))

(assert (=> b!150441 (= (_2!7094 lt!235116) (select (arr!3839 arr!237) from!447))))

(assert (=> b!150441 (= lt!235116 (readBytePure!0 (_1!7095 lt!235115)))))

(assert (=> b!150441 (= lt!235118 (reader!0 (_2!7093 lt!235111) (_2!7093 lt!235103)))))

(assert (=> b!150441 (= lt!235115 (reader!0 thiss!1634 (_2!7093 lt!235103)))))

(declare-fun e!100467 () Bool)

(assert (=> b!150441 e!100467))

(declare-fun res!126100 () Bool)

(assert (=> b!150441 (=> (not res!126100) (not e!100467))))

(declare-fun lt!235122 () tuple2!13454)

(declare-fun lt!235121 () tuple2!13454)

(assert (=> b!150441 (= res!126100 (= (bitIndex!0 (size!3046 (buf!3527 (_1!7094 lt!235122))) (currentByte!6447 (_1!7094 lt!235122)) (currentBit!6442 (_1!7094 lt!235122))) (bitIndex!0 (size!3046 (buf!3527 (_1!7094 lt!235121))) (currentByte!6447 (_1!7094 lt!235121)) (currentBit!6442 (_1!7094 lt!235121)))))))

(declare-fun lt!235097 () Unit!9492)

(declare-fun lt!235108 () BitStream!5350)

(declare-fun readBytePrefixLemma!0 (BitStream!5350 BitStream!5350) Unit!9492)

(assert (=> b!150441 (= lt!235097 (readBytePrefixLemma!0 lt!235108 (_2!7093 lt!235103)))))

(assert (=> b!150441 (= lt!235121 (readBytePure!0 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634))))))

(assert (=> b!150441 (= lt!235122 (readBytePure!0 lt!235108))))

(assert (=> b!150441 (= lt!235108 (BitStream!5351 (buf!3527 (_2!7093 lt!235111)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(assert (=> b!150441 e!100470))

(declare-fun res!126092 () Bool)

(assert (=> b!150441 (=> (not res!126092) (not e!100470))))

(assert (=> b!150441 (= res!126092 (isPrefixOf!0 thiss!1634 (_2!7093 lt!235103)))))

(declare-fun lt!235113 () Unit!9492)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5350 BitStream!5350 BitStream!5350) Unit!9492)

(assert (=> b!150441 (= lt!235113 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7093 lt!235111) (_2!7093 lt!235103)))))

(assert (=> b!150441 e!100464))

(declare-fun res!126102 () Bool)

(assert (=> b!150441 (=> (not res!126102) (not e!100464))))

(assert (=> b!150441 (= res!126102 (= (size!3046 (buf!3527 (_2!7093 lt!235111))) (size!3046 (buf!3527 (_2!7093 lt!235103)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5350 array!6731 (_ BitVec 32) (_ BitVec 32)) tuple2!13452)

(assert (=> b!150441 (= lt!235103 (appendByteArrayLoop!0 (_2!7093 lt!235111) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150441 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235095)))

(assert (=> b!150441 (= lt!235095 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!235117 () Unit!9492)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5350 BitStream!5350 (_ BitVec 64) (_ BitVec 32)) Unit!9492)

(assert (=> b!150441 (= lt!235117 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7093 lt!235111) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!150441 e!100471))

(declare-fun res!126103 () Bool)

(assert (=> b!150441 (=> (not res!126103) (not e!100471))))

(assert (=> b!150441 (= res!126103 (= (size!3046 (buf!3527 thiss!1634)) (size!3046 (buf!3527 (_2!7093 lt!235111)))))))

(declare-fun appendByte!0 (BitStream!5350 (_ BitVec 8)) tuple2!13452)

(assert (=> b!150441 (= lt!235111 (appendByte!0 thiss!1634 (select (arr!3839 arr!237) from!447)))))

(declare-fun b!150442 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150442 (= e!100462 (validate_offset_bits!1 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)) lt!235112))))

(declare-fun b!150443 () Bool)

(declare-fun res!126107 () Bool)

(assert (=> b!150443 (=> (not res!126107) (not e!100471))))

(assert (=> b!150443 (= res!126107 (= (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))))

(declare-fun b!150444 () Bool)

(declare-fun res!126104 () Bool)

(assert (=> b!150444 (=> (not res!126104) (not e!100465))))

(assert (=> b!150444 (= res!126104 (isPrefixOf!0 (_2!7093 lt!235111) (_2!7093 lt!235103)))))

(declare-fun b!150445 () Bool)

(declare-fun res!126094 () Bool)

(assert (=> b!150445 (=> (not res!126094) (not e!100468))))

(assert (=> b!150445 (= res!126094 (bvslt from!447 to!404))))

(declare-fun lt!235101 () tuple2!13458)

(declare-fun e!100460 () Bool)

(declare-fun b!150446 () Bool)

(assert (=> b!150446 (= e!100460 (not (arrayRangesEq!362 arr!237 (_2!7096 lt!235101) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!150447 () Bool)

(assert (=> b!150447 (= e!100465 (not e!100460))))

(declare-fun res!126099 () Bool)

(assert (=> b!150447 (=> res!126099 e!100460)))

(declare-fun lt!235100 () tuple2!13456)

(assert (=> b!150447 (= res!126099 (or (not (= (size!3046 (_2!7096 lt!235101)) (size!3046 arr!237))) (not (= (_1!7096 lt!235101) (_2!7095 lt!235100)))))))

(assert (=> b!150447 (= lt!235101 (readByteArrayLoopPure!0 (_1!7095 lt!235100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150447 (validate_offset_bits!1 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235114)))

(declare-fun lt!235104 () Unit!9492)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5350 array!6731 (_ BitVec 64)) Unit!9492)

(assert (=> b!150447 (= lt!235104 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7093 lt!235111) (buf!3527 (_2!7093 lt!235103)) lt!235114))))

(assert (=> b!150447 (= lt!235100 (reader!0 (_2!7093 lt!235111) (_2!7093 lt!235103)))))

(declare-fun b!150448 () Bool)

(assert (=> b!150448 (= e!100467 (= (_2!7094 lt!235122) (_2!7094 lt!235121)))))

(declare-fun b!150449 () Bool)

(assert (=> b!150449 (= e!100466 e!100461)))

(declare-fun res!126093 () Bool)

(assert (=> b!150449 (=> res!126093 e!100461)))

(assert (=> b!150449 (= res!126093 (not (= (size!3046 (buf!3527 thiss!1634)) (size!3046 (buf!3527 (_2!7093 lt!235103))))))))

(assert (=> b!150449 (arrayRangesEq!362 arr!237 (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235096 () Unit!9492)

(declare-fun arrayRangesEqTransitive!77 (array!6731 array!6731 array!6731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9492)

(assert (=> b!150449 (= lt!235096 (arrayRangesEqTransitive!77 arr!237 (_2!7096 lt!235099) (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150449 (arrayRangesEq!362 (_2!7096 lt!235099) (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235109 () Unit!9492)

(declare-fun arrayRangesEqSymmetricLemma!94 (array!6731 array!6731 (_ BitVec 32) (_ BitVec 32)) Unit!9492)

(assert (=> b!150449 (= lt!235109 (arrayRangesEqSymmetricLemma!94 (_2!7096 lt!235120) (_2!7096 lt!235099) #b00000000000000000000000000000000 to!404))))

(assert (= (and start!28938 res!126097) b!150437))

(assert (= (and b!150437 res!126098) b!150445))

(assert (= (and b!150445 res!126094) b!150434))

(assert (= (and b!150434 res!126101) b!150441))

(assert (= (and b!150441 res!126103) b!150443))

(assert (= (and b!150443 res!126107) b!150433))

(assert (= (and b!150433 res!126105) b!150439))

(assert (= (and b!150441 res!126102) b!150438))

(assert (= (and b!150438 res!126106) b!150444))

(assert (= (and b!150444 res!126104) b!150447))

(assert (= (and b!150447 (not res!126099)) b!150446))

(assert (= (and b!150441 res!126092) b!150440))

(assert (= (and b!150441 res!126100) b!150448))

(assert (= (and b!150441 (not res!126096)) b!150449))

(assert (= (and b!150449 (not res!126093)) b!150432))

(assert (= (and b!150432 (not res!126091)) b!150436))

(assert (= (and b!150436 (not res!126095)) b!150442))

(assert (= start!28938 b!150435))

(declare-fun m!234489 () Bool)

(assert (=> start!28938 m!234489))

(declare-fun m!234491 () Bool)

(assert (=> start!28938 m!234491))

(declare-fun m!234493 () Bool)

(assert (=> b!150432 m!234493))

(declare-fun m!234495 () Bool)

(assert (=> b!150432 m!234495))

(declare-fun m!234497 () Bool)

(assert (=> b!150439 m!234497))

(declare-fun m!234499 () Bool)

(assert (=> b!150439 m!234499))

(declare-fun m!234501 () Bool)

(assert (=> b!150439 m!234501))

(declare-fun m!234503 () Bool)

(assert (=> b!150443 m!234503))

(assert (=> b!150443 m!234495))

(declare-fun m!234505 () Bool)

(assert (=> b!150435 m!234505))

(declare-fun m!234507 () Bool)

(assert (=> b!150446 m!234507))

(declare-fun m!234509 () Bool)

(assert (=> b!150441 m!234509))

(declare-fun m!234511 () Bool)

(assert (=> b!150441 m!234511))

(declare-fun m!234513 () Bool)

(assert (=> b!150441 m!234513))

(declare-fun m!234515 () Bool)

(assert (=> b!150441 m!234515))

(declare-fun m!234517 () Bool)

(assert (=> b!150441 m!234517))

(declare-fun m!234519 () Bool)

(assert (=> b!150441 m!234519))

(declare-fun m!234521 () Bool)

(assert (=> b!150441 m!234521))

(declare-fun m!234523 () Bool)

(assert (=> b!150441 m!234523))

(assert (=> b!150441 m!234497))

(declare-fun m!234525 () Bool)

(assert (=> b!150441 m!234525))

(declare-fun m!234527 () Bool)

(assert (=> b!150441 m!234527))

(declare-fun m!234529 () Bool)

(assert (=> b!150441 m!234529))

(declare-fun m!234531 () Bool)

(assert (=> b!150441 m!234531))

(declare-fun m!234533 () Bool)

(assert (=> b!150441 m!234533))

(declare-fun m!234535 () Bool)

(assert (=> b!150441 m!234535))

(declare-fun m!234537 () Bool)

(assert (=> b!150441 m!234537))

(declare-fun m!234539 () Bool)

(assert (=> b!150441 m!234539))

(declare-fun m!234541 () Bool)

(assert (=> b!150441 m!234541))

(assert (=> b!150441 m!234525))

(declare-fun m!234543 () Bool)

(assert (=> b!150441 m!234543))

(declare-fun m!234545 () Bool)

(assert (=> b!150441 m!234545))

(declare-fun m!234547 () Bool)

(assert (=> b!150441 m!234547))

(declare-fun m!234549 () Bool)

(assert (=> b!150441 m!234549))

(declare-fun m!234551 () Bool)

(assert (=> b!150441 m!234551))

(declare-fun m!234553 () Bool)

(assert (=> b!150441 m!234553))

(declare-fun m!234555 () Bool)

(assert (=> b!150441 m!234555))

(assert (=> b!150441 m!234497))

(declare-fun m!234557 () Bool)

(assert (=> b!150441 m!234557))

(declare-fun m!234559 () Bool)

(assert (=> b!150441 m!234559))

(declare-fun m!234561 () Bool)

(assert (=> b!150434 m!234561))

(declare-fun m!234563 () Bool)

(assert (=> b!150433 m!234563))

(declare-fun m!234565 () Bool)

(assert (=> b!150442 m!234565))

(assert (=> b!150438 m!234493))

(assert (=> b!150438 m!234503))

(declare-fun m!234567 () Bool)

(assert (=> b!150437 m!234567))

(declare-fun m!234569 () Bool)

(assert (=> b!150449 m!234569))

(declare-fun m!234571 () Bool)

(assert (=> b!150449 m!234571))

(declare-fun m!234573 () Bool)

(assert (=> b!150449 m!234573))

(declare-fun m!234575 () Bool)

(assert (=> b!150449 m!234575))

(declare-fun m!234577 () Bool)

(assert (=> b!150440 m!234577))

(declare-fun m!234579 () Bool)

(assert (=> b!150447 m!234579))

(declare-fun m!234581 () Bool)

(assert (=> b!150447 m!234581))

(declare-fun m!234583 () Bool)

(assert (=> b!150447 m!234583))

(assert (=> b!150447 m!234551))

(declare-fun m!234585 () Bool)

(assert (=> b!150444 m!234585))

(push 1)

(assert (not b!150447))

(assert (not b!150449))

(assert (not b!150434))

(assert (not b!150443))

(assert (not start!28938))

(assert (not b!150444))

(assert (not b!150441))

(assert (not b!150433))

(assert (not b!150432))

(assert (not b!150435))

(assert (not b!150440))

(assert (not b!150446))

(assert (not b!150442))

(assert (not b!150438))

(assert (not b!150437))

(assert (not b!150439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!48852 () Bool)

(assert (=> d!48852 (= (array_inv!2835 (buf!3527 thiss!1634)) (bvsge (size!3046 (buf!3527 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!150435 d!48852))

(declare-fun d!48854 () Bool)

(assert (=> d!48854 (= (invariant!0 (currentBit!6442 thiss!1634) (currentByte!6447 thiss!1634) (size!3046 (buf!3527 thiss!1634))) (and (bvsge (currentBit!6442 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6442 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6447 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6447 thiss!1634) (size!3046 (buf!3527 thiss!1634))) (and (= (currentBit!6442 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6447 thiss!1634) (size!3046 (buf!3527 thiss!1634)))))))))

(assert (=> b!150434 d!48854))

(declare-datatypes ((tuple3!588 0))(
  ( (tuple3!589 (_1!7105 Unit!9492) (_2!7105 BitStream!5350) (_3!367 array!6731)) )
))
(declare-fun lt!235293 () tuple3!588)

(declare-fun d!48856 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5350 array!6731 (_ BitVec 32) (_ BitVec 32)) tuple3!588)

(assert (=> d!48856 (= lt!235293 (readByteArrayLoop!0 (_1!7095 lt!235100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48856 (= (readByteArrayLoopPure!0 (_1!7095 lt!235100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13459 (_2!7105 lt!235293) (_3!367 lt!235293)))))

(declare-fun bs!11941 () Bool)

(assert (= bs!11941 d!48856))

(declare-fun m!234783 () Bool)

(assert (=> bs!11941 m!234783))

(assert (=> b!150447 d!48856))

(declare-fun d!48858 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!48858 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235114) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111)))) lt!235114))))

(declare-fun bs!11942 () Bool)

(assert (= bs!11942 d!48858))

(declare-fun m!234785 () Bool)

(assert (=> bs!11942 m!234785))

(assert (=> b!150447 d!48858))

(declare-fun d!48860 () Bool)

(assert (=> d!48860 (validate_offset_bits!1 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235114)))

(declare-fun lt!235296 () Unit!9492)

(declare-fun choose!9 (BitStream!5350 array!6731 (_ BitVec 64) BitStream!5350) Unit!9492)

(assert (=> d!48860 (= lt!235296 (choose!9 (_2!7093 lt!235111) (buf!3527 (_2!7093 lt!235103)) lt!235114 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111)))))))

(assert (=> d!48860 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7093 lt!235111) (buf!3527 (_2!7093 lt!235103)) lt!235114) lt!235296)))

(declare-fun bs!11943 () Bool)

(assert (= bs!11943 d!48860))

(assert (=> bs!11943 m!234581))

(declare-fun m!234787 () Bool)

(assert (=> bs!11943 m!234787))

(assert (=> b!150447 d!48860))

(declare-fun b!150568 () Bool)

(declare-fun res!126216 () Bool)

(declare-fun e!100555 () Bool)

(assert (=> b!150568 (=> (not res!126216) (not e!100555))))

(declare-fun lt!235353 () tuple2!13456)

(assert (=> b!150568 (= res!126216 (isPrefixOf!0 (_1!7095 lt!235353) (_2!7093 lt!235111)))))

(declare-fun d!48862 () Bool)

(assert (=> d!48862 e!100555))

(declare-fun res!126217 () Bool)

(assert (=> d!48862 (=> (not res!126217) (not e!100555))))

(assert (=> d!48862 (= res!126217 (isPrefixOf!0 (_1!7095 lt!235353) (_2!7095 lt!235353)))))

(declare-fun lt!235343 () BitStream!5350)

(assert (=> d!48862 (= lt!235353 (tuple2!13457 lt!235343 (_2!7093 lt!235103)))))

(declare-fun lt!235350 () Unit!9492)

(declare-fun lt!235346 () Unit!9492)

(assert (=> d!48862 (= lt!235350 lt!235346)))

(assert (=> d!48862 (isPrefixOf!0 lt!235343 (_2!7093 lt!235103))))

(assert (=> d!48862 (= lt!235346 (lemmaIsPrefixTransitive!0 lt!235343 (_2!7093 lt!235103) (_2!7093 lt!235103)))))

(declare-fun lt!235337 () Unit!9492)

(declare-fun lt!235356 () Unit!9492)

(assert (=> d!48862 (= lt!235337 lt!235356)))

(assert (=> d!48862 (isPrefixOf!0 lt!235343 (_2!7093 lt!235103))))

(assert (=> d!48862 (= lt!235356 (lemmaIsPrefixTransitive!0 lt!235343 (_2!7093 lt!235111) (_2!7093 lt!235103)))))

(declare-fun lt!235354 () Unit!9492)

(declare-fun e!100554 () Unit!9492)

(assert (=> d!48862 (= lt!235354 e!100554)))

(declare-fun c!8059 () Bool)

(assert (=> d!48862 (= c!8059 (not (= (size!3046 (buf!3527 (_2!7093 lt!235111))) #b00000000000000000000000000000000)))))

(declare-fun lt!235340 () Unit!9492)

(declare-fun lt!235351 () Unit!9492)

(assert (=> d!48862 (= lt!235340 lt!235351)))

(assert (=> d!48862 (isPrefixOf!0 (_2!7093 lt!235103) (_2!7093 lt!235103))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5350) Unit!9492)

(assert (=> d!48862 (= lt!235351 (lemmaIsPrefixRefl!0 (_2!7093 lt!235103)))))

(declare-fun lt!235344 () Unit!9492)

(declare-fun lt!235352 () Unit!9492)

(assert (=> d!48862 (= lt!235344 lt!235352)))

(assert (=> d!48862 (= lt!235352 (lemmaIsPrefixRefl!0 (_2!7093 lt!235103)))))

(declare-fun lt!235338 () Unit!9492)

(declare-fun lt!235349 () Unit!9492)

(assert (=> d!48862 (= lt!235338 lt!235349)))

(assert (=> d!48862 (isPrefixOf!0 lt!235343 lt!235343)))

(assert (=> d!48862 (= lt!235349 (lemmaIsPrefixRefl!0 lt!235343))))

(declare-fun lt!235348 () Unit!9492)

(declare-fun lt!235345 () Unit!9492)

(assert (=> d!48862 (= lt!235348 lt!235345)))

(assert (=> d!48862 (isPrefixOf!0 (_2!7093 lt!235111) (_2!7093 lt!235111))))

(assert (=> d!48862 (= lt!235345 (lemmaIsPrefixRefl!0 (_2!7093 lt!235111)))))

(assert (=> d!48862 (= lt!235343 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))))))

(assert (=> d!48862 (isPrefixOf!0 (_2!7093 lt!235111) (_2!7093 lt!235103))))

(assert (=> d!48862 (= (reader!0 (_2!7093 lt!235111) (_2!7093 lt!235103)) lt!235353)))

(declare-fun b!150569 () Bool)

(declare-fun lt!235342 () Unit!9492)

(assert (=> b!150569 (= e!100554 lt!235342)))

(declare-fun lt!235341 () (_ BitVec 64))

(assert (=> b!150569 (= lt!235341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235347 () (_ BitVec 64))

(assert (=> b!150569 (= lt!235347 (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6731 array!6731 (_ BitVec 64) (_ BitVec 64)) Unit!9492)

(assert (=> b!150569 (= lt!235342 (arrayBitRangesEqSymmetric!0 (buf!3527 (_2!7093 lt!235111)) (buf!3527 (_2!7093 lt!235103)) lt!235341 lt!235347))))

(declare-fun arrayBitRangesEq!0 (array!6731 array!6731 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150569 (arrayBitRangesEq!0 (buf!3527 (_2!7093 lt!235103)) (buf!3527 (_2!7093 lt!235111)) lt!235341 lt!235347)))

(declare-fun b!150570 () Bool)

(declare-fun res!126218 () Bool)

(assert (=> b!150570 (=> (not res!126218) (not e!100555))))

(assert (=> b!150570 (= res!126218 (isPrefixOf!0 (_2!7095 lt!235353) (_2!7093 lt!235103)))))

(declare-fun b!150571 () Bool)

(declare-fun Unit!9498 () Unit!9492)

(assert (=> b!150571 (= e!100554 Unit!9498)))

(declare-fun b!150572 () Bool)

(declare-fun lt!235355 () (_ BitVec 64))

(declare-fun lt!235339 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5350 (_ BitVec 64)) BitStream!5350)

(assert (=> b!150572 (= e!100555 (= (_1!7095 lt!235353) (withMovedBitIndex!0 (_2!7095 lt!235353) (bvsub lt!235339 lt!235355))))))

(assert (=> b!150572 (or (= (bvand lt!235339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235339 lt!235355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150572 (= lt!235355 (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235103))) (currentByte!6447 (_2!7093 lt!235103)) (currentBit!6442 (_2!7093 lt!235103))))))

(assert (=> b!150572 (= lt!235339 (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))))))

(assert (= (and d!48862 c!8059) b!150569))

(assert (= (and d!48862 (not c!8059)) b!150571))

(assert (= (and d!48862 res!126217) b!150568))

(assert (= (and b!150568 res!126216) b!150570))

(assert (= (and b!150570 res!126218) b!150572))

(declare-fun m!234789 () Bool)

(assert (=> d!48862 m!234789))

(declare-fun m!234791 () Bool)

(assert (=> d!48862 m!234791))

(declare-fun m!234793 () Bool)

(assert (=> d!48862 m!234793))

(declare-fun m!234795 () Bool)

(assert (=> d!48862 m!234795))

(declare-fun m!234797 () Bool)

(assert (=> d!48862 m!234797))

(declare-fun m!234799 () Bool)

(assert (=> d!48862 m!234799))

(declare-fun m!234801 () Bool)

(assert (=> d!48862 m!234801))

(assert (=> d!48862 m!234585))

(declare-fun m!234803 () Bool)

(assert (=> d!48862 m!234803))

(declare-fun m!234805 () Bool)

(assert (=> d!48862 m!234805))

(declare-fun m!234807 () Bool)

(assert (=> d!48862 m!234807))

(assert (=> b!150569 m!234503))

(declare-fun m!234809 () Bool)

(assert (=> b!150569 m!234809))

(declare-fun m!234811 () Bool)

(assert (=> b!150569 m!234811))

(declare-fun m!234813 () Bool)

(assert (=> b!150572 m!234813))

(assert (=> b!150572 m!234493))

(assert (=> b!150572 m!234503))

(declare-fun m!234815 () Bool)

(assert (=> b!150568 m!234815))

(declare-fun m!234817 () Bool)

(assert (=> b!150570 m!234817))

(assert (=> b!150447 d!48862))

(declare-fun d!48864 () Bool)

(declare-fun res!126223 () Bool)

(declare-fun e!100560 () Bool)

(assert (=> d!48864 (=> res!126223 e!100560)))

(assert (=> d!48864 (= res!126223 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48864 (= (arrayRangesEq!362 arr!237 (_2!7096 lt!235101) #b00000000000000000000000000000000 to!404) e!100560)))

(declare-fun b!150577 () Bool)

(declare-fun e!100561 () Bool)

(assert (=> b!150577 (= e!100560 e!100561)))

(declare-fun res!126224 () Bool)

(assert (=> b!150577 (=> (not res!126224) (not e!100561))))

(assert (=> b!150577 (= res!126224 (= (select (arr!3839 arr!237) #b00000000000000000000000000000000) (select (arr!3839 (_2!7096 lt!235101)) #b00000000000000000000000000000000)))))

(declare-fun b!150578 () Bool)

(assert (=> b!150578 (= e!100561 (arrayRangesEq!362 arr!237 (_2!7096 lt!235101) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48864 (not res!126223)) b!150577))

(assert (= (and b!150577 res!126224) b!150578))

(declare-fun m!234819 () Bool)

(assert (=> b!150577 m!234819))

(declare-fun m!234821 () Bool)

(assert (=> b!150577 m!234821))

(declare-fun m!234823 () Bool)

(assert (=> b!150578 m!234823))

(assert (=> b!150446 d!48864))

(declare-fun d!48866 () Bool)

(assert (=> d!48866 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11944 () Bool)

(assert (= bs!11944 d!48866))

(declare-fun m!234825 () Bool)

(assert (=> bs!11944 m!234825))

(assert (=> b!150437 d!48866))

(declare-fun d!48868 () Bool)

(declare-datatypes ((tuple2!13476 0))(
  ( (tuple2!13477 (_1!7106 (_ BitVec 8)) (_2!7106 BitStream!5350)) )
))
(declare-fun lt!235359 () tuple2!13476)

(declare-fun readByte!0 (BitStream!5350) tuple2!13476)

(assert (=> d!48868 (= lt!235359 (readByte!0 (_1!7095 lt!235106)))))

(assert (=> d!48868 (= (readBytePure!0 (_1!7095 lt!235106)) (tuple2!13455 (_2!7106 lt!235359) (_1!7106 lt!235359)))))

(declare-fun bs!11945 () Bool)

(assert (= bs!11945 d!48868))

(declare-fun m!234827 () Bool)

(assert (=> bs!11945 m!234827))

(assert (=> b!150439 d!48868))

(declare-fun b!150579 () Bool)

(declare-fun res!126225 () Bool)

(declare-fun e!100563 () Bool)

(assert (=> b!150579 (=> (not res!126225) (not e!100563))))

(declare-fun lt!235376 () tuple2!13456)

(assert (=> b!150579 (= res!126225 (isPrefixOf!0 (_1!7095 lt!235376) thiss!1634))))

(declare-fun d!48870 () Bool)

(assert (=> d!48870 e!100563))

(declare-fun res!126226 () Bool)

(assert (=> d!48870 (=> (not res!126226) (not e!100563))))

(assert (=> d!48870 (= res!126226 (isPrefixOf!0 (_1!7095 lt!235376) (_2!7095 lt!235376)))))

(declare-fun lt!235366 () BitStream!5350)

(assert (=> d!48870 (= lt!235376 (tuple2!13457 lt!235366 (_2!7093 lt!235111)))))

(declare-fun lt!235373 () Unit!9492)

(declare-fun lt!235369 () Unit!9492)

(assert (=> d!48870 (= lt!235373 lt!235369)))

(assert (=> d!48870 (isPrefixOf!0 lt!235366 (_2!7093 lt!235111))))

(assert (=> d!48870 (= lt!235369 (lemmaIsPrefixTransitive!0 lt!235366 (_2!7093 lt!235111) (_2!7093 lt!235111)))))

(declare-fun lt!235360 () Unit!9492)

(declare-fun lt!235379 () Unit!9492)

(assert (=> d!48870 (= lt!235360 lt!235379)))

(assert (=> d!48870 (isPrefixOf!0 lt!235366 (_2!7093 lt!235111))))

(assert (=> d!48870 (= lt!235379 (lemmaIsPrefixTransitive!0 lt!235366 thiss!1634 (_2!7093 lt!235111)))))

(declare-fun lt!235377 () Unit!9492)

(declare-fun e!100562 () Unit!9492)

(assert (=> d!48870 (= lt!235377 e!100562)))

(declare-fun c!8060 () Bool)

(assert (=> d!48870 (= c!8060 (not (= (size!3046 (buf!3527 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!235363 () Unit!9492)

(declare-fun lt!235374 () Unit!9492)

(assert (=> d!48870 (= lt!235363 lt!235374)))

(assert (=> d!48870 (isPrefixOf!0 (_2!7093 lt!235111) (_2!7093 lt!235111))))

(assert (=> d!48870 (= lt!235374 (lemmaIsPrefixRefl!0 (_2!7093 lt!235111)))))

(declare-fun lt!235367 () Unit!9492)

(declare-fun lt!235375 () Unit!9492)

(assert (=> d!48870 (= lt!235367 lt!235375)))

(assert (=> d!48870 (= lt!235375 (lemmaIsPrefixRefl!0 (_2!7093 lt!235111)))))

(declare-fun lt!235361 () Unit!9492)

(declare-fun lt!235372 () Unit!9492)

(assert (=> d!48870 (= lt!235361 lt!235372)))

(assert (=> d!48870 (isPrefixOf!0 lt!235366 lt!235366)))

(assert (=> d!48870 (= lt!235372 (lemmaIsPrefixRefl!0 lt!235366))))

(declare-fun lt!235371 () Unit!9492)

(declare-fun lt!235368 () Unit!9492)

(assert (=> d!48870 (= lt!235371 lt!235368)))

(assert (=> d!48870 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48870 (= lt!235368 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48870 (= lt!235366 (BitStream!5351 (buf!3527 (_2!7093 lt!235111)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(assert (=> d!48870 (isPrefixOf!0 thiss!1634 (_2!7093 lt!235111))))

(assert (=> d!48870 (= (reader!0 thiss!1634 (_2!7093 lt!235111)) lt!235376)))

(declare-fun b!150580 () Bool)

(declare-fun lt!235365 () Unit!9492)

(assert (=> b!150580 (= e!100562 lt!235365)))

(declare-fun lt!235364 () (_ BitVec 64))

(assert (=> b!150580 (= lt!235364 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235370 () (_ BitVec 64))

(assert (=> b!150580 (= lt!235370 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(assert (=> b!150580 (= lt!235365 (arrayBitRangesEqSymmetric!0 (buf!3527 thiss!1634) (buf!3527 (_2!7093 lt!235111)) lt!235364 lt!235370))))

(assert (=> b!150580 (arrayBitRangesEq!0 (buf!3527 (_2!7093 lt!235111)) (buf!3527 thiss!1634) lt!235364 lt!235370)))

(declare-fun b!150581 () Bool)

(declare-fun res!126227 () Bool)

(assert (=> b!150581 (=> (not res!126227) (not e!100563))))

(assert (=> b!150581 (= res!126227 (isPrefixOf!0 (_2!7095 lt!235376) (_2!7093 lt!235111)))))

(declare-fun b!150582 () Bool)

(declare-fun Unit!9499 () Unit!9492)

(assert (=> b!150582 (= e!100562 Unit!9499)))

(declare-fun b!150583 () Bool)

(declare-fun lt!235362 () (_ BitVec 64))

(declare-fun lt!235378 () (_ BitVec 64))

(assert (=> b!150583 (= e!100563 (= (_1!7095 lt!235376) (withMovedBitIndex!0 (_2!7095 lt!235376) (bvsub lt!235362 lt!235378))))))

(assert (=> b!150583 (or (= (bvand lt!235362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235378 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235362 lt!235378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150583 (= lt!235378 (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))))))

(assert (=> b!150583 (= lt!235362 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(assert (= (and d!48870 c!8060) b!150580))

(assert (= (and d!48870 (not c!8060)) b!150582))

(assert (= (and d!48870 res!126226) b!150579))

(assert (= (and b!150579 res!126225) b!150581))

(assert (= (and b!150581 res!126227) b!150583))

(declare-fun m!234829 () Bool)

(assert (=> d!48870 m!234829))

(assert (=> d!48870 m!234805))

(declare-fun m!234831 () Bool)

(assert (=> d!48870 m!234831))

(declare-fun m!234833 () Bool)

(assert (=> d!48870 m!234833))

(declare-fun m!234835 () Bool)

(assert (=> d!48870 m!234835))

(declare-fun m!234837 () Bool)

(assert (=> d!48870 m!234837))

(declare-fun m!234839 () Bool)

(assert (=> d!48870 m!234839))

(assert (=> d!48870 m!234563))

(assert (=> d!48870 m!234789))

(declare-fun m!234841 () Bool)

(assert (=> d!48870 m!234841))

(declare-fun m!234843 () Bool)

(assert (=> d!48870 m!234843))

(assert (=> b!150580 m!234495))

(declare-fun m!234845 () Bool)

(assert (=> b!150580 m!234845))

(declare-fun m!234847 () Bool)

(assert (=> b!150580 m!234847))

(declare-fun m!234849 () Bool)

(assert (=> b!150583 m!234849))

(assert (=> b!150583 m!234503))

(assert (=> b!150583 m!234495))

(declare-fun m!234851 () Bool)

(assert (=> b!150579 m!234851))

(declare-fun m!234853 () Bool)

(assert (=> b!150581 m!234853))

(assert (=> b!150439 d!48870))

(declare-fun d!48872 () Bool)

(declare-fun res!126228 () Bool)

(declare-fun e!100564 () Bool)

(assert (=> d!48872 (=> res!126228 e!100564)))

(assert (=> d!48872 (= res!126228 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48872 (= (arrayRangesEq!362 arr!237 (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404) e!100564)))

(declare-fun b!150584 () Bool)

(declare-fun e!100565 () Bool)

(assert (=> b!150584 (= e!100564 e!100565)))

(declare-fun res!126229 () Bool)

(assert (=> b!150584 (=> (not res!126229) (not e!100565))))

(assert (=> b!150584 (= res!126229 (= (select (arr!3839 arr!237) #b00000000000000000000000000000000) (select (arr!3839 (_2!7096 lt!235120)) #b00000000000000000000000000000000)))))

(declare-fun b!150585 () Bool)

(assert (=> b!150585 (= e!100565 (arrayRangesEq!362 arr!237 (_2!7096 lt!235120) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48872 (not res!126228)) b!150584))

(assert (= (and b!150584 res!126229) b!150585))

(assert (=> b!150584 m!234819))

(declare-fun m!234855 () Bool)

(assert (=> b!150584 m!234855))

(declare-fun m!234857 () Bool)

(assert (=> b!150585 m!234857))

(assert (=> b!150449 d!48872))

(declare-fun d!48874 () Bool)

(assert (=> d!48874 (arrayRangesEq!362 arr!237 (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235382 () Unit!9492)

(declare-fun choose!92 (array!6731 array!6731 array!6731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9492)

(assert (=> d!48874 (= lt!235382 (choose!92 arr!237 (_2!7096 lt!235099) (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!48874 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!48874 (= (arrayRangesEqTransitive!77 arr!237 (_2!7096 lt!235099) (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404 to!404) lt!235382)))

(declare-fun bs!11946 () Bool)

(assert (= bs!11946 d!48874))

(assert (=> bs!11946 m!234569))

(declare-fun m!234859 () Bool)

(assert (=> bs!11946 m!234859))

(assert (=> b!150449 d!48874))

(declare-fun d!48876 () Bool)

(declare-fun res!126230 () Bool)

(declare-fun e!100566 () Bool)

(assert (=> d!48876 (=> res!126230 e!100566)))

(assert (=> d!48876 (= res!126230 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48876 (= (arrayRangesEq!362 (_2!7096 lt!235099) (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404) e!100566)))

(declare-fun b!150586 () Bool)

(declare-fun e!100567 () Bool)

(assert (=> b!150586 (= e!100566 e!100567)))

(declare-fun res!126231 () Bool)

(assert (=> b!150586 (=> (not res!126231) (not e!100567))))

(assert (=> b!150586 (= res!126231 (= (select (arr!3839 (_2!7096 lt!235099)) #b00000000000000000000000000000000) (select (arr!3839 (_2!7096 lt!235120)) #b00000000000000000000000000000000)))))

(declare-fun b!150587 () Bool)

(assert (=> b!150587 (= e!100567 (arrayRangesEq!362 (_2!7096 lt!235099) (_2!7096 lt!235120) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48876 (not res!126230)) b!150586))

(assert (= (and b!150586 res!126231) b!150587))

(declare-fun m!234861 () Bool)

(assert (=> b!150586 m!234861))

(assert (=> b!150586 m!234855))

(declare-fun m!234863 () Bool)

(assert (=> b!150587 m!234863))

(assert (=> b!150449 d!48876))

(declare-fun d!48878 () Bool)

(assert (=> d!48878 (arrayRangesEq!362 (_2!7096 lt!235099) (_2!7096 lt!235120) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235385 () Unit!9492)

(declare-fun choose!93 (array!6731 array!6731 (_ BitVec 32) (_ BitVec 32)) Unit!9492)

(assert (=> d!48878 (= lt!235385 (choose!93 (_2!7096 lt!235120) (_2!7096 lt!235099) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48878 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3046 (_2!7096 lt!235120))))))

(assert (=> d!48878 (= (arrayRangesEqSymmetricLemma!94 (_2!7096 lt!235120) (_2!7096 lt!235099) #b00000000000000000000000000000000 to!404) lt!235385)))

(declare-fun bs!11947 () Bool)

(assert (= bs!11947 d!48878))

(assert (=> bs!11947 m!234573))

(declare-fun m!234865 () Bool)

(assert (=> bs!11947 m!234865))

(assert (=> b!150449 d!48878))

(declare-fun d!48880 () Bool)

(declare-fun e!100578 () Bool)

(assert (=> d!48880 e!100578))

(declare-fun res!126245 () Bool)

(assert (=> d!48880 (=> (not res!126245) (not e!100578))))

(declare-fun lt!235404 () (_ BitVec 64))

(declare-fun lt!235402 () (_ BitVec 64))

(declare-fun lt!235406 () (_ BitVec 64))

(assert (=> d!48880 (= res!126245 (= lt!235402 (bvsub lt!235404 lt!235406)))))

(assert (=> d!48880 (or (= (bvand lt!235404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235404 lt!235406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48880 (= lt!235406 (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235103))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235103)))))))

(declare-fun lt!235405 () (_ BitVec 64))

(declare-fun lt!235403 () (_ BitVec 64))

(assert (=> d!48880 (= lt!235404 (bvmul lt!235405 lt!235403))))

(assert (=> d!48880 (or (= lt!235405 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235403 (bvsdiv (bvmul lt!235405 lt!235403) lt!235405)))))

(assert (=> d!48880 (= lt!235403 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48880 (= lt!235405 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))))))

(assert (=> d!48880 (= lt!235402 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235103))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235103)))))))

(assert (=> d!48880 (invariant!0 (currentBit!6442 (_2!7093 lt!235103)) (currentByte!6447 (_2!7093 lt!235103)) (size!3046 (buf!3527 (_2!7093 lt!235103))))))

(assert (=> d!48880 (= (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235103))) (currentByte!6447 (_2!7093 lt!235103)) (currentBit!6442 (_2!7093 lt!235103))) lt!235402)))

(declare-fun b!150600 () Bool)

(declare-fun res!126244 () Bool)

(assert (=> b!150600 (=> (not res!126244) (not e!100578))))

(assert (=> b!150600 (= res!126244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235402))))

(declare-fun b!150601 () Bool)

(declare-fun lt!235401 () (_ BitVec 64))

(assert (=> b!150601 (= e!100578 (bvsle lt!235402 (bvmul lt!235401 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150601 (or (= lt!235401 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235401 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235401)))))

(assert (=> b!150601 (= lt!235401 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))))))

(assert (= (and d!48880 res!126245) b!150600))

(assert (= (and b!150600 res!126244) b!150601))

(declare-fun m!234879 () Bool)

(assert (=> d!48880 m!234879))

(declare-fun m!234881 () Bool)

(assert (=> d!48880 m!234881))

(assert (=> b!150438 d!48880))

(declare-fun d!48890 () Bool)

(declare-fun e!100579 () Bool)

(assert (=> d!48890 e!100579))

(declare-fun res!126247 () Bool)

(assert (=> d!48890 (=> (not res!126247) (not e!100579))))

(declare-fun lt!235410 () (_ BitVec 64))

(declare-fun lt!235408 () (_ BitVec 64))

(declare-fun lt!235412 () (_ BitVec 64))

(assert (=> d!48890 (= res!126247 (= lt!235408 (bvsub lt!235410 lt!235412)))))

(assert (=> d!48890 (or (= (bvand lt!235410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235412 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235410 lt!235412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48890 (= lt!235412 (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111)))))))

(declare-fun lt!235411 () (_ BitVec 64))

(declare-fun lt!235409 () (_ BitVec 64))

(assert (=> d!48890 (= lt!235410 (bvmul lt!235411 lt!235409))))

(assert (=> d!48890 (or (= lt!235411 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235409 (bvsdiv (bvmul lt!235411 lt!235409) lt!235411)))))

(assert (=> d!48890 (= lt!235409 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48890 (= lt!235411 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))))))

(assert (=> d!48890 (= lt!235408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111)))))))

(assert (=> d!48890 (invariant!0 (currentBit!6442 (_2!7093 lt!235111)) (currentByte!6447 (_2!7093 lt!235111)) (size!3046 (buf!3527 (_2!7093 lt!235111))))))

(assert (=> d!48890 (= (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))) lt!235408)))

(declare-fun b!150602 () Bool)

(declare-fun res!126246 () Bool)

(assert (=> b!150602 (=> (not res!126246) (not e!100579))))

(assert (=> b!150602 (= res!126246 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235408))))

(declare-fun b!150603 () Bool)

(declare-fun lt!235407 () (_ BitVec 64))

(assert (=> b!150603 (= e!100579 (bvsle lt!235408 (bvmul lt!235407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150603 (or (= lt!235407 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235407 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235407)))))

(assert (=> b!150603 (= lt!235407 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))))))

(assert (= (and d!48890 res!126247) b!150602))

(assert (= (and b!150602 res!126246) b!150603))

(declare-fun m!234883 () Bool)

(assert (=> d!48890 m!234883))

(declare-fun m!234885 () Bool)

(assert (=> d!48890 m!234885))

(assert (=> b!150438 d!48890))

(declare-fun d!48892 () Bool)

(assert (=> d!48892 (= (invariant!0 (currentBit!6442 thiss!1634) (currentByte!6447 thiss!1634) (size!3046 (buf!3527 (_2!7093 lt!235111)))) (and (bvsge (currentBit!6442 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6442 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6447 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6447 thiss!1634) (size!3046 (buf!3527 (_2!7093 lt!235111)))) (and (= (currentBit!6442 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6447 thiss!1634) (size!3046 (buf!3527 (_2!7093 lt!235111))))))))))

(assert (=> b!150440 d!48892))

(declare-fun d!48894 () Bool)

(declare-fun lt!235413 () tuple2!13476)

(assert (=> d!48894 (= lt!235413 (readByte!0 (_1!7095 lt!235115)))))

(assert (=> d!48894 (= (readBytePure!0 (_1!7095 lt!235115)) (tuple2!13455 (_2!7106 lt!235413) (_1!7106 lt!235413)))))

(declare-fun bs!11949 () Bool)

(assert (= bs!11949 d!48894))

(declare-fun m!234887 () Bool)

(assert (=> bs!11949 m!234887))

(assert (=> b!150441 d!48894))

(declare-fun d!48896 () Bool)

(declare-fun res!126256 () Bool)

(declare-fun e!100584 () Bool)

(assert (=> d!48896 (=> (not res!126256) (not e!100584))))

(assert (=> d!48896 (= res!126256 (= (size!3046 (buf!3527 thiss!1634)) (size!3046 (buf!3527 (_2!7093 lt!235103)))))))

(assert (=> d!48896 (= (isPrefixOf!0 thiss!1634 (_2!7093 lt!235103)) e!100584)))

(declare-fun b!150610 () Bool)

(declare-fun res!126254 () Bool)

(assert (=> b!150610 (=> (not res!126254) (not e!100584))))

(assert (=> b!150610 (= res!126254 (bvsle (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)) (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235103))) (currentByte!6447 (_2!7093 lt!235103)) (currentBit!6442 (_2!7093 lt!235103)))))))

(declare-fun b!150611 () Bool)

(declare-fun e!100585 () Bool)

(assert (=> b!150611 (= e!100584 e!100585)))

(declare-fun res!126255 () Bool)

(assert (=> b!150611 (=> res!126255 e!100585)))

(assert (=> b!150611 (= res!126255 (= (size!3046 (buf!3527 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!150612 () Bool)

(assert (=> b!150612 (= e!100585 (arrayBitRangesEq!0 (buf!3527 thiss!1634) (buf!3527 (_2!7093 lt!235103)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634))))))

(assert (= (and d!48896 res!126256) b!150610))

(assert (= (and b!150610 res!126254) b!150611))

(assert (= (and b!150611 (not res!126255)) b!150612))

(assert (=> b!150610 m!234495))

(assert (=> b!150610 m!234493))

(assert (=> b!150612 m!234495))

(assert (=> b!150612 m!234495))

(declare-fun m!234891 () Bool)

(assert (=> b!150612 m!234891))

(assert (=> b!150441 d!48896))

(declare-fun d!48900 () Bool)

(assert (=> d!48900 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!235419 () Unit!9492)

(declare-fun choose!26 (BitStream!5350 array!6731 (_ BitVec 32) BitStream!5350) Unit!9492)

(assert (=> d!48900 (= lt!235419 (choose!26 thiss!1634 (buf!3527 (_2!7093 lt!235103)) (bvsub to!404 from!447) (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634))))))

(assert (=> d!48900 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3527 (_2!7093 lt!235103)) (bvsub to!404 from!447)) lt!235419)))

(declare-fun bs!11951 () Bool)

(assert (= bs!11951 d!48900))

(assert (=> bs!11951 m!234517))

(declare-fun m!234893 () Bool)

(assert (=> bs!11951 m!234893))

(assert (=> b!150441 d!48900))

(declare-fun d!48908 () Bool)

(declare-fun e!100586 () Bool)

(assert (=> d!48908 e!100586))

(declare-fun res!126258 () Bool)

(assert (=> d!48908 (=> (not res!126258) (not e!100586))))

(declare-fun lt!235421 () (_ BitVec 64))

(declare-fun lt!235425 () (_ BitVec 64))

(declare-fun lt!235423 () (_ BitVec 64))

(assert (=> d!48908 (= res!126258 (= lt!235421 (bvsub lt!235423 lt!235425)))))

(assert (=> d!48908 (or (= (bvand lt!235423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235423 lt!235425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48908 (= lt!235425 (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_1!7094 lt!235122)))) ((_ sign_extend 32) (currentByte!6447 (_1!7094 lt!235122))) ((_ sign_extend 32) (currentBit!6442 (_1!7094 lt!235122)))))))

(declare-fun lt!235424 () (_ BitVec 64))

(declare-fun lt!235422 () (_ BitVec 64))

(assert (=> d!48908 (= lt!235423 (bvmul lt!235424 lt!235422))))

(assert (=> d!48908 (or (= lt!235424 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235422 (bvsdiv (bvmul lt!235424 lt!235422) lt!235424)))))

(assert (=> d!48908 (= lt!235422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48908 (= lt!235424 ((_ sign_extend 32) (size!3046 (buf!3527 (_1!7094 lt!235122)))))))

(assert (=> d!48908 (= lt!235421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6447 (_1!7094 lt!235122))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6442 (_1!7094 lt!235122)))))))

(assert (=> d!48908 (invariant!0 (currentBit!6442 (_1!7094 lt!235122)) (currentByte!6447 (_1!7094 lt!235122)) (size!3046 (buf!3527 (_1!7094 lt!235122))))))

(assert (=> d!48908 (= (bitIndex!0 (size!3046 (buf!3527 (_1!7094 lt!235122))) (currentByte!6447 (_1!7094 lt!235122)) (currentBit!6442 (_1!7094 lt!235122))) lt!235421)))

(declare-fun b!150613 () Bool)

(declare-fun res!126257 () Bool)

(assert (=> b!150613 (=> (not res!126257) (not e!100586))))

(assert (=> b!150613 (= res!126257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235421))))

(declare-fun b!150614 () Bool)

(declare-fun lt!235420 () (_ BitVec 64))

(assert (=> b!150614 (= e!100586 (bvsle lt!235421 (bvmul lt!235420 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150614 (or (= lt!235420 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235420 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235420)))))

(assert (=> b!150614 (= lt!235420 ((_ sign_extend 32) (size!3046 (buf!3527 (_1!7094 lt!235122)))))))

(assert (= (and d!48908 res!126258) b!150613))

(assert (= (and b!150613 res!126257) b!150614))

(declare-fun m!234895 () Bool)

(assert (=> d!48908 m!234895))

(declare-fun m!234897 () Bool)

(assert (=> d!48908 m!234897))

(assert (=> b!150441 d!48908))

(assert (=> b!150441 d!48862))

(declare-fun d!48910 () Bool)

(assert (=> d!48910 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235095)))

(declare-fun lt!235426 () Unit!9492)

(assert (=> d!48910 (= lt!235426 (choose!26 (_2!7093 lt!235111) (buf!3527 (_2!7093 lt!235103)) lt!235095 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111)))))))

(assert (=> d!48910 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7093 lt!235111) (buf!3527 (_2!7093 lt!235103)) lt!235095) lt!235426)))

(declare-fun bs!11952 () Bool)

(assert (= bs!11952 d!48910))

(assert (=> bs!11952 m!234521))

(declare-fun m!234899 () Bool)

(assert (=> bs!11952 m!234899))

(assert (=> b!150441 d!48910))

(declare-fun d!48912 () Bool)

(declare-fun lt!235427 () tuple2!13476)

(assert (=> d!48912 (= lt!235427 (readByte!0 lt!235108))))

(assert (=> d!48912 (= (readBytePure!0 lt!235108) (tuple2!13455 (_2!7106 lt!235427) (_1!7106 lt!235427)))))

(declare-fun bs!11953 () Bool)

(assert (= bs!11953 d!48912))

(declare-fun m!234901 () Bool)

(assert (=> bs!11953 m!234901))

(assert (=> b!150441 d!48912))

(declare-fun d!48914 () Bool)

(assert (=> d!48914 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11954 () Bool)

(assert (= bs!11954 d!48914))

(declare-fun m!234903 () Bool)

(assert (=> bs!11954 m!234903))

(assert (=> b!150441 d!48914))

(declare-fun d!48916 () Bool)

(declare-fun lt!235428 () tuple3!588)

(assert (=> d!48916 (= lt!235428 (readByteArrayLoop!0 (_1!7095 lt!235115) arr!237 from!447 to!404))))

(assert (=> d!48916 (= (readByteArrayLoopPure!0 (_1!7095 lt!235115) arr!237 from!447 to!404) (tuple2!13459 (_2!7105 lt!235428) (_3!367 lt!235428)))))

(declare-fun bs!11955 () Bool)

(assert (= bs!11955 d!48916))

(declare-fun m!234905 () Bool)

(assert (=> bs!11955 m!234905))

(assert (=> b!150441 d!48916))

(declare-fun d!48918 () Bool)

(assert (=> d!48918 (isPrefixOf!0 thiss!1634 (_2!7093 lt!235103))))

(declare-fun lt!235431 () Unit!9492)

(declare-fun choose!30 (BitStream!5350 BitStream!5350 BitStream!5350) Unit!9492)

(assert (=> d!48918 (= lt!235431 (choose!30 thiss!1634 (_2!7093 lt!235111) (_2!7093 lt!235103)))))

(assert (=> d!48918 (isPrefixOf!0 thiss!1634 (_2!7093 lt!235111))))

(assert (=> d!48918 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7093 lt!235111) (_2!7093 lt!235103)) lt!235431)))

(declare-fun bs!11956 () Bool)

(assert (= bs!11956 d!48918))

(assert (=> bs!11956 m!234559))

(declare-fun m!234907 () Bool)

(assert (=> bs!11956 m!234907))

(assert (=> bs!11956 m!234563))

(assert (=> b!150441 d!48918))

(declare-fun d!48920 () Bool)

(assert (=> d!48920 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235095) (bvsle ((_ sign_extend 32) lt!235095) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11957 () Bool)

(assert (= bs!11957 d!48920))

(assert (=> bs!11957 m!234883))

(assert (=> b!150441 d!48920))

(declare-fun d!48922 () Bool)

(declare-fun e!100597 () Bool)

(assert (=> d!48922 e!100597))

(declare-fun res!126272 () Bool)

(assert (=> d!48922 (=> (not res!126272) (not e!100597))))

(assert (=> d!48922 (= res!126272 (and (or (let ((rhs!3286 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3286 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3286) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!48929 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!48929 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!48929 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3285 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3285 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3285) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!235440 () Unit!9492)

(declare-fun choose!57 (BitStream!5350 BitStream!5350 (_ BitVec 64) (_ BitVec 32)) Unit!9492)

(assert (=> d!48922 (= lt!235440 (choose!57 thiss!1634 (_2!7093 lt!235111) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!48922 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7093 lt!235111) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!235440)))

(declare-fun b!150628 () Bool)

(declare-fun lt!235439 () (_ BitVec 32))

(assert (=> b!150628 (= e!100597 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) (bvsub (bvsub to!404 from!447) lt!235439)))))

(assert (=> b!150628 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!235439 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!235439) #b10000000000000000000000000000000)))))

(declare-fun lt!235438 () (_ BitVec 64))

(assert (=> b!150628 (= lt!235439 ((_ extract 31 0) lt!235438))))

(assert (=> b!150628 (and (bvslt lt!235438 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!235438 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!150628 (= lt!235438 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!48922 res!126272) b!150628))

(declare-fun m!234917 () Bool)

(assert (=> d!48922 m!234917))

(declare-fun m!234919 () Bool)

(assert (=> b!150628 m!234919))

(assert (=> b!150441 d!48922))

(declare-fun b!150629 () Bool)

(declare-fun res!126273 () Bool)

(declare-fun e!100599 () Bool)

(assert (=> b!150629 (=> (not res!126273) (not e!100599))))

(declare-fun lt!235457 () tuple2!13456)

(assert (=> b!150629 (= res!126273 (isPrefixOf!0 (_1!7095 lt!235457) thiss!1634))))

(declare-fun d!48937 () Bool)

(assert (=> d!48937 e!100599))

(declare-fun res!126274 () Bool)

(assert (=> d!48937 (=> (not res!126274) (not e!100599))))

(assert (=> d!48937 (= res!126274 (isPrefixOf!0 (_1!7095 lt!235457) (_2!7095 lt!235457)))))

(declare-fun lt!235447 () BitStream!5350)

(assert (=> d!48937 (= lt!235457 (tuple2!13457 lt!235447 (_2!7093 lt!235103)))))

(declare-fun lt!235454 () Unit!9492)

(declare-fun lt!235450 () Unit!9492)

(assert (=> d!48937 (= lt!235454 lt!235450)))

(assert (=> d!48937 (isPrefixOf!0 lt!235447 (_2!7093 lt!235103))))

(assert (=> d!48937 (= lt!235450 (lemmaIsPrefixTransitive!0 lt!235447 (_2!7093 lt!235103) (_2!7093 lt!235103)))))

(declare-fun lt!235441 () Unit!9492)

(declare-fun lt!235460 () Unit!9492)

(assert (=> d!48937 (= lt!235441 lt!235460)))

(assert (=> d!48937 (isPrefixOf!0 lt!235447 (_2!7093 lt!235103))))

(assert (=> d!48937 (= lt!235460 (lemmaIsPrefixTransitive!0 lt!235447 thiss!1634 (_2!7093 lt!235103)))))

(declare-fun lt!235458 () Unit!9492)

(declare-fun e!100598 () Unit!9492)

(assert (=> d!48937 (= lt!235458 e!100598)))

(declare-fun c!8061 () Bool)

(assert (=> d!48937 (= c!8061 (not (= (size!3046 (buf!3527 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!235444 () Unit!9492)

(declare-fun lt!235455 () Unit!9492)

(assert (=> d!48937 (= lt!235444 lt!235455)))

(assert (=> d!48937 (isPrefixOf!0 (_2!7093 lt!235103) (_2!7093 lt!235103))))

(assert (=> d!48937 (= lt!235455 (lemmaIsPrefixRefl!0 (_2!7093 lt!235103)))))

(declare-fun lt!235448 () Unit!9492)

(declare-fun lt!235456 () Unit!9492)

(assert (=> d!48937 (= lt!235448 lt!235456)))

(assert (=> d!48937 (= lt!235456 (lemmaIsPrefixRefl!0 (_2!7093 lt!235103)))))

(declare-fun lt!235442 () Unit!9492)

(declare-fun lt!235453 () Unit!9492)

(assert (=> d!48937 (= lt!235442 lt!235453)))

(assert (=> d!48937 (isPrefixOf!0 lt!235447 lt!235447)))

(assert (=> d!48937 (= lt!235453 (lemmaIsPrefixRefl!0 lt!235447))))

(declare-fun lt!235452 () Unit!9492)

(declare-fun lt!235449 () Unit!9492)

(assert (=> d!48937 (= lt!235452 lt!235449)))

(assert (=> d!48937 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48937 (= lt!235449 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48937 (= lt!235447 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(assert (=> d!48937 (isPrefixOf!0 thiss!1634 (_2!7093 lt!235103))))

(assert (=> d!48937 (= (reader!0 thiss!1634 (_2!7093 lt!235103)) lt!235457)))

(declare-fun b!150630 () Bool)

(declare-fun lt!235446 () Unit!9492)

(assert (=> b!150630 (= e!100598 lt!235446)))

(declare-fun lt!235445 () (_ BitVec 64))

(assert (=> b!150630 (= lt!235445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235451 () (_ BitVec 64))

(assert (=> b!150630 (= lt!235451 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(assert (=> b!150630 (= lt!235446 (arrayBitRangesEqSymmetric!0 (buf!3527 thiss!1634) (buf!3527 (_2!7093 lt!235103)) lt!235445 lt!235451))))

(assert (=> b!150630 (arrayBitRangesEq!0 (buf!3527 (_2!7093 lt!235103)) (buf!3527 thiss!1634) lt!235445 lt!235451)))

(declare-fun b!150631 () Bool)

(declare-fun res!126275 () Bool)

(assert (=> b!150631 (=> (not res!126275) (not e!100599))))

(assert (=> b!150631 (= res!126275 (isPrefixOf!0 (_2!7095 lt!235457) (_2!7093 lt!235103)))))

(declare-fun b!150632 () Bool)

(declare-fun Unit!9500 () Unit!9492)

(assert (=> b!150632 (= e!100598 Unit!9500)))

(declare-fun lt!235459 () (_ BitVec 64))

(declare-fun lt!235443 () (_ BitVec 64))

(declare-fun b!150633 () Bool)

(assert (=> b!150633 (= e!100599 (= (_1!7095 lt!235457) (withMovedBitIndex!0 (_2!7095 lt!235457) (bvsub lt!235443 lt!235459))))))

(assert (=> b!150633 (or (= (bvand lt!235443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235443 lt!235459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150633 (= lt!235459 (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235103))) (currentByte!6447 (_2!7093 lt!235103)) (currentBit!6442 (_2!7093 lt!235103))))))

(assert (=> b!150633 (= lt!235443 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(assert (= (and d!48937 c!8061) b!150630))

(assert (= (and d!48937 (not c!8061)) b!150632))

(assert (= (and d!48937 res!126274) b!150629))

(assert (= (and b!150629 res!126273) b!150631))

(assert (= (and b!150631 res!126275) b!150633))

(assert (=> d!48937 m!234829))

(assert (=> d!48937 m!234791))

(declare-fun m!234921 () Bool)

(assert (=> d!48937 m!234921))

(declare-fun m!234923 () Bool)

(assert (=> d!48937 m!234923))

(declare-fun m!234925 () Bool)

(assert (=> d!48937 m!234925))

(declare-fun m!234927 () Bool)

(assert (=> d!48937 m!234927))

(declare-fun m!234929 () Bool)

(assert (=> d!48937 m!234929))

(assert (=> d!48937 m!234559))

(assert (=> d!48937 m!234803))

(assert (=> d!48937 m!234841))

(declare-fun m!234931 () Bool)

(assert (=> d!48937 m!234931))

(assert (=> b!150630 m!234495))

(declare-fun m!234933 () Bool)

(assert (=> b!150630 m!234933))

(declare-fun m!234935 () Bool)

(assert (=> b!150630 m!234935))

(declare-fun m!234937 () Bool)

(assert (=> b!150633 m!234937))

(assert (=> b!150633 m!234493))

(assert (=> b!150633 m!234495))

(declare-fun m!234939 () Bool)

(assert (=> b!150629 m!234939))

(declare-fun m!234941 () Bool)

(assert (=> b!150631 m!234941))

(assert (=> b!150441 d!48937))

(declare-fun d!48939 () Bool)

(declare-fun res!126276 () Bool)

(declare-fun e!100600 () Bool)

(assert (=> d!48939 (=> res!126276 e!100600)))

(assert (=> d!48939 (= res!126276 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48939 (= (arrayRangesEq!362 (_2!7096 lt!235120) (_2!7096 lt!235099) #b00000000000000000000000000000000 to!404) e!100600)))

(declare-fun b!150634 () Bool)

(declare-fun e!100601 () Bool)

(assert (=> b!150634 (= e!100600 e!100601)))

(declare-fun res!126277 () Bool)

(assert (=> b!150634 (=> (not res!126277) (not e!100601))))

(assert (=> b!150634 (= res!126277 (= (select (arr!3839 (_2!7096 lt!235120)) #b00000000000000000000000000000000) (select (arr!3839 (_2!7096 lt!235099)) #b00000000000000000000000000000000)))))

(declare-fun b!150635 () Bool)

(assert (=> b!150635 (= e!100601 (arrayRangesEq!362 (_2!7096 lt!235120) (_2!7096 lt!235099) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48939 (not res!126276)) b!150634))

(assert (= (and b!150634 res!126277) b!150635))

(assert (=> b!150634 m!234855))

(assert (=> b!150634 m!234861))

(declare-fun m!234943 () Bool)

(assert (=> b!150635 m!234943))

(assert (=> b!150441 d!48939))

(declare-fun d!48941 () Bool)

(declare-fun res!126278 () Bool)

(declare-fun e!100602 () Bool)

(assert (=> d!48941 (=> res!126278 e!100602)))

(assert (=> d!48941 (= res!126278 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48941 (= (arrayRangesEq!362 (_2!7096 lt!235120) (_2!7096 lt!235102) #b00000000000000000000000000000000 to!404) e!100602)))

(declare-fun b!150636 () Bool)

(declare-fun e!100603 () Bool)

(assert (=> b!150636 (= e!100602 e!100603)))

(declare-fun res!126279 () Bool)

(assert (=> b!150636 (=> (not res!126279) (not e!100603))))

(assert (=> b!150636 (= res!126279 (= (select (arr!3839 (_2!7096 lt!235120)) #b00000000000000000000000000000000) (select (arr!3839 (_2!7096 lt!235102)) #b00000000000000000000000000000000)))))

(declare-fun b!150637 () Bool)

(assert (=> b!150637 (= e!100603 (arrayRangesEq!362 (_2!7096 lt!235120) (_2!7096 lt!235102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48941 (not res!126278)) b!150636))

(assert (= (and b!150636 res!126279) b!150637))

(assert (=> b!150636 m!234855))

(declare-fun m!234945 () Bool)

(assert (=> b!150636 m!234945))

(declare-fun m!234947 () Bool)

(assert (=> b!150637 m!234947))

(assert (=> b!150441 d!48941))

(declare-fun d!48943 () Bool)

(declare-fun e!100610 () Bool)

(assert (=> d!48943 e!100610))

(declare-fun res!126290 () Bool)

(assert (=> d!48943 (=> (not res!126290) (not e!100610))))

(declare-fun lt!235493 () tuple2!13454)

(declare-fun lt!235496 () tuple2!13454)

(assert (=> d!48943 (= res!126290 (= (bitIndex!0 (size!3046 (buf!3527 (_1!7094 lt!235493))) (currentByte!6447 (_1!7094 lt!235493)) (currentBit!6442 (_1!7094 lt!235493))) (bitIndex!0 (size!3046 (buf!3527 (_1!7094 lt!235496))) (currentByte!6447 (_1!7094 lt!235496)) (currentBit!6442 (_1!7094 lt!235496)))))))

(declare-fun lt!235495 () Unit!9492)

(declare-fun lt!235494 () BitStream!5350)

(declare-fun choose!14 (BitStream!5350 BitStream!5350 BitStream!5350 tuple2!13454 tuple2!13454 BitStream!5350 (_ BitVec 8) tuple2!13454 tuple2!13454 BitStream!5350 (_ BitVec 8)) Unit!9492)

(assert (=> d!48943 (= lt!235495 (choose!14 lt!235108 (_2!7093 lt!235103) lt!235494 lt!235493 (tuple2!13455 (_1!7094 lt!235493) (_2!7094 lt!235493)) (_1!7094 lt!235493) (_2!7094 lt!235493) lt!235496 (tuple2!13455 (_1!7094 lt!235496) (_2!7094 lt!235496)) (_1!7094 lt!235496) (_2!7094 lt!235496)))))

(assert (=> d!48943 (= lt!235496 (readBytePure!0 lt!235494))))

(assert (=> d!48943 (= lt!235493 (readBytePure!0 lt!235108))))

(assert (=> d!48943 (= lt!235494 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 lt!235108) (currentBit!6442 lt!235108)))))

(assert (=> d!48943 (= (readBytePrefixLemma!0 lt!235108 (_2!7093 lt!235103)) lt!235495)))

(declare-fun b!150648 () Bool)

(assert (=> b!150648 (= e!100610 (= (_2!7094 lt!235493) (_2!7094 lt!235496)))))

(assert (= (and d!48943 res!126290) b!150648))

(assert (=> d!48943 m!234539))

(declare-fun m!234953 () Bool)

(assert (=> d!48943 m!234953))

(declare-fun m!234955 () Bool)

(assert (=> d!48943 m!234955))

(declare-fun m!234957 () Bool)

(assert (=> d!48943 m!234957))

(declare-fun m!234959 () Bool)

(assert (=> d!48943 m!234959))

(assert (=> b!150441 d!48943))

(declare-fun d!48949 () Bool)

(assert (=> d!48949 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235095) (bvsle ((_ sign_extend 32) lt!235095) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235103)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11961 () Bool)

(assert (= bs!11961 d!48949))

(assert (=> bs!11961 m!234785))

(assert (=> b!150441 d!48949))

(declare-fun lt!235497 () tuple3!588)

(declare-fun d!48951 () Bool)

(assert (=> d!48951 (= lt!235497 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7095 lt!235115) #b00000000000000000000000000000001) lt!235107 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48951 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7095 lt!235115) #b00000000000000000000000000000001) lt!235107 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13459 (_2!7105 lt!235497) (_3!367 lt!235497)))))

(declare-fun bs!11962 () Bool)

(assert (= bs!11962 d!48951))

(assert (=> bs!11962 m!234525))

(declare-fun m!234961 () Bool)

(assert (=> bs!11962 m!234961))

(assert (=> b!150441 d!48951))

(declare-fun d!48953 () Bool)

(declare-fun lt!235498 () tuple2!13476)

(assert (=> d!48953 (= lt!235498 (readByte!0 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634))))))

(assert (=> d!48953 (= (readBytePure!0 (BitStream!5351 (buf!3527 (_2!7093 lt!235103)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634))) (tuple2!13455 (_2!7106 lt!235498) (_1!7106 lt!235498)))))

(declare-fun bs!11963 () Bool)

(assert (= bs!11963 d!48953))

(declare-fun m!234963 () Bool)

(assert (=> bs!11963 m!234963))

(assert (=> b!150441 d!48953))

(declare-fun d!48955 () Bool)

(declare-fun e!100611 () Bool)

(assert (=> d!48955 e!100611))

(declare-fun res!126292 () Bool)

(assert (=> d!48955 (=> (not res!126292) (not e!100611))))

(declare-fun lt!235504 () (_ BitVec 64))

(declare-fun lt!235502 () (_ BitVec 64))

(declare-fun lt!235500 () (_ BitVec 64))

(assert (=> d!48955 (= res!126292 (= lt!235500 (bvsub lt!235502 lt!235504)))))

(assert (=> d!48955 (or (= (bvand lt!235502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235502 lt!235504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48955 (= lt!235504 (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 (_1!7094 lt!235121)))) ((_ sign_extend 32) (currentByte!6447 (_1!7094 lt!235121))) ((_ sign_extend 32) (currentBit!6442 (_1!7094 lt!235121)))))))

(declare-fun lt!235503 () (_ BitVec 64))

(declare-fun lt!235501 () (_ BitVec 64))

(assert (=> d!48955 (= lt!235502 (bvmul lt!235503 lt!235501))))

(assert (=> d!48955 (or (= lt!235503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235501 (bvsdiv (bvmul lt!235503 lt!235501) lt!235503)))))

(assert (=> d!48955 (= lt!235501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48955 (= lt!235503 ((_ sign_extend 32) (size!3046 (buf!3527 (_1!7094 lt!235121)))))))

(assert (=> d!48955 (= lt!235500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6447 (_1!7094 lt!235121))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6442 (_1!7094 lt!235121)))))))

(assert (=> d!48955 (invariant!0 (currentBit!6442 (_1!7094 lt!235121)) (currentByte!6447 (_1!7094 lt!235121)) (size!3046 (buf!3527 (_1!7094 lt!235121))))))

(assert (=> d!48955 (= (bitIndex!0 (size!3046 (buf!3527 (_1!7094 lt!235121))) (currentByte!6447 (_1!7094 lt!235121)) (currentBit!6442 (_1!7094 lt!235121))) lt!235500)))

(declare-fun b!150649 () Bool)

(declare-fun res!126291 () Bool)

(assert (=> b!150649 (=> (not res!126291) (not e!100611))))

(assert (=> b!150649 (= res!126291 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235500))))

(declare-fun b!150650 () Bool)

(declare-fun lt!235499 () (_ BitVec 64))

(assert (=> b!150650 (= e!100611 (bvsle lt!235500 (bvmul lt!235499 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150650 (or (= lt!235499 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235499 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235499)))))

(assert (=> b!150650 (= lt!235499 ((_ sign_extend 32) (size!3046 (buf!3527 (_1!7094 lt!235121)))))))

(assert (= (and d!48955 res!126292) b!150649))

(assert (= (and b!150649 res!126291) b!150650))

(declare-fun m!234965 () Bool)

(assert (=> d!48955 m!234965))

(declare-fun m!234967 () Bool)

(assert (=> d!48955 m!234967))

(assert (=> b!150441 d!48955))

(declare-fun lt!235505 () tuple3!588)

(declare-fun d!48957 () Bool)

(assert (=> d!48957 (= lt!235505 (readByteArrayLoop!0 (_1!7095 lt!235118) lt!235107 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48957 (= (readByteArrayLoopPure!0 (_1!7095 lt!235118) lt!235107 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13459 (_2!7105 lt!235505) (_3!367 lt!235505)))))

(declare-fun bs!11964 () Bool)

(assert (= bs!11964 d!48957))

(declare-fun m!234969 () Bool)

(assert (=> bs!11964 m!234969))

(assert (=> b!150441 d!48957))

(declare-fun d!48959 () Bool)

(declare-fun e!100614 () Bool)

(assert (=> d!48959 e!100614))

(declare-fun res!126300 () Bool)

(assert (=> d!48959 (=> (not res!126300) (not e!100614))))

(declare-fun lt!235525 () tuple2!13452)

(assert (=> d!48959 (= res!126300 (= (size!3046 (buf!3527 thiss!1634)) (size!3046 (buf!3527 (_2!7093 lt!235525)))))))

(declare-fun choose!6 (BitStream!5350 (_ BitVec 8)) tuple2!13452)

(assert (=> d!48959 (= lt!235525 (choose!6 thiss!1634 (select (arr!3839 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!48959 (validate_offset_byte!0 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)))))

(assert (=> d!48959 (= (appendByte!0 thiss!1634 (select (arr!3839 arr!237) from!447)) lt!235525)))

(declare-fun b!150657 () Bool)

(declare-fun res!126299 () Bool)

(assert (=> b!150657 (=> (not res!126299) (not e!100614))))

(declare-fun lt!235524 () (_ BitVec 64))

(declare-fun lt!235522 () (_ BitVec 64))

(assert (=> b!150657 (= res!126299 (= (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235525))) (currentByte!6447 (_2!7093 lt!235525)) (currentBit!6442 (_2!7093 lt!235525))) (bvadd lt!235522 lt!235524)))))

(assert (=> b!150657 (or (not (= (bvand lt!235522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235524 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!235522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!235522 lt!235524) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150657 (= lt!235524 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!150657 (= lt!235522 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)))))

(declare-fun b!150658 () Bool)

(declare-fun res!126301 () Bool)

(assert (=> b!150658 (=> (not res!126301) (not e!100614))))

(assert (=> b!150658 (= res!126301 (isPrefixOf!0 thiss!1634 (_2!7093 lt!235525)))))

(declare-fun b!150659 () Bool)

(declare-fun lt!235523 () tuple2!13454)

(declare-fun lt!235526 () tuple2!13456)

(assert (=> b!150659 (= e!100614 (and (= (_2!7094 lt!235523) (select (arr!3839 arr!237) from!447)) (= (_1!7094 lt!235523) (_2!7095 lt!235526))))))

(assert (=> b!150659 (= lt!235523 (readBytePure!0 (_1!7095 lt!235526)))))

(assert (=> b!150659 (= lt!235526 (reader!0 thiss!1634 (_2!7093 lt!235525)))))

(assert (= (and d!48959 res!126300) b!150657))

(assert (= (and b!150657 res!126299) b!150658))

(assert (= (and b!150658 res!126301) b!150659))

(assert (=> d!48959 m!234497))

(declare-fun m!234977 () Bool)

(assert (=> d!48959 m!234977))

(declare-fun m!234979 () Bool)

(assert (=> d!48959 m!234979))

(declare-fun m!234981 () Bool)

(assert (=> b!150657 m!234981))

(assert (=> b!150657 m!234495))

(declare-fun m!234983 () Bool)

(assert (=> b!150658 m!234983))

(declare-fun m!234985 () Bool)

(assert (=> b!150659 m!234985))

(declare-fun m!234987 () Bool)

(assert (=> b!150659 m!234987))

(assert (=> b!150441 d!48959))

(declare-fun d!48967 () Bool)

(declare-fun lt!235535 () tuple2!13458)

(declare-fun lt!235537 () tuple2!13458)

(assert (=> d!48967 (arrayRangesEq!362 (_2!7096 lt!235535) (_2!7096 lt!235537) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235538 () Unit!9492)

(declare-fun lt!235536 () BitStream!5350)

(declare-fun choose!35 (BitStream!5350 array!6731 (_ BitVec 32) (_ BitVec 32) tuple2!13458 array!6731 BitStream!5350 tuple2!13458 array!6731) Unit!9492)

(assert (=> d!48967 (= lt!235538 (choose!35 (_1!7095 lt!235115) arr!237 from!447 to!404 lt!235535 (_2!7096 lt!235535) lt!235536 lt!235537 (_2!7096 lt!235537)))))

(assert (=> d!48967 (= lt!235537 (readByteArrayLoopPure!0 lt!235536 (array!6732 (store (arr!3839 arr!237) from!447 (_2!7094 (readBytePure!0 (_1!7095 lt!235115)))) (size!3046 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48967 (= lt!235536 (withMovedByteIndex!0 (_1!7095 lt!235115) #b00000000000000000000000000000001))))

(assert (=> d!48967 (= lt!235535 (readByteArrayLoopPure!0 (_1!7095 lt!235115) arr!237 from!447 to!404))))

(assert (=> d!48967 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7095 lt!235115) arr!237 from!447 to!404) lt!235538)))

(declare-fun bs!11969 () Bool)

(assert (= bs!11969 d!48967))

(declare-fun m!234989 () Bool)

(assert (=> bs!11969 m!234989))

(assert (=> bs!11969 m!234545))

(declare-fun m!234991 () Bool)

(assert (=> bs!11969 m!234991))

(assert (=> bs!11969 m!234511))

(declare-fun m!234993 () Bool)

(assert (=> bs!11969 m!234993))

(declare-fun m!234995 () Bool)

(assert (=> bs!11969 m!234995))

(assert (=> bs!11969 m!234525))

(assert (=> b!150441 d!48967))

(declare-fun b!150706 () Bool)

(declare-fun res!126344 () Bool)

(declare-fun e!100641 () Bool)

(assert (=> b!150706 (=> (not res!126344) (not e!100641))))

(declare-fun lt!235686 () (_ BitVec 64))

(declare-fun lt!235689 () (_ BitVec 64))

(declare-fun lt!235690 () tuple2!13452)

(assert (=> b!150706 (= res!126344 (= (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235690))) (currentByte!6447 (_2!7093 lt!235690)) (currentBit!6442 (_2!7093 lt!235690))) (bvadd lt!235689 lt!235686)))))

(assert (=> b!150706 (or (not (= (bvand lt!235689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235686 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!235689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!235689 lt!235686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!235688 () (_ BitVec 64))

(assert (=> b!150706 (= lt!235686 (bvmul lt!235688 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!150706 (or (= lt!235688 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235688 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235688)))))

(assert (=> b!150706 (= lt!235688 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!150706 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!150706 (= lt!235689 (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))))))

(declare-fun b!150707 () Bool)

(declare-fun e!100642 () Bool)

(declare-fun lt!235692 () (_ BitVec 64))

(assert (=> b!150707 (= e!100642 (validate_offset_bits!1 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235111)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235692))))

(declare-fun lt!235691 () tuple2!13458)

(declare-fun b!150708 () Bool)

(declare-fun e!100643 () Bool)

(assert (=> b!150708 (= e!100643 (arrayRangesEq!362 arr!237 (_2!7096 lt!235691) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150709 () Bool)

(assert (=> b!150709 (= e!100641 e!100643)))

(declare-fun res!126340 () Bool)

(assert (=> b!150709 (=> (not res!126340) (not e!100643))))

(declare-fun lt!235687 () tuple2!13456)

(assert (=> b!150709 (= res!126340 (and (= (size!3046 (_2!7096 lt!235691)) (size!3046 arr!237)) (= (_1!7096 lt!235691) (_2!7095 lt!235687))))))

(assert (=> b!150709 (= lt!235691 (readByteArrayLoopPure!0 (_1!7095 lt!235687) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235694 () Unit!9492)

(declare-fun lt!235693 () Unit!9492)

(assert (=> b!150709 (= lt!235694 lt!235693)))

(assert (=> b!150709 (validate_offset_bits!1 ((_ sign_extend 32) (size!3046 (buf!3527 (_2!7093 lt!235690)))) ((_ sign_extend 32) (currentByte!6447 (_2!7093 lt!235111))) ((_ sign_extend 32) (currentBit!6442 (_2!7093 lt!235111))) lt!235692)))

(assert (=> b!150709 (= lt!235693 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7093 lt!235111) (buf!3527 (_2!7093 lt!235690)) lt!235692))))

(assert (=> b!150709 e!100642))

(declare-fun res!126343 () Bool)

(assert (=> b!150709 (=> (not res!126343) (not e!100642))))

(assert (=> b!150709 (= res!126343 (and (= (size!3046 (buf!3527 (_2!7093 lt!235111))) (size!3046 (buf!3527 (_2!7093 lt!235690)))) (bvsge lt!235692 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150709 (= lt!235692 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!150709 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!150709 (= lt!235687 (reader!0 (_2!7093 lt!235111) (_2!7093 lt!235690)))))

(declare-fun d!48969 () Bool)

(assert (=> d!48969 e!100641))

(declare-fun res!126341 () Bool)

(assert (=> d!48969 (=> (not res!126341) (not e!100641))))

(assert (=> d!48969 (= res!126341 (= (size!3046 (buf!3527 (_2!7093 lt!235111))) (size!3046 (buf!3527 (_2!7093 lt!235690)))))))

(declare-fun choose!64 (BitStream!5350 array!6731 (_ BitVec 32) (_ BitVec 32)) tuple2!13452)

(assert (=> d!48969 (= lt!235690 (choose!64 (_2!7093 lt!235111) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48969 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3046 arr!237)))))

(assert (=> d!48969 (= (appendByteArrayLoop!0 (_2!7093 lt!235111) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!235690)))

(declare-fun b!150710 () Bool)

(declare-fun res!126342 () Bool)

(assert (=> b!150710 (=> (not res!126342) (not e!100641))))

(assert (=> b!150710 (= res!126342 (isPrefixOf!0 (_2!7093 lt!235111) (_2!7093 lt!235690)))))

(assert (= (and d!48969 res!126341) b!150706))

(assert (= (and b!150706 res!126344) b!150710))

(assert (= (and b!150710 res!126342) b!150709))

(assert (= (and b!150709 res!126343) b!150707))

(assert (= (and b!150709 res!126340) b!150708))

(declare-fun m!235099 () Bool)

(assert (=> d!48969 m!235099))

(declare-fun m!235101 () Bool)

(assert (=> b!150708 m!235101))

(declare-fun m!235105 () Bool)

(assert (=> b!150707 m!235105))

(declare-fun m!235107 () Bool)

(assert (=> b!150709 m!235107))

(declare-fun m!235109 () Bool)

(assert (=> b!150709 m!235109))

(declare-fun m!235113 () Bool)

(assert (=> b!150709 m!235113))

(declare-fun m!235115 () Bool)

(assert (=> b!150709 m!235115))

(declare-fun m!235117 () Bool)

(assert (=> b!150706 m!235117))

(assert (=> b!150706 m!234503))

(declare-fun m!235119 () Bool)

(assert (=> b!150710 m!235119))

(assert (=> b!150441 d!48969))

(declare-fun d!49007 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5350 (_ BitVec 32)) tuple2!13452)

(assert (=> d!49007 (= (withMovedByteIndex!0 (_1!7095 lt!235115) #b00000000000000000000000000000001) (_2!7093 (moveByteIndex!0 (_1!7095 lt!235115) #b00000000000000000000000000000001)))))

(declare-fun bs!11980 () Bool)

(assert (= bs!11980 d!49007))

(declare-fun m!235129 () Bool)

(assert (=> bs!11980 m!235129))

(assert (=> b!150441 d!49007))

(assert (=> b!150443 d!48890))

(declare-fun d!49009 () Bool)

(declare-fun e!100646 () Bool)

(assert (=> d!49009 e!100646))

(declare-fun res!126349 () Bool)

(assert (=> d!49009 (=> (not res!126349) (not e!100646))))

(declare-fun lt!235725 () (_ BitVec 64))

(declare-fun lt!235723 () (_ BitVec 64))

(declare-fun lt!235721 () (_ BitVec 64))

(assert (=> d!49009 (= res!126349 (= lt!235721 (bvsub lt!235723 lt!235725)))))

(assert (=> d!49009 (or (= (bvand lt!235723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235723 lt!235725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49009 (= lt!235725 (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634))))))

(declare-fun lt!235724 () (_ BitVec 64))

(declare-fun lt!235722 () (_ BitVec 64))

(assert (=> d!49009 (= lt!235723 (bvmul lt!235724 lt!235722))))

(assert (=> d!49009 (or (= lt!235724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235722 (bvsdiv (bvmul lt!235724 lt!235722) lt!235724)))))

(assert (=> d!49009 (= lt!235722 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49009 (= lt!235724 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))))))

(assert (=> d!49009 (= lt!235721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6447 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6442 thiss!1634))))))

(assert (=> d!49009 (invariant!0 (currentBit!6442 thiss!1634) (currentByte!6447 thiss!1634) (size!3046 (buf!3527 thiss!1634)))))

(assert (=> d!49009 (= (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)) lt!235721)))

(declare-fun b!150716 () Bool)

(declare-fun res!126348 () Bool)

(assert (=> b!150716 (=> (not res!126348) (not e!100646))))

(assert (=> b!150716 (= res!126348 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235721))))

(declare-fun b!150717 () Bool)

(declare-fun lt!235720 () (_ BitVec 64))

(assert (=> b!150717 (= e!100646 (bvsle lt!235721 (bvmul lt!235720 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150717 (or (= lt!235720 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235720 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235720)))))

(assert (=> b!150717 (= lt!235720 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))))))

(assert (= (and d!49009 res!126349) b!150716))

(assert (= (and b!150716 res!126348) b!150717))

(assert (=> d!49009 m!234825))

(assert (=> d!49009 m!234561))

(assert (=> b!150443 d!49009))

(assert (=> b!150432 d!48880))

(assert (=> b!150432 d!49009))

(declare-fun d!49013 () Bool)

(assert (=> d!49013 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634)) lt!235112) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3046 (buf!3527 thiss!1634))) ((_ sign_extend 32) (currentByte!6447 thiss!1634)) ((_ sign_extend 32) (currentBit!6442 thiss!1634))) lt!235112))))

(declare-fun bs!11982 () Bool)

(assert (= bs!11982 d!49013))

(assert (=> bs!11982 m!234825))

(assert (=> b!150442 d!49013))

(declare-fun d!49017 () Bool)

(declare-fun res!126352 () Bool)

(declare-fun e!100647 () Bool)

(assert (=> d!49017 (=> (not res!126352) (not e!100647))))

(assert (=> d!49017 (= res!126352 (= (size!3046 (buf!3527 (_2!7093 lt!235111))) (size!3046 (buf!3527 (_2!7093 lt!235103)))))))

(assert (=> d!49017 (= (isPrefixOf!0 (_2!7093 lt!235111) (_2!7093 lt!235103)) e!100647)))

(declare-fun b!150718 () Bool)

(declare-fun res!126350 () Bool)

(assert (=> b!150718 (=> (not res!126350) (not e!100647))))

(assert (=> b!150718 (= res!126350 (bvsle (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111))) (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235103))) (currentByte!6447 (_2!7093 lt!235103)) (currentBit!6442 (_2!7093 lt!235103)))))))

(declare-fun b!150719 () Bool)

(declare-fun e!100648 () Bool)

(assert (=> b!150719 (= e!100647 e!100648)))

(declare-fun res!126351 () Bool)

(assert (=> b!150719 (=> res!126351 e!100648)))

(assert (=> b!150719 (= res!126351 (= (size!3046 (buf!3527 (_2!7093 lt!235111))) #b00000000000000000000000000000000))))

(declare-fun b!150720 () Bool)

(assert (=> b!150720 (= e!100648 (arrayBitRangesEq!0 (buf!3527 (_2!7093 lt!235111)) (buf!3527 (_2!7093 lt!235103)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111)))))))

(assert (= (and d!49017 res!126352) b!150718))

(assert (= (and b!150718 res!126350) b!150719))

(assert (= (and b!150719 (not res!126351)) b!150720))

(assert (=> b!150718 m!234503))

(assert (=> b!150718 m!234493))

(assert (=> b!150720 m!234503))

(assert (=> b!150720 m!234503))

(declare-fun m!235149 () Bool)

(assert (=> b!150720 m!235149))

(assert (=> b!150444 d!49017))

(declare-fun d!49023 () Bool)

(assert (=> d!49023 (= (array_inv!2835 arr!237) (bvsge (size!3046 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28938 d!49023))

(declare-fun d!49025 () Bool)

(assert (=> d!49025 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6442 thiss!1634) (currentByte!6447 thiss!1634) (size!3046 (buf!3527 thiss!1634))))))

(declare-fun bs!11988 () Bool)

(assert (= bs!11988 d!49025))

(assert (=> bs!11988 m!234561))

(assert (=> start!28938 d!49025))

(declare-fun d!49033 () Bool)

(declare-fun res!126355 () Bool)

(declare-fun e!100649 () Bool)

(assert (=> d!49033 (=> (not res!126355) (not e!100649))))

(assert (=> d!49033 (= res!126355 (= (size!3046 (buf!3527 thiss!1634)) (size!3046 (buf!3527 (_2!7093 lt!235111)))))))

(assert (=> d!49033 (= (isPrefixOf!0 thiss!1634 (_2!7093 lt!235111)) e!100649)))

(declare-fun b!150721 () Bool)

(declare-fun res!126353 () Bool)

(assert (=> b!150721 (=> (not res!126353) (not e!100649))))

(assert (=> b!150721 (= res!126353 (bvsle (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634)) (bitIndex!0 (size!3046 (buf!3527 (_2!7093 lt!235111))) (currentByte!6447 (_2!7093 lt!235111)) (currentBit!6442 (_2!7093 lt!235111)))))))

(declare-fun b!150722 () Bool)

(declare-fun e!100650 () Bool)

(assert (=> b!150722 (= e!100649 e!100650)))

(declare-fun res!126354 () Bool)

(assert (=> b!150722 (=> res!126354 e!100650)))

(assert (=> b!150722 (= res!126354 (= (size!3046 (buf!3527 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!150723 () Bool)

(assert (=> b!150723 (= e!100650 (arrayBitRangesEq!0 (buf!3527 thiss!1634) (buf!3527 (_2!7093 lt!235111)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3046 (buf!3527 thiss!1634)) (currentByte!6447 thiss!1634) (currentBit!6442 thiss!1634))))))

(assert (= (and d!49033 res!126355) b!150721))

(assert (= (and b!150721 res!126353) b!150722))

(assert (= (and b!150722 (not res!126354)) b!150723))

(assert (=> b!150721 m!234495))

(assert (=> b!150721 m!234503))

(assert (=> b!150723 m!234495))

(assert (=> b!150723 m!234495))

(declare-fun m!235157 () Bool)

(assert (=> b!150723 m!235157))

(assert (=> b!150433 d!49033))

(push 1)

(assert (not d!48862))

(assert (not b!150583))

(assert (not b!150630))

(assert (not b!150635))

(assert (not b!150581))

(assert (not b!150580))

(assert (not b!150709))

(assert (not b!150708))

(assert (not d!48908))

(assert (not b!150707))

(assert (not d!49007))

(assert (not d!48951))

(assert (not d!48916))

(assert (not b!150658))

(assert (not d!48894))

(assert (not b!150637))

(assert (not d!48866))

(assert (not d!48874))

(assert (not d!48868))

(assert (not d!48858))

(assert (not b!150628))

(assert (not b!150659))

(assert (not d!48969))

(assert (not b!150723))

(assert (not b!150629))

(assert (not d!48953))

(assert (not d!48920))

(assert (not b!150570))

(assert (not b!150587))

(assert (not d!49013))

(assert (not d!48967))

(assert (not b!150720))

(assert (not d!48949))

(assert (not d!48910))

(assert (not d!48922))

(assert (not d!48943))

(assert (not b!150610))

(assert (not b!150585))

(assert (not d!48914))

(assert (not d!48912))

(assert (not d!48959))

(assert (not d!48856))

(assert (not b!150721))

(assert (not d!48957))

(assert (not d!48878))

(assert (not b!150710))

(assert (not b!150633))

(assert (not d!48937))

(assert (not b!150718))

(assert (not b!150612))

(assert (not b!150569))

(assert (not d!49025))

(assert (not b!150572))

(assert (not d!48880))

(assert (not b!150631))

(assert (not d!48955))

(assert (not b!150706))

(assert (not d!48860))

(assert (not b!150657))

(assert (not d!48900))

(assert (not d!48870))

(assert (not d!49009))

(assert (not d!48890))

(assert (not b!150579))

(assert (not b!150578))

(assert (not d!48918))

(assert (not b!150568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

