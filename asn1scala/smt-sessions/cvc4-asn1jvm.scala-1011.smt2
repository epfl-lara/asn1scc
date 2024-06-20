; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28774 () Bool)

(assert start!28774)

(declare-fun b!149348 () Bool)

(declare-fun res!125092 () Bool)

(declare-fun e!99701 () Bool)

(assert (=> b!149348 (=> (not res!125092) (not e!99701))))

(declare-datatypes ((array!6696 0))(
  ( (array!6697 (arr!3814 (Array (_ BitVec 32) (_ BitVec 8))) (size!3030 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5318 0))(
  ( (BitStream!5319 (buf!3505 array!6696) (currentByte!6419 (_ BitVec 32)) (currentBit!6414 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9451 0))(
  ( (Unit!9452) )
))
(declare-datatypes ((tuple2!13318 0))(
  ( (tuple2!13319 (_1!7023 Unit!9451) (_2!7023 BitStream!5318)) )
))
(declare-fun lt!233004 () tuple2!13318)

(declare-fun thiss!1634 () BitStream!5318)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149348 (= res!125092 (= (bitIndex!0 (size!3030 (buf!3505 (_2!7023 lt!233004))) (currentByte!6419 (_2!7023 lt!233004)) (currentBit!6414 (_2!7023 lt!233004))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3030 (buf!3505 thiss!1634)) (currentByte!6419 thiss!1634) (currentBit!6414 thiss!1634)))))))

(declare-fun b!149349 () Bool)

(declare-fun e!99699 () Bool)

(declare-fun e!99698 () Bool)

(assert (=> b!149349 (= e!99699 (not e!99698))))

(declare-fun res!125089 () Bool)

(assert (=> b!149349 (=> res!125089 e!99698)))

(declare-datatypes ((tuple2!13320 0))(
  ( (tuple2!13321 (_1!7024 BitStream!5318) (_2!7024 array!6696)) )
))
(declare-fun lt!233000 () tuple2!13320)

(declare-datatypes ((tuple2!13322 0))(
  ( (tuple2!13323 (_1!7025 BitStream!5318) (_2!7025 BitStream!5318)) )
))
(declare-fun lt!233016 () tuple2!13322)

(declare-fun arr!237 () array!6696)

(assert (=> b!149349 (= res!125089 (or (not (= (size!3030 (_2!7024 lt!233000)) (size!3030 arr!237))) (not (= (_1!7024 lt!233000) (_2!7025 lt!233016)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5318 array!6696 (_ BitVec 32) (_ BitVec 32)) tuple2!13320)

(assert (=> b!149349 (= lt!233000 (readByteArrayLoopPure!0 (_1!7025 lt!233016) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232990 () tuple2!13318)

(declare-fun lt!232989 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149349 (validate_offset_bits!1 ((_ sign_extend 32) (size!3030 (buf!3505 (_2!7023 lt!232990)))) ((_ sign_extend 32) (currentByte!6419 (_2!7023 lt!233004))) ((_ sign_extend 32) (currentBit!6414 (_2!7023 lt!233004))) lt!232989)))

(declare-fun lt!232997 () Unit!9451)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5318 array!6696 (_ BitVec 64)) Unit!9451)

(assert (=> b!149349 (= lt!232997 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7023 lt!233004) (buf!3505 (_2!7023 lt!232990)) lt!232989))))

(declare-fun reader!0 (BitStream!5318 BitStream!5318) tuple2!13322)

(assert (=> b!149349 (= lt!233016 (reader!0 (_2!7023 lt!233004) (_2!7023 lt!232990)))))

(declare-fun res!125093 () Bool)

(declare-fun e!99705 () Bool)

(assert (=> start!28774 (=> (not res!125093) (not e!99705))))

(assert (=> start!28774 (= res!125093 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3030 arr!237))))))

(assert (=> start!28774 e!99705))

(assert (=> start!28774 true))

(declare-fun array_inv!2819 (array!6696) Bool)

(assert (=> start!28774 (array_inv!2819 arr!237)))

(declare-fun e!99702 () Bool)

(declare-fun inv!12 (BitStream!5318) Bool)

(assert (=> start!28774 (and (inv!12 thiss!1634) e!99702)))

(declare-fun b!149350 () Bool)

(declare-fun res!125095 () Bool)

(assert (=> b!149350 (=> (not res!125095) (not e!99705))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149350 (= res!125095 (invariant!0 (currentBit!6414 thiss!1634) (currentByte!6419 thiss!1634) (size!3030 (buf!3505 thiss!1634))))))

(declare-fun b!149351 () Bool)

