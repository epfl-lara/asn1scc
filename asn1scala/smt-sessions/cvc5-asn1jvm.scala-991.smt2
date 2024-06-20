; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27800 () Bool)

(assert start!27800)

(declare-fun b!143416 () Bool)

(declare-fun e!95532 () Bool)

(declare-datatypes ((array!6557 0))(
  ( (array!6558 (arr!3691 (Array (_ BitVec 32) (_ BitVec 8))) (size!2968 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5194 0))(
  ( (BitStream!5195 (buf!3397 array!6557) (currentByte!6281 (_ BitVec 32)) (currentBit!6276 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12776 0))(
  ( (tuple2!12777 (_1!6729 BitStream!5194) (_2!6729 (_ BitVec 8))) )
))
(declare-fun lt!222296 () tuple2!12776)

(declare-fun lt!222302 () tuple2!12776)

(assert (=> b!143416 (= e!95532 (= (_2!6729 lt!222296) (_2!6729 lt!222302)))))

(declare-fun b!143417 () Bool)

(declare-fun e!95535 () Bool)

(declare-fun e!95536 () Bool)

(assert (=> b!143417 (= e!95535 (not e!95536))))

(declare-fun res!119788 () Bool)

(assert (=> b!143417 (=> res!119788 e!95536)))

(declare-datatypes ((tuple2!12778 0))(
  ( (tuple2!12779 (_1!6730 BitStream!5194) (_2!6730 array!6557)) )
))
(declare-fun lt!222291 () tuple2!12778)

(declare-datatypes ((tuple2!12780 0))(
  ( (tuple2!12781 (_1!6731 BitStream!5194) (_2!6731 BitStream!5194)) )
))
(declare-fun lt!222300 () tuple2!12780)

(declare-fun arr!237 () array!6557)

(assert (=> b!143417 (= res!119788 (or (not (= (size!2968 (_2!6730 lt!222291)) (size!2968 arr!237))) (not (= (_1!6730 lt!222291) (_2!6731 lt!222300)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5194 array!6557 (_ BitVec 32) (_ BitVec 32)) tuple2!12778)

(assert (=> b!143417 (= lt!222291 (readByteArrayLoopPure!0 (_1!6731 lt!222300) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8936 0))(
  ( (Unit!8937) )
))
(declare-datatypes ((tuple2!12782 0))(
  ( (tuple2!12783 (_1!6732 Unit!8936) (_2!6732 BitStream!5194)) )
))
(declare-fun lt!222299 () tuple2!12782)

(declare-fun lt!222290 () tuple2!12782)

(declare-fun lt!222303 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143417 (validate_offset_bits!1 ((_ sign_extend 32) (size!2968 (buf!3397 (_2!6732 lt!222299)))) ((_ sign_extend 32) (currentByte!6281 (_2!6732 lt!222290))) ((_ sign_extend 32) (currentBit!6276 (_2!6732 lt!222290))) lt!222303)))

(declare-fun lt!222293 () Unit!8936)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5194 array!6557 (_ BitVec 64)) Unit!8936)

(assert (=> b!143417 (= lt!222293 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6732 lt!222290) (buf!3397 (_2!6732 lt!222299)) lt!222303))))

(declare-fun reader!0 (BitStream!5194 BitStream!5194) tuple2!12780)

(assert (=> b!143417 (= lt!222300 (reader!0 (_2!6732 lt!222290) (_2!6732 lt!222299)))))

(declare-fun b!143418 () Bool)

(declare-fun e!95541 () Bool)

(assert (=> b!143418 (= e!95541 (not true))))

(declare-fun lt!222295 () tuple2!12780)

(declare-fun readBytePure!0 (BitStream!5194) tuple2!12776)

(assert (=> b!143418 (= (_2!6729 (readBytePure!0 (_1!6731 lt!222295))) (select (arr!3691 arr!237) from!447))))

(declare-fun lt!222294 () tuple2!12780)

(assert (=> b!143418 (= lt!222294 (reader!0 (_2!6732 lt!222290) (_2!6732 lt!222299)))))

(declare-fun thiss!1634 () BitStream!5194)

(assert (=> b!143418 (= lt!222295 (reader!0 thiss!1634 (_2!6732 lt!222299)))))

(assert (=> b!143418 e!95532))

(declare-fun res!119782 () Bool)

(assert (=> b!143418 (=> (not res!119782) (not e!95532))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143418 (= res!119782 (= (bitIndex!0 (size!2968 (buf!3397 (_1!6729 lt!222296))) (currentByte!6281 (_1!6729 lt!222296)) (currentBit!6276 (_1!6729 lt!222296))) (bitIndex!0 (size!2968 (buf!3397 (_1!6729 lt!222302))) (currentByte!6281 (_1!6729 lt!222302)) (currentBit!6276 (_1!6729 lt!222302)))))))

(declare-fun lt!222298 () Unit!8936)

(declare-fun lt!222304 () BitStream!5194)

(declare-fun readBytePrefixLemma!0 (BitStream!5194 BitStream!5194) Unit!8936)

(assert (=> b!143418 (= lt!222298 (readBytePrefixLemma!0 lt!222304 (_2!6732 lt!222299)))))

(assert (=> b!143418 (= lt!222302 (readBytePure!0 (BitStream!5195 (buf!3397 (_2!6732 lt!222299)) (currentByte!6281 thiss!1634) (currentBit!6276 thiss!1634))))))

(assert (=> b!143418 (= lt!222296 (readBytePure!0 lt!222304))))

(assert (=> b!143418 (= lt!222304 (BitStream!5195 (buf!3397 (_2!6732 lt!222290)) (currentByte!6281 thiss!1634) (currentBit!6276 thiss!1634)))))

(declare-fun e!95539 () Bool)

(assert (=> b!143418 e!95539))

(declare-fun res!119789 () Bool)

(assert (=> b!143418 (=> (not res!119789) (not e!95539))))

(declare-fun isPrefixOf!0 (BitStream!5194 BitStream!5194) Bool)

(assert (=> b!143418 (= res!119789 (isPrefixOf!0 thiss!1634 (_2!6732 lt!222299)))))

(declare-fun lt!222297 () Unit!8936)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5194 BitStream!5194 BitStream!5194) Unit!8936)

(assert (=> b!143418 (= lt!222297 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6732 lt!222290) (_2!6732 lt!222299)))))

