; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26878 () Bool)

(assert start!26878)

(declare-fun b!138326 () Bool)

(declare-fun res!115284 () Bool)

(declare-fun e!91967 () Bool)

(assert (=> b!138326 (=> (not res!115284) (not e!91967))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6258 0))(
  ( (array!6259 (arr!3528 (Array (_ BitVec 32) (_ BitVec 8))) (size!2833 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4930 0))(
  ( (BitStream!4931 (buf!3246 array!6258) (currentByte!6059 (_ BitVec 32)) (currentBit!6054 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4930)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138326 (= res!115284 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2833 (buf!3246 thiss!1634))) ((_ sign_extend 32) (currentByte!6059 thiss!1634)) ((_ sign_extend 32) (currentBit!6054 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12080 0))(
  ( (tuple2!12081 (_1!6366 BitStream!4930) (_2!6366 array!6258)) )
))
(declare-fun lt!215925 () tuple2!12080)

(declare-fun arr!237 () array!6258)

(declare-fun e!91959 () Bool)

(declare-fun b!138327 () Bool)

(assert (=> b!138327 (= e!91959 (or (not (= (size!2833 (_2!6366 lt!215925)) (size!2833 arr!237))) (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-datatypes ((Unit!8622 0))(
  ( (Unit!8623) )
))
(declare-datatypes ((tuple2!12082 0))(
  ( (tuple2!12083 (_1!6367 Unit!8622) (_2!6367 BitStream!4930)) )
))
(declare-fun lt!215934 () tuple2!12082)

(declare-fun lt!215952 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138327 (validate_offset_bits!1 ((_ sign_extend 32) (size!2833 (buf!3246 (_2!6367 lt!215934)))) ((_ sign_extend 32) (currentByte!6059 thiss!1634)) ((_ sign_extend 32) (currentBit!6054 thiss!1634)) lt!215952)))

(declare-fun lt!215928 () Unit!8622)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4930 array!6258 (_ BitVec 64)) Unit!8622)

(assert (=> b!138327 (= lt!215928 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3246 (_2!6367 lt!215934)) lt!215952))))

(declare-fun b!138328 () Bool)

(declare-fun e!91965 () Bool)

(declare-datatypes ((tuple2!12084 0))(
  ( (tuple2!12085 (_1!6368 BitStream!4930) (_2!6368 (_ BitVec 8))) )
))
(declare-fun lt!215945 () tuple2!12084)

(declare-fun lt!215949 () tuple2!12084)

(assert (=> b!138328 (= e!91965 (= (_2!6368 lt!215945) (_2!6368 lt!215949)))))

(declare-fun b!138330 () Bool)

(declare-fun e!91971 () Bool)

(assert (=> b!138330 (= e!91971 e!91959)))

(declare-fun res!115272 () Bool)

(assert (=> b!138330 (=> res!115272 e!91959)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138330 (= res!115272 (not (= (bitIndex!0 (size!2833 (buf!3246 (_2!6367 lt!215934))) (currentByte!6059 (_2!6367 lt!215934)) (currentBit!6054 (_2!6367 lt!215934))) (bvadd (bitIndex!0 (size!2833 (buf!3246 thiss!1634)) (currentByte!6059 thiss!1634) (currentBit!6054 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!215952)))))))

(assert (=> b!138330 (= lt!215952 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun lt!215941 () tuple2!12080)

(declare-fun e!91963 () Bool)

(declare-fun b!138331 () Bool)

(declare-fun arrayRangesEq!236 (array!6258 array!6258 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138331 (= e!91963 (not (arrayRangesEq!236 arr!237 (_2!6366 lt!215941) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!138332 () Bool)

(declare-fun res!115278 () Bool)

(declare-fun e!91970 () Bool)

(assert (=> b!138332 (=> (not res!115278) (not e!91970))))

(declare-fun lt!215926 () tuple2!12082)

(declare-fun isPrefixOf!0 (BitStream!4930 BitStream!4930) Bool)

(assert (=> b!138332 (= res!115278 (isPrefixOf!0 (_2!6367 lt!215926) (_2!6367 lt!215934)))))

(declare-fun b!138333 () Bool)

(declare-fun e!91966 () Bool)

(declare-fun array_inv!2622 (array!6258) Bool)

(assert (=> b!138333 (= e!91966 (array_inv!2622 (buf!3246 thiss!1634)))))

(declare-fun b!138334 () Bool)

(declare-fun res!115275 () Bool)

(assert (=> b!138334 (=> (not res!115275) (not e!91967))))

(assert (=> b!138334 (= res!115275 (bvslt from!447 to!404))))

(declare-fun b!138335 () Bool)

(declare-fun res!115273 () Bool)

(declare-fun e!91969 () Bool)

(assert (=> b!138335 (=> (not res!115273) (not e!91969))))

(assert (=> b!138335 (= res!115273 (isPrefixOf!0 thiss!1634 (_2!6367 lt!215926)))))

(declare-fun b!138336 () Bool)

(declare-fun res!115287 () Bool)

(assert (=> b!138336 (=> (not res!115287) (not e!91969))))

(assert (=> b!138336 (= res!115287 (= (bitIndex!0 (size!2833 (buf!3246 (_2!6367 lt!215926))) (currentByte!6059 (_2!6367 lt!215926)) (currentBit!6054 (_2!6367 lt!215926))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2833 (buf!3246 thiss!1634)) (currentByte!6059 thiss!1634) (currentBit!6054 thiss!1634)))))))

(declare-fun b!138329 () Bool)

(declare-fun e!91961 () Bool)

(assert (=> b!138329 (= e!91967 (not e!91961))))

(declare-fun res!115283 () Bool)

(assert (=> b!138329 (=> res!115283 e!91961)))

(declare-fun lt!215932 () tuple2!12080)

(assert (=> b!138329 (= res!115283 (not (arrayRangesEq!236 (_2!6366 lt!215925) (_2!6366 lt!215932) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!215939 () tuple2!12080)

(assert (=> b!138329 (arrayRangesEq!236 (_2!6366 lt!215925) (_2!6366 lt!215939) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215951 () Unit!8622)

(declare-datatypes ((tuple2!12086 0))(
  ( (tuple2!12087 (_1!6369 BitStream!4930) (_2!6369 BitStream!4930)) )
))
(declare-fun lt!215942 () tuple2!12086)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4930 array!6258 (_ BitVec 32) (_ BitVec 32)) Unit!8622)

(assert (=> b!138329 (= lt!215951 (readByteArrayLoopArrayPrefixLemma!0 (_1!6369 lt!215942) arr!237 from!447 to!404))))

(declare-fun lt!215930 () array!6258)

(declare-fun readByteArrayLoopPure!0 (BitStream!4930 array!6258 (_ BitVec 32) (_ BitVec 32)) tuple2!12080)

(declare-fun withMovedByteIndex!0 (BitStream!4930 (_ BitVec 32)) BitStream!4930)

(assert (=> b!138329 (= lt!215939 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6369 lt!215942) #b00000000000000000000000000000001) lt!215930 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215927 () tuple2!12086)

(assert (=> b!138329 (= lt!215932 (readByteArrayLoopPure!0 (_1!6369 lt!215927) lt!215930 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215931 () tuple2!12084)

(assert (=> b!138329 (= lt!215930 (array!6259 (store (arr!3528 arr!237) from!447 (_2!6368 lt!215931)) (size!2833 arr!237)))))

(declare-fun lt!215944 () (_ BitVec 32))

(assert (=> b!138329 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2833 (buf!3246 (_2!6367 lt!215934)))) ((_ sign_extend 32) (currentByte!6059 (_2!6367 lt!215926))) ((_ sign_extend 32) (currentBit!6054 (_2!6367 lt!215926))) lt!215944)))

(declare-fun lt!215938 () Unit!8622)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4930 array!6258 (_ BitVec 32)) Unit!8622)

(assert (=> b!138329 (= lt!215938 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6367 lt!215926) (buf!3246 (_2!6367 lt!215934)) lt!215944))))

(assert (=> b!138329 (= (_1!6366 lt!215925) (_2!6369 lt!215942))))

(assert (=> b!138329 (= lt!215925 (readByteArrayLoopPure!0 (_1!6369 lt!215942) arr!237 from!447 to!404))))

(assert (=> b!138329 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2833 (buf!3246 (_2!6367 lt!215934)))) ((_ sign_extend 32) (currentByte!6059 thiss!1634)) ((_ sign_extend 32) (currentBit!6054 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!215943 () Unit!8622)

(assert (=> b!138329 (= lt!215943 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3246 (_2!6367 lt!215934)) (bvsub to!404 from!447)))))

(assert (=> b!138329 (= (_2!6368 lt!215931) (select (arr!3528 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4930) tuple2!12084)

(assert (=> b!138329 (= lt!215931 (readBytePure!0 (_1!6369 lt!215942)))))

(declare-fun reader!0 (BitStream!4930 BitStream!4930) tuple2!12086)

(assert (=> b!138329 (= lt!215927 (reader!0 (_2!6367 lt!215926) (_2!6367 lt!215934)))))

(assert (=> b!138329 (= lt!215942 (reader!0 thiss!1634 (_2!6367 lt!215934)))))

(assert (=> b!138329 e!91965))

(declare-fun res!115279 () Bool)

(assert (=> b!138329 (=> (not res!115279) (not e!91965))))

(assert (=> b!138329 (= res!115279 (= (bitIndex!0 (size!2833 (buf!3246 (_1!6368 lt!215945))) (currentByte!6059 (_1!6368 lt!215945)) (currentBit!6054 (_1!6368 lt!215945))) (bitIndex!0 (size!2833 (buf!3246 (_1!6368 lt!215949))) (currentByte!6059 (_1!6368 lt!215949)) (currentBit!6054 (_1!6368 lt!215949)))))))

(declare-fun lt!215937 () Unit!8622)

(declare-fun lt!215935 () BitStream!4930)

(declare-fun readBytePrefixLemma!0 (BitStream!4930 BitStream!4930) Unit!8622)

(assert (=> b!138329 (= lt!215937 (readBytePrefixLemma!0 lt!215935 (_2!6367 lt!215934)))))

(assert (=> b!138329 (= lt!215949 (readBytePure!0 (BitStream!4931 (buf!3246 (_2!6367 lt!215934)) (currentByte!6059 thiss!1634) (currentBit!6054 thiss!1634))))))

(assert (=> b!138329 (= lt!215945 (readBytePure!0 lt!215935))))

(assert (=> b!138329 (= lt!215935 (BitStream!4931 (buf!3246 (_2!6367 lt!215926)) (currentByte!6059 thiss!1634) (currentBit!6054 thiss!1634)))))

(declare-fun e!91960 () Bool)

(assert (=> b!138329 e!91960))

(declare-fun res!115274 () Bool)

(assert (=> b!138329 (=> (not res!115274) (not e!91960))))

(assert (=> b!138329 (= res!115274 (isPrefixOf!0 thiss!1634 (_2!6367 lt!215934)))))

(declare-fun lt!215947 () Unit!8622)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4930 BitStream!4930 BitStream!4930) Unit!8622)

(assert (=> b!138329 (= lt!215947 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6367 lt!215926) (_2!6367 lt!215934)))))

(declare-fun e!91968 () Bool)

(assert (=> b!138329 e!91968))

(declare-fun res!115285 () Bool)

(assert (=> b!138329 (=> (not res!115285) (not e!91968))))

(assert (=> b!138329 (= res!115285 (= (size!2833 (buf!3246 (_2!6367 lt!215926))) (size!2833 (buf!3246 (_2!6367 lt!215934)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4930 array!6258 (_ BitVec 32) (_ BitVec 32)) tuple2!12082)

(assert (=> b!138329 (= lt!215934 (appendByteArrayLoop!0 (_2!6367 lt!215926) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!138329 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2833 (buf!3246 (_2!6367 lt!215926)))) ((_ sign_extend 32) (currentByte!6059 (_2!6367 lt!215926))) ((_ sign_extend 32) (currentBit!6054 (_2!6367 lt!215926))) lt!215944)))

(assert (=> b!138329 (= lt!215944 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!215940 () Unit!8622)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4930 BitStream!4930 (_ BitVec 64) (_ BitVec 32)) Unit!8622)

(assert (=> b!138329 (= lt!215940 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6367 lt!215926) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!138329 e!91969))

(declare-fun res!115281 () Bool)

(assert (=> b!138329 (=> (not res!115281) (not e!91969))))

(assert (=> b!138329 (= res!115281 (= (size!2833 (buf!3246 thiss!1634)) (size!2833 (buf!3246 (_2!6367 lt!215926)))))))

(declare-fun appendByte!0 (BitStream!4930 (_ BitVec 8)) tuple2!12082)

(assert (=> b!138329 (= lt!215926 (appendByte!0 thiss!1634 (select (arr!3528 arr!237) from!447)))))

(declare-fun res!115280 () Bool)

(assert (=> start!26878 (=> (not res!115280) (not e!91967))))

(assert (=> start!26878 (= res!115280 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2833 arr!237))))))

(assert (=> start!26878 e!91967))

(assert (=> start!26878 true))

(assert (=> start!26878 (array_inv!2622 arr!237)))

(declare-fun inv!12 (BitStream!4930) Bool)

(assert (=> start!26878 (and (inv!12 thiss!1634) e!91966)))

(declare-fun b!138337 () Bool)

(assert (=> b!138337 (= e!91968 e!91970)))

(declare-fun res!115282 () Bool)

(assert (=> b!138337 (=> (not res!115282) (not e!91970))))

(declare-fun lt!215950 () (_ BitVec 64))

(assert (=> b!138337 (= res!115282 (= (bitIndex!0 (size!2833 (buf!3246 (_2!6367 lt!215934))) (currentByte!6059 (_2!6367 lt!215934)) (currentBit!6054 (_2!6367 lt!215934))) (bvadd (bitIndex!0 (size!2833 (buf!3246 (_2!6367 lt!215926))) (currentByte!6059 (_2!6367 lt!215926)) (currentBit!6054 (_2!6367 lt!215926))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!215950))))))

(assert (=> b!138337 (= lt!215950 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!138338 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138338 (= e!91960 (invariant!0 (currentBit!6054 thiss!1634) (currentByte!6059 thiss!1634) (size!2833 (buf!3246 (_2!6367 lt!215926)))))))

(declare-fun b!138339 () Bool)

(assert (=> b!138339 (= e!91961 e!91971)))

(declare-fun res!115286 () Bool)

(assert (=> b!138339 (=> res!115286 e!91971)))

(assert (=> b!138339 (= res!115286 (not (= (size!2833 (buf!3246 thiss!1634)) (size!2833 (buf!3246 (_2!6367 lt!215934))))))))

(assert (=> b!138339 (arrayRangesEq!236 arr!237 (_2!6366 lt!215925) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215946 () Unit!8622)

(declare-fun arrayRangesEqTransitive!38 (array!6258 array!6258 array!6258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8622)

(assert (=> b!138339 (= lt!215946 (arrayRangesEqTransitive!38 arr!237 (_2!6366 lt!215932) (_2!6366 lt!215925) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!138339 (arrayRangesEq!236 (_2!6366 lt!215932) (_2!6366 lt!215925) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215924 () Unit!8622)

(declare-fun arrayRangesEqSymmetricLemma!49 (array!6258 array!6258 (_ BitVec 32) (_ BitVec 32)) Unit!8622)

(assert (=> b!138339 (= lt!215924 (arrayRangesEqSymmetricLemma!49 (_2!6366 lt!215925) (_2!6366 lt!215932) #b00000000000000000000000000000000 to!404))))

(declare-fun lt!215936 () tuple2!12086)

(declare-fun lt!215933 () tuple2!12084)

(declare-fun b!138340 () Bool)

(assert (=> b!138340 (= e!91969 (and (= (_2!6368 lt!215933) (select (arr!3528 arr!237) from!447)) (= (_1!6368 lt!215933) (_2!6369 lt!215936))))))

(assert (=> b!138340 (= lt!215933 (readBytePure!0 (_1!6369 lt!215936)))))

(assert (=> b!138340 (= lt!215936 (reader!0 thiss!1634 (_2!6367 lt!215926)))))

(declare-fun b!138341 () Bool)

(assert (=> b!138341 (= e!91970 (not e!91963))))

(declare-fun res!115276 () Bool)

(assert (=> b!138341 (=> res!115276 e!91963)))

(declare-fun lt!215948 () tuple2!12086)

(assert (=> b!138341 (= res!115276 (or (not (= (size!2833 (_2!6366 lt!215941)) (size!2833 arr!237))) (not (= (_1!6366 lt!215941) (_2!6369 lt!215948)))))))

(assert (=> b!138341 (= lt!215941 (readByteArrayLoopPure!0 (_1!6369 lt!215948) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!138341 (validate_offset_bits!1 ((_ sign_extend 32) (size!2833 (buf!3246 (_2!6367 lt!215934)))) ((_ sign_extend 32) (currentByte!6059 (_2!6367 lt!215926))) ((_ sign_extend 32) (currentBit!6054 (_2!6367 lt!215926))) lt!215950)))

(declare-fun lt!215929 () Unit!8622)

(assert (=> b!138341 (= lt!215929 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6367 lt!215926) (buf!3246 (_2!6367 lt!215934)) lt!215950))))

(assert (=> b!138341 (= lt!215948 (reader!0 (_2!6367 lt!215926) (_2!6367 lt!215934)))))

(declare-fun b!138342 () Bool)

(declare-fun res!115277 () Bool)

(assert (=> b!138342 (=> (not res!115277) (not e!91967))))

(assert (=> b!138342 (= res!115277 (invariant!0 (currentBit!6054 thiss!1634) (currentByte!6059 thiss!1634) (size!2833 (buf!3246 thiss!1634))))))

(assert (= (and start!26878 res!115280) b!138326))

(assert (= (and b!138326 res!115284) b!138334))

(assert (= (and b!138334 res!115275) b!138342))

(assert (= (and b!138342 res!115277) b!138329))

(assert (= (and b!138329 res!115281) b!138336))

(assert (= (and b!138336 res!115287) b!138335))

(assert (= (and b!138335 res!115273) b!138340))

(assert (= (and b!138329 res!115285) b!138337))

(assert (= (and b!138337 res!115282) b!138332))

(assert (= (and b!138332 res!115278) b!138341))

(assert (= (and b!138341 (not res!115276)) b!138331))

(assert (= (and b!138329 res!115274) b!138338))

(assert (= (and b!138329 res!115279) b!138328))

(assert (= (and b!138329 (not res!115283)) b!138339))

(assert (= (and b!138339 (not res!115286)) b!138330))

(assert (= (and b!138330 (not res!115272)) b!138327))

(assert (= start!26878 b!138333))

(declare-fun m!212771 () Bool)

(assert (=> b!138341 m!212771))

(declare-fun m!212773 () Bool)

(assert (=> b!138341 m!212773))

(declare-fun m!212775 () Bool)

(assert (=> b!138341 m!212775))

(declare-fun m!212777 () Bool)

(assert (=> b!138341 m!212777))

(declare-fun m!212779 () Bool)

(assert (=> b!138342 m!212779))

(declare-fun m!212781 () Bool)

(assert (=> b!138326 m!212781))

(declare-fun m!212783 () Bool)

(assert (=> b!138336 m!212783))

(declare-fun m!212785 () Bool)

(assert (=> b!138336 m!212785))

(declare-fun m!212787 () Bool)

(assert (=> b!138327 m!212787))

(declare-fun m!212789 () Bool)

(assert (=> b!138327 m!212789))

(declare-fun m!212791 () Bool)

(assert (=> b!138333 m!212791))

(declare-fun m!212793 () Bool)

(assert (=> b!138339 m!212793))

(declare-fun m!212795 () Bool)

(assert (=> b!138339 m!212795))

(declare-fun m!212797 () Bool)

(assert (=> b!138339 m!212797))

(declare-fun m!212799 () Bool)

(assert (=> b!138339 m!212799))

(declare-fun m!212801 () Bool)

(assert (=> b!138337 m!212801))

(assert (=> b!138337 m!212783))

(declare-fun m!212803 () Bool)

(assert (=> b!138329 m!212803))

(declare-fun m!212805 () Bool)

(assert (=> b!138329 m!212805))

(declare-fun m!212807 () Bool)

(assert (=> b!138329 m!212807))

(declare-fun m!212809 () Bool)

(assert (=> b!138329 m!212809))

(declare-fun m!212811 () Bool)

(assert (=> b!138329 m!212811))

(declare-fun m!212813 () Bool)

(assert (=> b!138329 m!212813))

(declare-fun m!212815 () Bool)

(assert (=> b!138329 m!212815))

(declare-fun m!212817 () Bool)

(assert (=> b!138329 m!212817))

(assert (=> b!138329 m!212777))

(declare-fun m!212819 () Bool)

(assert (=> b!138329 m!212819))

(declare-fun m!212821 () Bool)

(assert (=> b!138329 m!212821))

(declare-fun m!212823 () Bool)

(assert (=> b!138329 m!212823))

(declare-fun m!212825 () Bool)

(assert (=> b!138329 m!212825))

(declare-fun m!212827 () Bool)

(assert (=> b!138329 m!212827))

(declare-fun m!212829 () Bool)

(assert (=> b!138329 m!212829))

(declare-fun m!212831 () Bool)

(assert (=> b!138329 m!212831))

(declare-fun m!212833 () Bool)

(assert (=> b!138329 m!212833))

(assert (=> b!138329 m!212831))

(declare-fun m!212835 () Bool)

(assert (=> b!138329 m!212835))

(declare-fun m!212837 () Bool)

(assert (=> b!138329 m!212837))

(declare-fun m!212839 () Bool)

(assert (=> b!138329 m!212839))

(declare-fun m!212841 () Bool)

(assert (=> b!138329 m!212841))

(declare-fun m!212843 () Bool)

(assert (=> b!138329 m!212843))

(declare-fun m!212845 () Bool)

(assert (=> b!138329 m!212845))

(assert (=> b!138329 m!212843))

(declare-fun m!212847 () Bool)

(assert (=> b!138329 m!212847))

(declare-fun m!212849 () Bool)

(assert (=> b!138329 m!212849))

(declare-fun m!212851 () Bool)

(assert (=> b!138329 m!212851))

(declare-fun m!212853 () Bool)

(assert (=> b!138329 m!212853))

(declare-fun m!212855 () Bool)

(assert (=> b!138335 m!212855))

(declare-fun m!212857 () Bool)

(assert (=> b!138331 m!212857))

(declare-fun m!212859 () Bool)

(assert (=> start!26878 m!212859))

(declare-fun m!212861 () Bool)

(assert (=> start!26878 m!212861))

(assert (=> b!138330 m!212801))

(assert (=> b!138330 m!212785))

(declare-fun m!212863 () Bool)

(assert (=> b!138332 m!212863))

(assert (=> b!138340 m!212831))

(declare-fun m!212865 () Bool)

(assert (=> b!138340 m!212865))

(declare-fun m!212867 () Bool)

(assert (=> b!138340 m!212867))

(declare-fun m!212869 () Bool)

(assert (=> b!138338 m!212869))

(push 1)

(assert (not b!138332))

(assert (not b!138326))

(assert (not b!138336))

(assert (not b!138338))

(assert (not b!138329))

(assert (not b!138339))

(assert (not b!138331))

(assert (not b!138330))

(assert (not b!138333))

(assert (not b!138327))

(assert (not b!138340))

(assert (not start!26878))

(assert (not b!138337))

(assert (not b!138335))

(assert (not b!138341))

(assert (not b!138342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