(declare-fun e!99704 () Bool)

(assert (=> b!149351 (= e!99704 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(declare-fun lt!233010 () (_ BitVec 64))

(assert (=> b!149351 (= lt!233010 (bitIndex!0 (size!3030 (buf!3505 thiss!1634)) (currentByte!6419 thiss!1634) (currentBit!6414 thiss!1634)))))

(declare-fun b!149352 () Bool)

(declare-fun e!99706 () Bool)

(assert (=> b!149352 (= e!99705 (not e!99706))))

(declare-fun res!125087 () Bool)

(assert (=> b!149352 (=> res!125087 e!99706)))

(declare-fun lt!233008 () tuple2!13320)

(declare-fun lt!232999 () tuple2!13320)

(declare-fun arrayRangesEq!346 (array!6696 array!6696 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149352 (= res!125087 (not (arrayRangesEq!346 (_2!7024 lt!232999) (_2!7024 lt!233008) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232994 () tuple2!13320)

(assert (=> b!149352 (arrayRangesEq!346 (_2!7024 lt!232999) (_2!7024 lt!232994) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233001 () Unit!9451)

(declare-fun lt!232993 () tuple2!13322)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5318 array!6696 (_ BitVec 32) (_ BitVec 32)) Unit!9451)

(assert (=> b!149352 (= lt!233001 (readByteArrayLoopArrayPrefixLemma!0 (_1!7025 lt!232993) arr!237 from!447 to!404))))

(declare-fun lt!233013 () array!6696)

(declare-fun withMovedByteIndex!0 (BitStream!5318 (_ BitVec 32)) BitStream!5318)

(assert (=> b!149352 (= lt!232994 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7025 lt!232993) #b00000000000000000000000000000001) lt!233013 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232996 () tuple2!13322)

(assert (=> b!149352 (= lt!233008 (readByteArrayLoopPure!0 (_1!7025 lt!232996) lt!233013 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13324 0))(
  ( (tuple2!13325 (_1!7026 BitStream!5318) (_2!7026 (_ BitVec 8))) )
))
(declare-fun lt!233007 () tuple2!13324)

(assert (=> b!149352 (= lt!233013 (array!6697 (store (arr!3814 arr!237) from!447 (_2!7026 lt!233007)) (size!3030 arr!237)))))

(declare-fun lt!232998 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149352 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3030 (buf!3505 (_2!7023 lt!232990)))) ((_ sign_extend 32) (currentByte!6419 (_2!7023 lt!233004))) ((_ sign_extend 32) (currentBit!6414 (_2!7023 lt!233004))) lt!232998)))

(declare-fun lt!233003 () Unit!9451)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5318 array!6696 (_ BitVec 32)) Unit!9451)

(assert (=> b!149352 (= lt!233003 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7023 lt!233004) (buf!3505 (_2!7023 lt!232990)) lt!232998))))

(assert (=> b!149352 (= (_1!7024 lt!232999) (_2!7025 lt!232993))))

(assert (=> b!149352 (= lt!232999 (readByteArrayLoopPure!0 (_1!7025 lt!232993) arr!237 from!447 to!404))))

(assert (=> b!149352 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3030 (buf!3505 (_2!7023 lt!232990)))) ((_ sign_extend 32) (currentByte!6419 thiss!1634)) ((_ sign_extend 32) (currentBit!6414 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233009 () Unit!9451)

(assert (=> b!149352 (= lt!233009 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3505 (_2!7023 lt!232990)) (bvsub to!404 from!447)))))

(assert (=> b!149352 (= (_2!7026 lt!233007) (select (arr!3814 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5318) tuple2!13324)

(assert (=> b!149352 (= lt!233007 (readBytePure!0 (_1!7025 lt!232993)))))

(assert (=> b!149352 (= lt!232996 (reader!0 (_2!7023 lt!233004) (_2!7023 lt!232990)))))

(assert (=> b!149352 (= lt!232993 (reader!0 thiss!1634 (_2!7023 lt!232990)))))

(declare-fun e!99696 () Bool)

(assert (=> b!149352 e!99696))

(declare-fun res!125090 () Bool)

(assert (=> b!149352 (=> (not res!125090) (not e!99696))))

(declare-fun lt!233014 () tuple2!13324)

(declare-fun lt!233005 () tuple2!13324)

(assert (=> b!149352 (= res!125090 (= (bitIndex!0 (size!3030 (buf!3505 (_1!7026 lt!233014))) (currentByte!6419 (_1!7026 lt!233014)) (currentBit!6414 (_1!7026 lt!233014))) (bitIndex!0 (size!3030 (buf!3505 (_1!7026 lt!233005))) (currentByte!6419 (_1!7026 lt!233005)) (currentBit!6414 (_1!7026 lt!233005)))))))

(declare-fun lt!232995 () Unit!9451)

(declare-fun lt!233002 () BitStream!5318)

(declare-fun readBytePrefixLemma!0 (BitStream!5318 BitStream!5318) Unit!9451)

(assert (=> b!149352 (= lt!232995 (readBytePrefixLemma!0 lt!233002 (_2!7023 lt!232990)))))

(assert (=> b!149352 (= lt!233005 (readBytePure!0 (BitStream!5319 (buf!3505 (_2!7023 lt!232990)) (currentByte!6419 thiss!1634) (currentBit!6414 thiss!1634))))))

(assert (=> b!149352 (= lt!233014 (readBytePure!0 lt!233002))))

(assert (=> b!149352 (= lt!233002 (BitStream!5319 (buf!3505 (_2!7023 lt!233004)) (currentByte!6419 thiss!1634) (currentBit!6414 thiss!1634)))))

(declare-fun e!99703 () Bool)

(assert (=> b!149352 e!99703))

(declare-fun res!125099 () Bool)

(assert (=> b!149352 (=> (not res!125099) (not e!99703))))

(declare-fun isPrefixOf!0 (BitStream!5318 BitStream!5318) Bool)

(assert (=> b!149352 (= res!125099 (isPrefixOf!0 thiss!1634 (_2!7023 lt!232990)))))

(declare-fun lt!233006 () Unit!9451)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5318 BitStream!5318 BitStream!5318) Unit!9451)

(assert (=> b!149352 (= lt!233006 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7023 lt!233004) (_2!7023 lt!232990)))))

