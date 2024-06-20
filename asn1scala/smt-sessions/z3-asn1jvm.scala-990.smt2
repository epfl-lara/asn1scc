; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27796 () Bool)

(assert start!27796)

(declare-fun b!143332 () Bool)

(declare-fun res!119706 () Bool)

(declare-fun e!95479 () Bool)

(assert (=> b!143332 (=> (not res!119706) (not e!95479))))

(declare-datatypes ((array!6553 0))(
  ( (array!6554 (arr!3689 (Array (_ BitVec 32) (_ BitVec 8))) (size!2966 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5190 0))(
  ( (BitStream!5191 (buf!3395 array!6553) (currentByte!6279 (_ BitVec 32)) (currentBit!6274 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8932 0))(
  ( (Unit!8933) )
))
(declare-datatypes ((tuple2!12760 0))(
  ( (tuple2!12761 (_1!6721 Unit!8932) (_2!6721 BitStream!5190)) )
))
(declare-fun lt!222203 () tuple2!12760)

(declare-fun thiss!1634 () BitStream!5190)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143332 (= res!119706 (= (bitIndex!0 (size!2966 (buf!3395 (_2!6721 lt!222203))) (currentByte!6279 (_2!6721 lt!222203)) (currentBit!6274 (_2!6721 lt!222203))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2966 (buf!3395 thiss!1634)) (currentByte!6279 thiss!1634) (currentBit!6274 thiss!1634)))))))

(declare-fun b!143333 () Bool)

(declare-fun res!119708 () Bool)

(declare-fun e!95473 () Bool)

(assert (=> b!143333 (=> (not res!119708) (not e!95473))))

(declare-fun lt!222194 () tuple2!12760)

(declare-fun isPrefixOf!0 (BitStream!5190 BitStream!5190) Bool)

(assert (=> b!143333 (= res!119708 (isPrefixOf!0 (_2!6721 lt!222203) (_2!6721 lt!222194)))))

(declare-fun b!143335 () Bool)

(declare-fun e!95481 () Bool)

(assert (=> b!143335 (= e!95481 (not true))))

(declare-datatypes ((tuple2!12762 0))(
  ( (tuple2!12763 (_1!6722 BitStream!5190) (_2!6722 BitStream!5190)) )
))
(declare-fun lt!222208 () tuple2!12762)

(declare-fun arr!237 () array!6553)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12764 0))(
  ( (tuple2!12765 (_1!6723 BitStream!5190) (_2!6723 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5190) tuple2!12764)

(assert (=> b!143335 (= (_2!6723 (readBytePure!0 (_1!6722 lt!222208))) (select (arr!3689 arr!237) from!447))))

(declare-fun lt!222198 () tuple2!12762)

(declare-fun reader!0 (BitStream!5190 BitStream!5190) tuple2!12762)

(assert (=> b!143335 (= lt!222198 (reader!0 (_2!6721 lt!222203) (_2!6721 lt!222194)))))

(assert (=> b!143335 (= lt!222208 (reader!0 thiss!1634 (_2!6721 lt!222194)))))

(declare-fun e!95476 () Bool)

(assert (=> b!143335 e!95476))

(declare-fun res!119709 () Bool)

(assert (=> b!143335 (=> (not res!119709) (not e!95476))))

(declare-fun lt!222197 () tuple2!12764)

(declare-fun lt!222204 () tuple2!12764)

(assert (=> b!143335 (= res!119709 (= (bitIndex!0 (size!2966 (buf!3395 (_1!6723 lt!222197))) (currentByte!6279 (_1!6723 lt!222197)) (currentBit!6274 (_1!6723 lt!222197))) (bitIndex!0 (size!2966 (buf!3395 (_1!6723 lt!222204))) (currentByte!6279 (_1!6723 lt!222204)) (currentBit!6274 (_1!6723 lt!222204)))))))

(declare-fun lt!222206 () Unit!8932)

(declare-fun lt!222200 () BitStream!5190)

(declare-fun readBytePrefixLemma!0 (BitStream!5190 BitStream!5190) Unit!8932)

(assert (=> b!143335 (= lt!222206 (readBytePrefixLemma!0 lt!222200 (_2!6721 lt!222194)))))

(assert (=> b!143335 (= lt!222204 (readBytePure!0 (BitStream!5191 (buf!3395 (_2!6721 lt!222194)) (currentByte!6279 thiss!1634) (currentBit!6274 thiss!1634))))))

(assert (=> b!143335 (= lt!222197 (readBytePure!0 lt!222200))))

(assert (=> b!143335 (= lt!222200 (BitStream!5191 (buf!3395 (_2!6721 lt!222203)) (currentByte!6279 thiss!1634) (currentBit!6274 thiss!1634)))))

(declare-fun e!95477 () Bool)

(assert (=> b!143335 e!95477))

(declare-fun res!119707 () Bool)

(assert (=> b!143335 (=> (not res!119707) (not e!95477))))

(assert (=> b!143335 (= res!119707 (isPrefixOf!0 thiss!1634 (_2!6721 lt!222194)))))

(declare-fun lt!222207 () Unit!8932)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5190 BitStream!5190 BitStream!5190) Unit!8932)

