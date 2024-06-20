; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27798 () Bool)

(assert start!27798)

(declare-fun b!143374 () Bool)

(declare-fun e!95506 () Bool)

(assert (=> b!143374 (= e!95506 (not true))))

(declare-datatypes ((array!6555 0))(
  ( (array!6556 (arr!3690 (Array (_ BitVec 32) (_ BitVec 8))) (size!2967 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5192 0))(
  ( (BitStream!5193 (buf!3396 array!6555) (currentByte!6280 (_ BitVec 32)) (currentBit!6275 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12768 0))(
  ( (tuple2!12769 (_1!6725 BitStream!5192) (_2!6725 BitStream!5192)) )
))
(declare-fun lt!222243 () tuple2!12768)

(declare-fun arr!237 () array!6555)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12770 0))(
  ( (tuple2!12771 (_1!6726 BitStream!5192) (_2!6726 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5192) tuple2!12770)

(assert (=> b!143374 (= (_2!6726 (readBytePure!0 (_1!6725 lt!222243))) (select (arr!3690 arr!237) from!447))))

(declare-fun lt!222249 () tuple2!12768)

(declare-datatypes ((Unit!8934 0))(
  ( (Unit!8935) )
))
(declare-datatypes ((tuple2!12772 0))(
  ( (tuple2!12773 (_1!6727 Unit!8934) (_2!6727 BitStream!5192)) )
))
(declare-fun lt!222254 () tuple2!12772)

(declare-fun lt!222252 () tuple2!12772)

(declare-fun reader!0 (BitStream!5192 BitStream!5192) tuple2!12768)

(assert (=> b!143374 (= lt!222249 (reader!0 (_2!6727 lt!222254) (_2!6727 lt!222252)))))

(declare-fun thiss!1634 () BitStream!5192)

(assert (=> b!143374 (= lt!222243 (reader!0 thiss!1634 (_2!6727 lt!222252)))))

(declare-fun e!95503 () Bool)

(assert (=> b!143374 e!95503))

(declare-fun res!119746 () Bool)

(assert (=> b!143374 (=> (not res!119746) (not e!95503))))

(declare-fun lt!222250 () tuple2!12770)

(declare-fun lt!222255 () tuple2!12770)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143374 (= res!119746 (= (bitIndex!0 (size!2967 (buf!3396 (_1!6726 lt!222250))) (currentByte!6280 (_1!6726 lt!222250)) (currentBit!6275 (_1!6726 lt!222250))) (bitIndex!0 (size!2967 (buf!3396 (_1!6726 lt!222255))) (currentByte!6280 (_1!6726 lt!222255)) (currentBit!6275 (_1!6726 lt!222255)))))))

(declare-fun lt!222241 () Unit!8934)

(declare-fun lt!222251 () BitStream!5192)

(declare-fun readBytePrefixLemma!0 (BitStream!5192 BitStream!5192) Unit!8934)

(assert (=> b!143374 (= lt!222241 (readBytePrefixLemma!0 lt!222251 (_2!6727 lt!222252)))))

(assert (=> b!143374 (= lt!222255 (readBytePure!0 (BitStream!5193 (buf!3396 (_2!6727 lt!222252)) (currentByte!6280 thiss!1634) (currentBit!6275 thiss!1634))))))

(assert (=> b!143374 (= lt!222250 (readBytePure!0 lt!222251))))

(assert (=> b!143374 (= lt!222251 (BitStream!5193 (buf!3396 (_2!6727 lt!222254)) (currentByte!6280 thiss!1634) (currentBit!6275 thiss!1634)))))

(declare-fun e!95504 () Bool)

(assert (=> b!143374 e!95504))

(declare-fun res!119744 () Bool)

(assert (=> b!143374 (=> (not res!119744) (not e!95504))))

(declare-fun isPrefixOf!0 (BitStream!5192 BitStream!5192) Bool)

(assert (=> b!143374 (= res!119744 (isPrefixOf!0 thiss!1634 (_2!6727 lt!222252)))))

(declare-fun lt!222246 () Unit!8934)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5192 BitStream!5192 BitStream!5192) Unit!8934)