(declare-fun e!99700 () Bool)

(assert (=> b!149352 e!99700))

(declare-fun res!125097 () Bool)

(assert (=> b!149352 (=> (not res!125097) (not e!99700))))

(assert (=> b!149352 (= res!125097 (= (size!3030 (buf!3505 (_2!7023 lt!233004))) (size!3030 (buf!3505 (_2!7023 lt!232990)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5318 array!6696 (_ BitVec 32) (_ BitVec 32)) tuple2!13318)

(assert (=> b!149352 (= lt!232990 (appendByteArrayLoop!0 (_2!7023 lt!233004) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149352 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3030 (buf!3505 (_2!7023 lt!233004)))) ((_ sign_extend 32) (currentByte!6419 (_2!7023 lt!233004))) ((_ sign_extend 32) (currentBit!6414 (_2!7023 lt!233004))) lt!232998)))

(assert (=> b!149352 (= lt!232998 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232991 () Unit!9451)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5318 BitStream!5318 (_ BitVec 64) (_ BitVec 32)) Unit!9451)

(assert (=> b!149352 (= lt!232991 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7023 lt!233004) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149352 e!99701))

(declare-fun res!125085 () Bool)

(assert (=> b!149352 (=> (not res!125085) (not e!99701))))

(assert (=> b!149352 (= res!125085 (= (size!3030 (buf!3505 thiss!1634)) (size!3030 (buf!3505 (_2!7023 lt!233004)))))))

(declare-fun appendByte!0 (BitStream!5318 (_ BitVec 8)) tuple2!13318)

(assert (=> b!149352 (= lt!233004 (appendByte!0 thiss!1634 (select (arr!3814 arr!237) from!447)))))

(declare-fun b!149353 () Bool)

(assert (=> b!149353 (= e!99696 (= (_2!7026 lt!233014) (_2!7026 lt!233005)))))

(declare-fun b!149354 () Bool)

(assert (=> b!149354 (= e!99698 (not (arrayRangesEq!346 arr!237 (_2!7024 lt!233000) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149355 () Bool)

(declare-fun res!125088 () Bool)

(assert (=> b!149355 (=> (not res!125088) (not e!99705))))

(assert (=> b!149355 (= res!125088 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3030 (buf!3505 thiss!1634))) ((_ sign_extend 32) (currentByte!6419 thiss!1634)) ((_ sign_extend 32) (currentBit!6414 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149356 () Bool)

(assert (=> b!149356 (= e!99706 e!99704)))

(declare-fun res!125096 () Bool)

(assert (=> b!149356 (=> res!125096 e!99704)))

(assert (=> b!149356 (= res!125096 (not (= (size!3030 (buf!3505 thiss!1634)) (size!3030 (buf!3505 (_2!7023 lt!232990))))))))

(assert (=> b!149356 (arrayRangesEq!346 arr!237 (_2!7024 lt!232999) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233015 () Unit!9451)

(declare-fun arrayRangesEqTransitive!61 (array!6696 array!6696 array!6696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9451)

(assert (=> b!149356 (= lt!233015 (arrayRangesEqTransitive!61 arr!237 (_2!7024 lt!233008) (_2!7024 lt!232999) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149356 (arrayRangesEq!346 (_2!7024 lt!233008) (_2!7024 lt!232999) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232992 () Unit!9451)

(declare-fun arrayRangesEqSymmetricLemma!78 (array!6696 array!6696 (_ BitVec 32) (_ BitVec 32)) Unit!9451)

(assert (=> b!149356 (= lt!232992 (arrayRangesEqSymmetricLemma!78 (_2!7024 lt!232999) (_2!7024 lt!233008) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149357 () Bool)

(assert (=> b!149357 (= e!99703 (invariant!0 (currentBit!6414 thiss!1634) (currentByte!6419 thiss!1634) (size!3030 (buf!3505 (_2!7023 lt!233004)))))))

(declare-fun b!149358 () Bool)

(assert (=> b!149358 (= e!99700 e!99699)))

(declare-fun res!125086 () Bool)

(assert (=> b!149358 (=> (not res!125086) (not e!99699))))

(assert (=> b!149358 (= res!125086 (= (bitIndex!0 (size!3030 (buf!3505 (_2!7023 lt!232990))) (currentByte!6419 (_2!7023 lt!232990)) (currentBit!6414 (_2!7023 lt!232990))) (bvadd (bitIndex!0 (size!3030 (buf!3505 (_2!7023 lt!233004))) (currentByte!6419 (_2!7023 lt!233004)) (currentBit!6414 (_2!7023 lt!233004))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232989))))))

(assert (=> b!149358 (= lt!232989 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149359 () Bool)

(declare-fun res!125094 () Bool)

(assert (=> b!149359 (=> (not res!125094) (not e!99705))))

(assert (=> b!149359 (= res!125094 (bvslt from!447 to!404))))

(declare-fun b!149360 () Bool)

(assert (=> b!149360 (= e!99702 (array_inv!2819 (buf!3505 thiss!1634)))))

(declare-fun b!149361 () Bool)

(declare-fun res!125091 () Bool)

(assert (=> b!149361 (=> (not res!125091) (not e!99701))))

(assert (=> b!149361 (= res!125091 (isPrefixOf!0 thiss!1634 (_2!7023 lt!233004)))))

(declare-fun b!149362 () Bool)

(declare-fun lt!233011 () tuple2!13322)

(declare-fun lt!233012 () tuple2!13324)

(assert (=> b!149362 (= e!99701 (and (= (_2!7026 lt!233012) (select (arr!3814 arr!237) from!447)) (= (_1!7026 lt!233012) (_2!7025 lt!233011))))))

(assert (=> b!149362 (= lt!233012 (readBytePure!0 (_1!7025 lt!233011)))))

(assert (=> b!149362 (= lt!233011 (reader!0 thiss!1634 (_2!7023 lt!233004)))))

(declare-fun b!149363 () Bool)

(declare-fun res!125098 () Bool)

(assert (=> b!149363 (=> (not res!125098) (not e!99699))))

(assert (=> b!149363 (= res!125098 (isPrefixOf!0 (_2!7023 lt!233004) (_2!7023 lt!232990)))))

(assert (= (and start!28774 res!125093) b!149355))

(assert (= (and b!149355 res!125088) b!149359))

(assert (= (and b!149359 res!125094) b!149350))

(assert (= (and b!149350 res!125095) b!149352))

(assert (= (and b!149352 res!125085) b!149348))

(assert (= (and b!149348 res!125092) b!149361))

(assert (= (and b!149361 res!125091) b!149362))

(assert (= (and b!149352 res!125097) b!149358))

(assert (= (and b!149358 res!125086) b!149363))

(assert (= (and b!149363 res!125098) b!149349))

(assert (= (and b!149349 (not res!125089)) b!149354))

(assert (= (and b!149352 res!125099) b!149357))

(assert (= (and b!149352 res!125090) b!149353))

(assert (= (and b!149352 (not res!125087)) b!149356))

(assert (= (and b!149356 (not res!125096)) b!149351))

(assert (= start!28774 b!149360))

(declare-fun m!232335 () Bool)

(assert (=> b!149354 m!232335))

(declare-fun m!232337 () Bool)

(assert (=> b!149350 m!232337))

(declare-fun m!232339 () Bool)

(assert (=> b!149351 m!232339))

(declare-fun m!232341 () Bool)

(assert (=> b!149363 m!232341))

(declare-fun m!232343 () Bool)

(assert (=> b!149362 m!232343))

(declare-fun m!232345 () Bool)

(assert (=> b!149362 m!232345))

(declare-fun m!232347 () Bool)

(assert (=> b!149362 m!232347))

(declare-fun m!232349 () Bool)

(assert (=> b!149358 m!232349))

(declare-fun m!232351 () Bool)

(assert (=> b!149358 m!232351))

(declare-fun m!232353 () Bool)

(assert (=> b!149352 m!232353))

(declare-fun m!232355 () Bool)

(assert (=> b!149352 m!232355))

(declare-fun m!232357 () Bool)

(assert (=> b!149352 m!232357))

(declare-fun m!232359 () Bool)

(assert (=> b!149352 m!232359))

(declare-fun m!232361 () Bool)

(assert (=> b!149352 m!232361))

(declare-fun m!232363 () Bool)

(assert (=> b!149352 m!232363))

(declare-fun m!232365 () Bool)

(assert (=> b!149352 m!232365))

(declare-fun m!232367 () Bool)

(assert (=> b!149352 m!232367))

(declare-fun m!232369 () Bool)

(assert (=> b!149352 m!232369))

(declare-fun m!232371 () Bool)

(assert (=> b!149352 m!232371))

(assert (=> b!149352 m!232365))

(declare-fun m!232373 () Bool)

(assert (=> b!149352 m!232373))

(declare-fun m!232375 () Bool)

(assert (=> b!149352 m!232375))

(declare-fun m!232377 () Bool)

(assert (=> b!149352 m!232377))

(declare-fun m!232379 () Bool)

(assert (=> b!149352 m!232379))

(assert (=> b!149352 m!232343))

(declare-fun m!232381 () Bool)

(assert (=> b!149352 m!232381))

(assert (=> b!149352 m!232343))

(declare-fun m!232383 () Bool)

(assert (=> b!149352 m!232383))

(declare-fun m!232385 () Bool)

(assert (=> b!149352 m!232385))

(declare-fun m!232387 () Bool)

(assert (=> b!149352 m!232387))

(declare-fun m!232389 () Bool)

(assert (=> b!149352 m!232389))

(declare-fun m!232391 () Bool)

(assert (=> b!149352 m!232391))

(declare-fun m!232393 () Bool)

(assert (=> b!149352 m!232393))

(declare-fun m!232395 () Bool)

(assert (=> b!149352 m!232395))

(declare-fun m!232397 () Bool)

(assert (=> b!149352 m!232397))

(declare-fun m!232399 () Bool)

(assert (=> b!149352 m!232399))

(declare-fun m!232401 () Bool)

(assert (=> b!149352 m!232401))

(declare-fun m!232403 () Bool)

(assert (=> b!149352 m!232403))

(assert (=> b!149348 m!232351))

(assert (=> b!149348 m!232339))

(declare-fun m!232405 () Bool)

(assert (=> b!149361 m!232405))

(declare-fun m!232407 () Bool)

(assert (=> start!28774 m!232407))

(declare-fun m!232409 () Bool)

(assert (=> start!28774 m!232409))

(declare-fun m!232411 () Bool)

(assert (=> b!149357 m!232411))

(declare-fun m!232413 () Bool)

(assert (=> b!149360 m!232413))

(declare-fun m!232415 () Bool)

(assert (=> b!149355 m!232415))

(declare-fun m!232417 () Bool)

(assert (=> b!149356 m!232417))

(declare-fun m!232419 () Bool)

(assert (=> b!149356 m!232419))

(declare-fun m!232421 () Bool)

(assert (=> b!149356 m!232421))

(declare-fun m!232423 () Bool)

(assert (=> b!149356 m!232423))

(declare-fun m!232425 () Bool)

(assert (=> b!149349 m!232425))

(declare-fun m!232427 () Bool)

(assert (=> b!149349 m!232427))

(declare-fun m!232429 () Bool)

(assert (=> b!149349 m!232429))

(assert (=> b!149349 m!232355))

(push 1)

(assert (not b!149358))

(assert (not b!149350))

(assert (not b!149351))

(assert (not b!149349))

(assert (not b!149357))

(assert (not start!28774))

(assert (not b!149363))

(assert (not b!149354))

(assert (not b!149348))

(assert (not b!149362))

(assert (not b!149356))

(assert (not b!149355))

(assert (not b!149361))

(assert (not b!149352))

(assert (not b!149360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

