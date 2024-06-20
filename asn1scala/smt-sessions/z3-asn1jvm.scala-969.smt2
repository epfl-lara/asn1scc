; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27350 () Bool)

(assert start!27350)

(declare-fun b!140377 () Bool)

(declare-fun e!93564 () Bool)

(declare-datatypes ((array!6416 0))(
  ( (array!6417 (arr!3610 (Array (_ BitVec 32) (_ BitVec 8))) (size!2903 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5064 0))(
  ( (BitStream!5065 (buf!3324 array!6416) (currentByte!6175 (_ BitVec 32)) (currentBit!6170 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5064)

(declare-fun array_inv!2692 (array!6416) Bool)

(assert (=> b!140377 (= e!93564 (array_inv!2692 (buf!3324 thiss!1634)))))

(declare-fun b!140378 () Bool)

(declare-fun res!117039 () Bool)

(declare-fun e!93560 () Bool)

(assert (=> b!140378 (=> (not res!117039) (not e!93560))))

(declare-datatypes ((Unit!8785 0))(
  ( (Unit!8786) )
))
(declare-datatypes ((tuple2!12292 0))(
  ( (tuple2!12293 (_1!6476 Unit!8785) (_2!6476 BitStream!5064)) )
))
(declare-fun lt!218708 () tuple2!12292)

(declare-fun isPrefixOf!0 (BitStream!5064 BitStream!5064) Bool)

(assert (=> b!140378 (= res!117039 (isPrefixOf!0 thiss!1634 (_2!6476 lt!218708)))))

(declare-fun arr!237 () array!6416)

(declare-datatypes ((tuple2!12294 0))(
  ( (tuple2!12295 (_1!6477 BitStream!5064) (_2!6477 BitStream!5064)) )
))
(declare-fun lt!218706 () tuple2!12294)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12296 0))(
  ( (tuple2!12297 (_1!6478 BitStream!5064) (_2!6478 (_ BitVec 8))) )
))
(declare-fun lt!218707 () tuple2!12296)

(declare-fun b!140379 () Bool)

(assert (=> b!140379 (= e!93560 (and (= (_2!6478 lt!218707) (select (arr!3610 arr!237) from!447)) (= (_1!6478 lt!218707) (_2!6477 lt!218706))))))

(declare-fun readBytePure!0 (BitStream!5064) tuple2!12296)

(assert (=> b!140379 (= lt!218707 (readBytePure!0 (_1!6477 lt!218706)))))

(declare-fun reader!0 (BitStream!5064 BitStream!5064) tuple2!12294)

(assert (=> b!140379 (= lt!218706 (reader!0 thiss!1634 (_2!6476 lt!218708)))))

(declare-fun b!140380 () Bool)

(declare-fun e!93562 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140380 (= e!93562 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140380 e!93560))

(declare-fun res!117041 () Bool)

(assert (=> b!140380 (=> (not res!117041) (not e!93560))))

(assert (=> b!140380 (= res!117041 (= (size!2903 (buf!3324 thiss!1634)) (size!2903 (buf!3324 (_2!6476 lt!218708)))))))

(declare-fun appendByte!0 (BitStream!5064 (_ BitVec 8)) tuple2!12292)

(assert (=> b!140380 (= lt!218708 (appendByte!0 thiss!1634 (select (arr!3610 arr!237) from!447)))))

(declare-fun b!140381 () Bool)

(declare-fun res!117042 () Bool)

(assert (=> b!140381 (=> (not res!117042) (not e!93560))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140381 (= res!117042 (= (bitIndex!0 (size!2903 (buf!3324 (_2!6476 lt!218708))) (currentByte!6175 (_2!6476 lt!218708)) (currentBit!6170 (_2!6476 lt!218708))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2903 (buf!3324 thiss!1634)) (currentByte!6175 thiss!1634) (currentBit!6170 thiss!1634)))))))

(declare-fun b!140382 () Bool)

(declare-fun res!117038 () Bool)

(assert (=> b!140382 (=> (not res!117038) (not e!93562))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140382 (= res!117038 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2903 (buf!3324 thiss!1634))) ((_ sign_extend 32) (currentByte!6175 thiss!1634)) ((_ sign_extend 32) (currentBit!6170 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140383 () Bool)

(declare-fun res!117040 () Bool)

(assert (=> b!140383 (=> (not res!117040) (not e!93562))))

(assert (=> b!140383 (= res!117040 (bvslt from!447 to!404))))

(declare-fun b!140384 () Bool)

(declare-fun res!117043 () Bool)

(assert (=> b!140384 (=> (not res!117043) (not e!93562))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140384 (= res!117043 (invariant!0 (currentBit!6170 thiss!1634) (currentByte!6175 thiss!1634) (size!2903 (buf!3324 thiss!1634))))))

(declare-fun res!117037 () Bool)

(assert (=> start!27350 (=> (not res!117037) (not e!93562))))

(assert (=> start!27350 (= res!117037 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2903 arr!237))))))

(assert (=> start!27350 e!93562))

(assert (=> start!27350 true))

(assert (=> start!27350 (array_inv!2692 arr!237)))

(declare-fun inv!12 (BitStream!5064) Bool)

(assert (=> start!27350 (and (inv!12 thiss!1634) e!93564)))

(assert (= (and start!27350 res!117037) b!140382))

(assert (= (and b!140382 res!117038) b!140383))

(assert (= (and b!140383 res!117040) b!140384))

(assert (= (and b!140384 res!117043) b!140380))

(assert (= (and b!140380 res!117041) b!140381))

(assert (= (and b!140381 res!117042) b!140378))

(assert (= (and b!140378 res!117039) b!140379))

(assert (= start!27350 b!140377))

(declare-fun m!216161 () Bool)

(assert (=> b!140380 m!216161))

(assert (=> b!140380 m!216161))

(declare-fun m!216163 () Bool)

(assert (=> b!140380 m!216163))

(declare-fun m!216165 () Bool)

(assert (=> b!140378 m!216165))

(declare-fun m!216167 () Bool)

(assert (=> b!140381 m!216167))

(declare-fun m!216169 () Bool)

(assert (=> b!140381 m!216169))

(declare-fun m!216171 () Bool)

(assert (=> b!140382 m!216171))

(assert (=> b!140379 m!216161))

(declare-fun m!216173 () Bool)

(assert (=> b!140379 m!216173))

(declare-fun m!216175 () Bool)

(assert (=> b!140379 m!216175))

(declare-fun m!216177 () Bool)

(assert (=> b!140384 m!216177))

(declare-fun m!216179 () Bool)

(assert (=> start!27350 m!216179))

(declare-fun m!216181 () Bool)

(assert (=> start!27350 m!216181))

(declare-fun m!216183 () Bool)

(assert (=> b!140377 m!216183))

(check-sat (not start!27350) (not b!140378) (not b!140377) (not b!140382) (not b!140379) (not b!140380) (not b!140384) (not b!140381))
(check-sat)