(assert (=> b!143374 (= lt!222246 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6727 lt!222254) (_2!6727 lt!222252)))))

(declare-fun e!95502 () Bool)

(assert (=> b!143374 e!95502))

(declare-fun res!119739 () Bool)

(assert (=> b!143374 (=> (not res!119739) (not e!95502))))

(assert (=> b!143374 (= res!119739 (= (size!2967 (buf!3396 (_2!6727 lt!222254))) (size!2967 (buf!3396 (_2!6727 lt!222252)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!5192 array!6555 (_ BitVec 32) (_ BitVec 32)) tuple2!12772)

(assert (=> b!143374 (= lt!222252 (appendByteArrayLoop!0 (_2!6727 lt!222254) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143374 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2967 (buf!3396 (_2!6727 lt!222254)))) ((_ sign_extend 32) (currentByte!6280 (_2!6727 lt!222254))) ((_ sign_extend 32) (currentBit!6275 (_2!6727 lt!222254))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222242 () Unit!8934)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5192 BitStream!5192 (_ BitVec 64) (_ BitVec 32)) Unit!8934)

(assert (=> b!143374 (= lt!222242 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6727 lt!222254) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!95509 () Bool)

(assert (=> b!143374 e!95509))

(declare-fun res!119745 () Bool)

(assert (=> b!143374 (=> (not res!119745) (not e!95509))))

(assert (=> b!143374 (= res!119745 (= (size!2967 (buf!3396 thiss!1634)) (size!2967 (buf!3396 (_2!6727 lt!222254)))))))

(declare-fun appendByte!0 (BitStream!5192 (_ BitVec 8)) tuple2!12772)

(assert (=> b!143374 (= lt!222254 (appendByte!0 thiss!1634 (select (arr!3690 arr!237) from!447)))))

(declare-fun b!143375 () Bool)

(declare-fun res!119748 () Bool)

(assert (=> b!143375 (=> (not res!119748) (not e!95506))))

(assert (=> b!143375 (= res!119748 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2967 (buf!3396 thiss!1634))) ((_ sign_extend 32) (currentByte!6280 thiss!1634)) ((_ sign_extend 32) (currentBit!6275 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143376 () Bool)

(declare-fun lt!222256 () tuple2!12770)

(declare-fun lt!222245 () tuple2!12768)

(assert (=> b!143376 (= e!95509 (and (= (_2!6726 lt!222256) (select (arr!3690 arr!237) from!447)) (= (_1!6726 lt!222256) (_2!6725 lt!222245))))))

(assert (=> b!143376 (= lt!222256 (readBytePure!0 (_1!6725 lt!222245)))))

(assert (=> b!143376 (= lt!222245 (reader!0 thiss!1634 (_2!6727 lt!222254)))))

(declare-fun b!143377 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143377 (= e!95504 (invariant!0 (currentBit!6275 thiss!1634) (currentByte!6280 thiss!1634) (size!2967 (buf!3396 (_2!6727 lt!222254)))))))

(declare-fun b!143378 () Bool)

(declare-fun e!95511 () Bool)

(declare-fun array_inv!2756 (array!6555) Bool)

(assert (=> b!143378 (= e!95511 (array_inv!2756 (buf!3396 thiss!1634)))))

(declare-fun b!143379 () Bool)

(declare-fun e!95508 () Bool)

(assert (=> b!143379 (= e!95502 e!95508)))

(declare-fun res!119742 () Bool)

(assert (=> b!143379 (=> (not res!119742) (not e!95508))))

(declare-fun lt!222244 () (_ BitVec 64))

(assert (=> b!143379 (= res!119742 (= (bitIndex!0 (size!2967 (buf!3396 (_2!6727 lt!222252))) (currentByte!6280 (_2!6727 lt!222252)) (currentBit!6275 (_2!6727 lt!222252))) (bvadd (bitIndex!0 (size!2967 (buf!3396 (_2!6727 lt!222254))) (currentByte!6280 (_2!6727 lt!222254)) (currentBit!6275 (_2!6727 lt!222254))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222244))))))

(assert (=> b!143379 (= lt!222244 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143380 () Bool)

(declare-fun res!119738 () Bool)

(assert (=> b!143380 (=> (not res!119738) (not e!95508))))

(assert (=> b!143380 (= res!119738 (isPrefixOf!0 (_2!6727 lt!222254) (_2!6727 lt!222252)))))

(declare-fun e!95505 () Bool)

(declare-fun b!143381 () Bool)

(declare-datatypes ((tuple2!12774 0))(
  ( (tuple2!12775 (_1!6728 BitStream!5192) (_2!6728 array!6555)) )
))
(declare-fun lt!222253 () tuple2!12774)

(declare-fun arrayRangesEq!283 (array!6555 array!6555 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143381 (= e!95505 (not (arrayRangesEq!283 arr!237 (_2!6728 lt!222253) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143382 () Bool)

(declare-fun res!119750 () Bool)

(assert (=> b!143382 (=> (not res!119750) (not e!95506))))

(assert (=> b!143382 (= res!119750 (invariant!0 (currentBit!6275 thiss!1634) (currentByte!6280 thiss!1634) (size!2967 (buf!3396 thiss!1634))))))

(declare-fun res!119749 () Bool)

(assert (=> start!27798 (=> (not res!119749) (not e!95506))))

(assert (=> start!27798 (= res!119749 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2967 arr!237))))))

(assert (=> start!27798 e!95506))

(assert (=> start!27798 true))

(assert (=> start!27798 (array_inv!2756 arr!237)))

(declare-fun inv!12 (BitStream!5192) Bool)

(assert (=> start!27798 (and (inv!12 thiss!1634) e!95511)))

(declare-fun b!143383 () Bool)

(declare-fun res!119740 () Bool)

(assert (=> b!143383 (=> (not res!119740) (not e!95506))))

(assert (=> b!143383 (= res!119740 (bvslt from!447 to!404))))

(declare-fun b!143384 () Bool)

(assert (=> b!143384 (= e!95508 (not e!95505))))

(declare-fun res!119741 () Bool)

(assert (=> b!143384 (=> res!119741 e!95505)))

(declare-fun lt!222248 () tuple2!12768)

(assert (=> b!143384 (= res!119741 (or (not (= (size!2967 (_2!6728 lt!222253)) (size!2967 arr!237))) (not (= (_1!6728 lt!222253) (_2!6725 lt!222248)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5192 array!6555 (_ BitVec 32) (_ BitVec 32)) tuple2!12774)

(assert (=> b!143384 (= lt!222253 (readByteArrayLoopPure!0 (_1!6725 lt!222248) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143384 (validate_offset_bits!1 ((_ sign_extend 32) (size!2967 (buf!3396 (_2!6727 lt!222252)))) ((_ sign_extend 32) (currentByte!6280 (_2!6727 lt!222254))) ((_ sign_extend 32) (currentBit!6275 (_2!6727 lt!222254))) lt!222244)))

(declare-fun lt!222247 () Unit!8934)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5192 array!6555 (_ BitVec 64)) Unit!8934)

(assert (=> b!143384 (= lt!222247 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6727 lt!222254) (buf!3396 (_2!6727 lt!222252)) lt!222244))))

(assert (=> b!143384 (= lt!222248 (reader!0 (_2!6727 lt!222254) (_2!6727 lt!222252)))))

(declare-fun b!143385 () Bool)

(assert (=> b!143385 (= e!95503 (= (_2!6726 lt!222250) (_2!6726 lt!222255)))))

(declare-fun b!143386 () Bool)

(declare-fun res!119747 () Bool)

(assert (=> b!143386 (=> (not res!119747) (not e!95509))))

(assert (=> b!143386 (= res!119747 (= (bitIndex!0 (size!2967 (buf!3396 (_2!6727 lt!222254))) (currentByte!6280 (_2!6727 lt!222254)) (currentBit!6275 (_2!6727 lt!222254))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2967 (buf!3396 thiss!1634)) (currentByte!6280 thiss!1634) (currentBit!6275 thiss!1634)))))))

(declare-fun b!143387 () Bool)

(declare-fun res!119743 () Bool)

(assert (=> b!143387 (=> (not res!119743) (not e!95509))))

(assert (=> b!143387 (= res!119743 (isPrefixOf!0 thiss!1634 (_2!6727 lt!222254)))))

(assert (= (and start!27798 res!119749) b!143375))

(assert (= (and b!143375 res!119748) b!143383))

(assert (= (and b!143383 res!119740) b!143382))

(assert (= (and b!143382 res!119750) b!143374))

(assert (= (and b!143374 res!119745) b!143386))

(assert (= (and b!143386 res!119747) b!143387))

(assert (= (and b!143387 res!119743) b!143376))

(assert (= (and b!143374 res!119739) b!143379))

(assert (= (and b!143379 res!119742) b!143380))

(assert (= (and b!143380 res!119738) b!143384))

(assert (= (and b!143384 (not res!119741)) b!143381))

(assert (= (and b!143374 res!119744) b!143377))

(assert (= (and b!143374 res!119746) b!143385))

(assert (= start!27798 b!143378))

(declare-fun m!220125 () Bool)

(assert (=> b!143381 m!220125))

(declare-fun m!220127 () Bool)

(assert (=> b!143378 m!220127))

(declare-fun m!220129 () Bool)

(assert (=> b!143374 m!220129))

(declare-fun m!220131 () Bool)

(assert (=> b!143374 m!220131))

(declare-fun m!220133 () Bool)

(assert (=> b!143374 m!220133))

(declare-fun m!220135 () Bool)

(assert (=> b!143374 m!220135))

(declare-fun m!220137 () Bool)

(assert (=> b!143374 m!220137))

(declare-fun m!220139 () Bool)

(assert (=> b!143374 m!220139))

(declare-fun m!220141 () Bool)

(assert (=> b!143374 m!220141))

(declare-fun m!220143 () Bool)

(assert (=> b!143374 m!220143))

(declare-fun m!220145 () Bool)

(assert (=> b!143374 m!220145))

(declare-fun m!220147 () Bool)

(assert (=> b!143374 m!220147))

(declare-fun m!220149 () Bool)

(assert (=> b!143374 m!220149))

(declare-fun m!220151 () Bool)

(assert (=> b!143374 m!220151))

(declare-fun m!220153 () Bool)

(assert (=> b!143374 m!220153))

(declare-fun m!220155 () Bool)

(assert (=> b!143374 m!220155))

(declare-fun m!220157 () Bool)

(assert (=> b!143374 m!220157))

(assert (=> b!143374 m!220147))

(declare-fun m!220159 () Bool)

(assert (=> b!143384 m!220159))

(declare-fun m!220161 () Bool)

(assert (=> b!143384 m!220161))

(declare-fun m!220163 () Bool)

(assert (=> b!143384 m!220163))

(assert (=> b!143384 m!220131))

(declare-fun m!220165 () Bool)

(assert (=> b!143379 m!220165))

(declare-fun m!220167 () Bool)

(assert (=> b!143379 m!220167))

(declare-fun m!220169 () Bool)

(assert (=> b!143382 m!220169))

(assert (=> b!143386 m!220167))

(declare-fun m!220171 () Bool)

(assert (=> b!143386 m!220171))

(declare-fun m!220173 () Bool)

(assert (=> start!27798 m!220173))

(declare-fun m!220175 () Bool)

(assert (=> start!27798 m!220175))

(declare-fun m!220177 () Bool)

(assert (=> b!143377 m!220177))

(declare-fun m!220179 () Bool)

(assert (=> b!143375 m!220179))

(assert (=> b!143376 m!220147))

(declare-fun m!220181 () Bool)

(assert (=> b!143376 m!220181))

(declare-fun m!220183 () Bool)

(assert (=> b!143376 m!220183))

(declare-fun m!220185 () Bool)

(assert (=> b!143380 m!220185))

(declare-fun m!220187 () Bool)

(assert (=> b!143387 m!220187))

(push 1)

(assert (not b!143382))

(assert (not b!143386))

(assert (not b!143387))

(assert (not b!143379))

(assert (not b!143378))

(assert (not b!143376))

(assert (not b!143381))

(assert (not b!143384))

(assert (not b!143375))

(assert (not b!143374))

(assert (not start!27798))

(assert (not b!143377))

(assert (not b!143380))

(check-sat)