(declare-fun e!95533 () Bool)

(assert (=> b!143418 e!95533))

(declare-fun res!119785 () Bool)

(assert (=> b!143418 (=> (not res!119785) (not e!95533))))

(assert (=> b!143418 (= res!119785 (= (size!2968 (buf!3397 (_2!6732 lt!222290))) (size!2968 (buf!3397 (_2!6732 lt!222299)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5194 array!6557 (_ BitVec 32) (_ BitVec 32)) tuple2!12782)

(assert (=> b!143418 (= lt!222299 (appendByteArrayLoop!0 (_2!6732 lt!222290) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143418 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2968 (buf!3397 (_2!6732 lt!222290)))) ((_ sign_extend 32) (currentByte!6281 (_2!6732 lt!222290))) ((_ sign_extend 32) (currentBit!6276 (_2!6732 lt!222290))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222289 () Unit!8936)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5194 BitStream!5194 (_ BitVec 64) (_ BitVec 32)) Unit!8936)

(assert (=> b!143418 (= lt!222289 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6732 lt!222290) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!95538 () Bool)

(assert (=> b!143418 e!95538))

(declare-fun res!119787 () Bool)

(assert (=> b!143418 (=> (not res!119787) (not e!95538))))

(assert (=> b!143418 (= res!119787 (= (size!2968 (buf!3397 thiss!1634)) (size!2968 (buf!3397 (_2!6732 lt!222290)))))))

(declare-fun appendByte!0 (BitStream!5194 (_ BitVec 8)) tuple2!12782)

(assert (=> b!143418 (= lt!222290 (appendByte!0 thiss!1634 (select (arr!3691 arr!237) from!447)))))

(declare-fun b!143419 () Bool)

(declare-fun res!119781 () Bool)

(assert (=> b!143419 (=> (not res!119781) (not e!95538))))

(assert (=> b!143419 (= res!119781 (= (bitIndex!0 (size!2968 (buf!3397 (_2!6732 lt!222290))) (currentByte!6281 (_2!6732 lt!222290)) (currentBit!6276 (_2!6732 lt!222290))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2968 (buf!3397 thiss!1634)) (currentByte!6281 thiss!1634) (currentBit!6276 thiss!1634)))))))

(declare-fun b!143420 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143420 (= e!95539 (invariant!0 (currentBit!6276 thiss!1634) (currentByte!6281 thiss!1634) (size!2968 (buf!3397 (_2!6732 lt!222290)))))))

(declare-fun b!143421 () Bool)

(declare-fun res!119783 () Bool)

(assert (=> b!143421 (=> (not res!119783) (not e!95541))))

(assert (=> b!143421 (= res!119783 (bvslt from!447 to!404))))

(declare-fun b!143422 () Bool)

(declare-fun lt!222292 () tuple2!12780)

(declare-fun lt!222301 () tuple2!12776)

(assert (=> b!143422 (= e!95538 (and (= (_2!6729 lt!222301) (select (arr!3691 arr!237) from!447)) (= (_1!6729 lt!222301) (_2!6731 lt!222292))))))

(assert (=> b!143422 (= lt!222301 (readBytePure!0 (_1!6731 lt!222292)))))

(assert (=> b!143422 (= lt!222292 (reader!0 thiss!1634 (_2!6732 lt!222290)))))

(declare-fun b!143423 () Bool)

(declare-fun res!119786 () Bool)

(assert (=> b!143423 (=> (not res!119786) (not e!95541))))

(assert (=> b!143423 (= res!119786 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2968 (buf!3397 thiss!1634))) ((_ sign_extend 32) (currentByte!6281 thiss!1634)) ((_ sign_extend 32) (currentBit!6276 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143424 () Bool)

(declare-fun arrayRangesEq!284 (array!6557 array!6557 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143424 (= e!95536 (not (arrayRangesEq!284 arr!237 (_2!6730 lt!222291) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143425 () Bool)

(declare-fun e!95537 () Bool)

(declare-fun array_inv!2757 (array!6557) Bool)

(assert (=> b!143425 (= e!95537 (array_inv!2757 (buf!3397 thiss!1634)))))

(declare-fun b!143426 () Bool)

(assert (=> b!143426 (= e!95533 e!95535)))

(declare-fun res!119780 () Bool)

(assert (=> b!143426 (=> (not res!119780) (not e!95535))))

(assert (=> b!143426 (= res!119780 (= (bitIndex!0 (size!2968 (buf!3397 (_2!6732 lt!222299))) (currentByte!6281 (_2!6732 lt!222299)) (currentBit!6276 (_2!6732 lt!222299))) (bvadd (bitIndex!0 (size!2968 (buf!3397 (_2!6732 lt!222290))) (currentByte!6281 (_2!6732 lt!222290)) (currentBit!6276 (_2!6732 lt!222290))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222303))))))

(assert (=> b!143426 (= lt!222303 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!119779 () Bool)

(assert (=> start!27800 (=> (not res!119779) (not e!95541))))

(assert (=> start!27800 (= res!119779 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2968 arr!237))))))

(assert (=> start!27800 e!95541))

(assert (=> start!27800 true))

(assert (=> start!27800 (array_inv!2757 arr!237)))

(declare-fun inv!12 (BitStream!5194) Bool)

(assert (=> start!27800 (and (inv!12 thiss!1634) e!95537)))

(declare-fun b!143427 () Bool)

(declare-fun res!119778 () Bool)

(assert (=> b!143427 (=> (not res!119778) (not e!95538))))

(assert (=> b!143427 (= res!119778 (isPrefixOf!0 thiss!1634 (_2!6732 lt!222290)))))

(declare-fun b!143428 () Bool)

(declare-fun res!119777 () Bool)

(assert (=> b!143428 (=> (not res!119777) (not e!95535))))

(assert (=> b!143428 (= res!119777 (isPrefixOf!0 (_2!6732 lt!222290) (_2!6732 lt!222299)))))

(declare-fun b!143429 () Bool)

(declare-fun res!119784 () Bool)

(assert (=> b!143429 (=> (not res!119784) (not e!95541))))

(assert (=> b!143429 (= res!119784 (invariant!0 (currentBit!6276 thiss!1634) (currentByte!6281 thiss!1634) (size!2968 (buf!3397 thiss!1634))))))

(assert (= (and start!27800 res!119779) b!143423))

(assert (= (and b!143423 res!119786) b!143421))

(assert (= (and b!143421 res!119783) b!143429))

(assert (= (and b!143429 res!119784) b!143418))

(assert (= (and b!143418 res!119787) b!143419))

(assert (= (and b!143419 res!119781) b!143427))

(assert (= (and b!143427 res!119778) b!143422))

(assert (= (and b!143418 res!119785) b!143426))

(assert (= (and b!143426 res!119780) b!143428))

(assert (= (and b!143428 res!119777) b!143417))

(assert (= (and b!143417 (not res!119788)) b!143424))

(assert (= (and b!143418 res!119789) b!143420))

(assert (= (and b!143418 res!119782) b!143416))

(assert (= start!27800 b!143425))

(declare-fun m!220189 () Bool)

(assert (=> b!143429 m!220189))

(declare-fun m!220191 () Bool)

(assert (=> b!143418 m!220191))

(declare-fun m!220193 () Bool)

(assert (=> b!143418 m!220193))

(declare-fun m!220195 () Bool)

(assert (=> b!143418 m!220195))

(declare-fun m!220197 () Bool)

(assert (=> b!143418 m!220197))

(declare-fun m!220199 () Bool)

(assert (=> b!143418 m!220199))

(declare-fun m!220201 () Bool)

(assert (=> b!143418 m!220201))

(declare-fun m!220203 () Bool)

(assert (=> b!143418 m!220203))

(declare-fun m!220205 () Bool)

(assert (=> b!143418 m!220205))

(declare-fun m!220207 () Bool)

(assert (=> b!143418 m!220207))

(declare-fun m!220209 () Bool)

(assert (=> b!143418 m!220209))

(declare-fun m!220211 () Bool)

(assert (=> b!143418 m!220211))

(declare-fun m!220213 () Bool)

(assert (=> b!143418 m!220213))

(declare-fun m!220215 () Bool)

(assert (=> b!143418 m!220215))

(declare-fun m!220217 () Bool)

(assert (=> b!143418 m!220217))

(declare-fun m!220219 () Bool)

(assert (=> b!143418 m!220219))

(assert (=> b!143418 m!220211))

(declare-fun m!220221 () Bool)

(assert (=> b!143423 m!220221))

(declare-fun m!220223 () Bool)

(assert (=> b!143420 m!220223))

(assert (=> b!143422 m!220211))

(declare-fun m!220225 () Bool)

(assert (=> b!143422 m!220225))

(declare-fun m!220227 () Bool)

(assert (=> b!143422 m!220227))

(declare-fun m!220229 () Bool)

(assert (=> b!143426 m!220229))

(declare-fun m!220231 () Bool)

(assert (=> b!143426 m!220231))

(declare-fun m!220233 () Bool)

(assert (=> b!143424 m!220233))

(assert (=> b!143419 m!220231))

(declare-fun m!220235 () Bool)

(assert (=> b!143419 m!220235))

(declare-fun m!220237 () Bool)

(assert (=> b!143417 m!220237))

(declare-fun m!220239 () Bool)

(assert (=> b!143417 m!220239))

(declare-fun m!220241 () Bool)

(assert (=> b!143417 m!220241))

(assert (=> b!143417 m!220197))

(declare-fun m!220243 () Bool)

(assert (=> b!143427 m!220243))

(declare-fun m!220245 () Bool)

(assert (=> start!27800 m!220245))

(declare-fun m!220247 () Bool)

(assert (=> start!27800 m!220247))

(declare-fun m!220249 () Bool)

(assert (=> b!143428 m!220249))

(declare-fun m!220251 () Bool)

(assert (=> b!143425 m!220251))

(push 1)

(assert (not b!143418))

(assert (not b!143429))

(assert (not b!143417))

(assert (not b!143424))

(assert (not b!143423))

(assert (not b!143428))

(assert (not b!143426))

(assert (not b!143419))

(assert (not start!27800))

(assert (not b!143422))

(assert (not b!143420))

(assert (not b!143427))

(assert (not b!143425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