(assert (=> b!143335 (= lt!222207 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6721 lt!222203) (_2!6721 lt!222194)))))

(declare-fun e!95475 () Bool)

(assert (=> b!143335 e!95475))

(declare-fun res!119700 () Bool)

(assert (=> b!143335 (=> (not res!119700) (not e!95475))))

(assert (=> b!143335 (= res!119700 (= (size!2966 (buf!3395 (_2!6721 lt!222203))) (size!2966 (buf!3395 (_2!6721 lt!222194)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!5190 array!6553 (_ BitVec 32) (_ BitVec 32)) tuple2!12760)

(assert (=> b!143335 (= lt!222194 (appendByteArrayLoop!0 (_2!6721 lt!222203) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143335 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2966 (buf!3395 (_2!6721 lt!222203)))) ((_ sign_extend 32) (currentByte!6279 (_2!6721 lt!222203))) ((_ sign_extend 32) (currentBit!6274 (_2!6721 lt!222203))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222205 () Unit!8932)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5190 BitStream!5190 (_ BitVec 64) (_ BitVec 32)) Unit!8932)

(assert (=> b!143335 (= lt!222205 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6721 lt!222203) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143335 e!95479))

(declare-fun res!119703 () Bool)

(assert (=> b!143335 (=> (not res!119703) (not e!95479))))

(assert (=> b!143335 (= res!119703 (= (size!2966 (buf!3395 thiss!1634)) (size!2966 (buf!3395 (_2!6721 lt!222203)))))))

(declare-fun appendByte!0 (BitStream!5190 (_ BitVec 8)) tuple2!12760)

(assert (=> b!143335 (= lt!222203 (appendByte!0 thiss!1634 (select (arr!3689 arr!237) from!447)))))

(declare-fun b!143336 () Bool)

(declare-fun lt!222196 () tuple2!12764)

(declare-fun lt!222195 () tuple2!12762)

(assert (=> b!143336 (= e!95479 (and (= (_2!6723 lt!222196) (select (arr!3689 arr!237) from!447)) (= (_1!6723 lt!222196) (_2!6722 lt!222195))))))

(assert (=> b!143336 (= lt!222196 (readBytePure!0 (_1!6722 lt!222195)))))

(assert (=> b!143336 (= lt!222195 (reader!0 thiss!1634 (_2!6721 lt!222203)))))

(declare-fun b!143337 () Bool)

(declare-fun res!119705 () Bool)

(assert (=> b!143337 (=> (not res!119705) (not e!95479))))

(assert (=> b!143337 (= res!119705 (isPrefixOf!0 thiss!1634 (_2!6721 lt!222203)))))

(declare-fun b!143338 () Bool)

(declare-fun e!95474 () Bool)

(assert (=> b!143338 (= e!95473 (not e!95474))))

(declare-fun res!119704 () Bool)

(assert (=> b!143338 (=> res!119704 e!95474)))

(declare-fun lt!222202 () tuple2!12762)

(declare-datatypes ((tuple2!12766 0))(
  ( (tuple2!12767 (_1!6724 BitStream!5190) (_2!6724 array!6553)) )
))
(declare-fun lt!222201 () tuple2!12766)

(assert (=> b!143338 (= res!119704 (or (not (= (size!2966 (_2!6724 lt!222201)) (size!2966 arr!237))) (not (= (_1!6724 lt!222201) (_2!6722 lt!222202)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5190 array!6553 (_ BitVec 32) (_ BitVec 32)) tuple2!12766)

(assert (=> b!143338 (= lt!222201 (readByteArrayLoopPure!0 (_1!6722 lt!222202) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!222199 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143338 (validate_offset_bits!1 ((_ sign_extend 32) (size!2966 (buf!3395 (_2!6721 lt!222194)))) ((_ sign_extend 32) (currentByte!6279 (_2!6721 lt!222203))) ((_ sign_extend 32) (currentBit!6274 (_2!6721 lt!222203))) lt!222199)))

(declare-fun lt!222193 () Unit!8932)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5190 array!6553 (_ BitVec 64)) Unit!8932)

(assert (=> b!143338 (= lt!222193 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6721 lt!222203) (buf!3395 (_2!6721 lt!222194)) lt!222199))))

(assert (=> b!143338 (= lt!222202 (reader!0 (_2!6721 lt!222203) (_2!6721 lt!222194)))))

(declare-fun b!143339 () Bool)

(declare-fun e!95472 () Bool)

(declare-fun array_inv!2755 (array!6553) Bool)

(assert (=> b!143339 (= e!95472 (array_inv!2755 (buf!3395 thiss!1634)))))

(declare-fun b!143340 () Bool)

(assert (=> b!143340 (= e!95475 e!95473)))

(declare-fun res!119699 () Bool)

(assert (=> b!143340 (=> (not res!119699) (not e!95473))))

(assert (=> b!143340 (= res!119699 (= (bitIndex!0 (size!2966 (buf!3395 (_2!6721 lt!222194))) (currentByte!6279 (_2!6721 lt!222194)) (currentBit!6274 (_2!6721 lt!222194))) (bvadd (bitIndex!0 (size!2966 (buf!3395 (_2!6721 lt!222203))) (currentByte!6279 (_2!6721 lt!222203)) (currentBit!6274 (_2!6721 lt!222203))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222199))))))

(assert (=> b!143340 (= lt!222199 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143341 () Bool)

(declare-fun arrayRangesEq!282 (array!6553 array!6553 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143341 (= e!95474 (not (arrayRangesEq!282 arr!237 (_2!6724 lt!222201) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143342 () Bool)

(assert (=> b!143342 (= e!95476 (= (_2!6723 lt!222197) (_2!6723 lt!222204)))))

(declare-fun b!143343 () Bool)

(declare-fun res!119711 () Bool)

(assert (=> b!143343 (=> (not res!119711) (not e!95481))))

(assert (=> b!143343 (= res!119711 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2966 (buf!3395 thiss!1634))) ((_ sign_extend 32) (currentByte!6279 thiss!1634)) ((_ sign_extend 32) (currentBit!6274 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143344 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143344 (= e!95477 (invariant!0 (currentBit!6274 thiss!1634) (currentByte!6279 thiss!1634) (size!2966 (buf!3395 (_2!6721 lt!222203)))))))

(declare-fun b!143345 () Bool)

(declare-fun res!119702 () Bool)

(assert (=> b!143345 (=> (not res!119702) (not e!95481))))

(assert (=> b!143345 (= res!119702 (bvslt from!447 to!404))))

(declare-fun res!119710 () Bool)

(assert (=> start!27796 (=> (not res!119710) (not e!95481))))

(assert (=> start!27796 (= res!119710 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2966 arr!237))))))

(assert (=> start!27796 e!95481))

(assert (=> start!27796 true))

(assert (=> start!27796 (array_inv!2755 arr!237)))

(declare-fun inv!12 (BitStream!5190) Bool)

(assert (=> start!27796 (and (inv!12 thiss!1634) e!95472)))

(declare-fun b!143334 () Bool)

(declare-fun res!119701 () Bool)

(assert (=> b!143334 (=> (not res!119701) (not e!95481))))

(assert (=> b!143334 (= res!119701 (invariant!0 (currentBit!6274 thiss!1634) (currentByte!6279 thiss!1634) (size!2966 (buf!3395 thiss!1634))))))

(assert (= (and start!27796 res!119710) b!143343))

(assert (= (and b!143343 res!119711) b!143345))

(assert (= (and b!143345 res!119702) b!143334))

(assert (= (and b!143334 res!119701) b!143335))

(assert (= (and b!143335 res!119703) b!143332))

(assert (= (and b!143332 res!119706) b!143337))

(assert (= (and b!143337 res!119705) b!143336))

(assert (= (and b!143335 res!119700) b!143340))

(assert (= (and b!143340 res!119699) b!143333))

(assert (= (and b!143333 res!119708) b!143338))

(assert (= (and b!143338 (not res!119704)) b!143341))

(assert (= (and b!143335 res!119707) b!143344))

(assert (= (and b!143335 res!119709) b!143342))

(assert (= start!27796 b!143339))

(declare-fun m!220061 () Bool)

(assert (=> b!143340 m!220061))

(declare-fun m!220063 () Bool)

(assert (=> b!143340 m!220063))

(declare-fun m!220065 () Bool)

(assert (=> b!143339 m!220065))

(declare-fun m!220067 () Bool)

(assert (=> b!143333 m!220067))

(assert (=> b!143332 m!220063))

(declare-fun m!220069 () Bool)

(assert (=> b!143332 m!220069))

(declare-fun m!220071 () Bool)

(assert (=> b!143335 m!220071))

(declare-fun m!220073 () Bool)

(assert (=> b!143335 m!220073))

(declare-fun m!220075 () Bool)

(assert (=> b!143335 m!220075))

(declare-fun m!220077 () Bool)

(assert (=> b!143335 m!220077))

(declare-fun m!220079 () Bool)

(assert (=> b!143335 m!220079))

(declare-fun m!220081 () Bool)

(assert (=> b!143335 m!220081))

(declare-fun m!220083 () Bool)

(assert (=> b!143335 m!220083))

(declare-fun m!220085 () Bool)

(assert (=> b!143335 m!220085))

(declare-fun m!220087 () Bool)

(assert (=> b!143335 m!220087))

(assert (=> b!143335 m!220083))

(declare-fun m!220089 () Bool)

(assert (=> b!143335 m!220089))

(declare-fun m!220091 () Bool)

(assert (=> b!143335 m!220091))

(declare-fun m!220093 () Bool)

(assert (=> b!143335 m!220093))

(declare-fun m!220095 () Bool)

(assert (=> b!143335 m!220095))

(declare-fun m!220097 () Bool)

(assert (=> b!143335 m!220097))

(declare-fun m!220099 () Bool)

(assert (=> b!143335 m!220099))

(declare-fun m!220101 () Bool)

(assert (=> b!143338 m!220101))

(declare-fun m!220103 () Bool)

(assert (=> b!143338 m!220103))

(declare-fun m!220105 () Bool)

(assert (=> b!143338 m!220105))

(assert (=> b!143338 m!220079))

(declare-fun m!220107 () Bool)

(assert (=> start!27796 m!220107))

(declare-fun m!220109 () Bool)

(assert (=> start!27796 m!220109))

(assert (=> b!143336 m!220083))

(declare-fun m!220111 () Bool)

(assert (=> b!143336 m!220111))

(declare-fun m!220113 () Bool)

(assert (=> b!143336 m!220113))

(declare-fun m!220115 () Bool)

(assert (=> b!143341 m!220115))

(declare-fun m!220117 () Bool)

(assert (=> b!143344 m!220117))

(declare-fun m!220119 () Bool)

(assert (=> b!143343 m!220119))

(declare-fun m!220121 () Bool)

(assert (=> b!143334 m!220121))

(declare-fun m!220123 () Bool)

(assert (=> b!143337 m!220123))

(check-sat (not b!143340) (not b!143336) (not b!143337) (not b!143333) (not b!143344) (not start!27796) (not b!143335) (not b!143343) (not b!143332) (not b!143338) (not b!143339) (not b!143341) (not b!143334))
