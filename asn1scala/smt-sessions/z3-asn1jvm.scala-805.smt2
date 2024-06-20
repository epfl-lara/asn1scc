; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23338 () Bool)

(assert start!23338)

(declare-fun b!118624 () Bool)

(declare-fun e!77774 () Bool)

(declare-datatypes ((array!5323 0))(
  ( (array!5324 (arr!3007 (Array (_ BitVec 32) (_ BitVec 8))) (size!2414 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4302 0))(
  ( (BitStream!4303 (buf!2833 array!5323) (currentByte!5488 (_ BitVec 32)) (currentBit!5483 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4302)

(declare-datatypes ((Unit!7299 0))(
  ( (Unit!7300) )
))
(declare-datatypes ((tuple2!9948 0))(
  ( (tuple2!9949 (_1!5239 Unit!7299) (_2!5239 BitStream!4302)) )
))
(declare-fun lt!182528 () tuple2!9948)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118624 (= e!77774 (invariant!0 (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182528)))))))

(declare-fun b!118625 () Bool)

(declare-fun e!77769 () Bool)

(declare-fun e!77771 () Bool)

(assert (=> b!118625 (= e!77769 e!77771)))

(declare-fun res!98176 () Bool)

(assert (=> b!118625 (=> (not res!98176) (not e!77771))))

(declare-fun lt!182540 () tuple2!9948)

(declare-fun lt!182544 () Bool)

(declare-datatypes ((tuple2!9950 0))(
  ( (tuple2!9951 (_1!5240 BitStream!4302) (_2!5240 Bool)) )
))
(declare-fun lt!182535 () tuple2!9950)

(assert (=> b!118625 (= res!98176 (and (= (_2!5240 lt!182535) lt!182544) (= (_1!5240 lt!182535) (_2!5239 lt!182540))))))

(declare-fun readBitPure!0 (BitStream!4302) tuple2!9950)

(declare-fun readerFrom!0 (BitStream!4302 (_ BitVec 32) (_ BitVec 32)) BitStream!4302)

(assert (=> b!118625 (= lt!182535 (readBitPure!0 (readerFrom!0 (_2!5239 lt!182540) (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305))))))

(declare-fun lt!182547 () (_ BitVec 64))

(declare-fun e!77770 () Bool)

(declare-fun b!118626 () Bool)

(declare-fun lt!182531 () (_ BitVec 64))

(declare-fun lt!182532 () (_ BitVec 64))

(assert (=> b!118626 (= e!77770 (or (= lt!182547 (bvand lt!182531 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!182547 (bvand (bvsub lt!182532 lt!182531) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!118626 (= lt!182547 (bvand lt!182532 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118626 (= lt!182531 (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182528))) (currentByte!5488 (_2!5239 lt!182528)) (currentBit!5483 (_2!5239 lt!182528))))))

(assert (=> b!118626 (= lt!182532 (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(declare-datatypes ((tuple2!9952 0))(
  ( (tuple2!9953 (_1!5241 BitStream!4302) (_2!5241 (_ BitVec 64))) )
))
(declare-fun lt!182550 () tuple2!9952)

(declare-fun lt!182553 () tuple2!9952)

(assert (=> b!118626 (and (= (_2!5241 lt!182550) (_2!5241 lt!182553)) (= (_1!5241 lt!182550) (_1!5241 lt!182553)))))

(declare-fun lt!182529 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!9954 0))(
  ( (tuple2!9955 (_1!5242 BitStream!4302) (_2!5242 BitStream!4302)) )
))
(declare-fun lt!182539 () tuple2!9954)

(declare-fun lt!182530 () Unit!7299)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7299)

(assert (=> b!118626 (= lt!182530 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5242 lt!182539) nBits!396 i!615 lt!182529))))

(declare-fun lt!182527 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9952)

(declare-fun withMovedBitIndex!0 (BitStream!4302 (_ BitVec 64)) BitStream!4302)

(assert (=> b!118626 (= lt!182553 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5242 lt!182539) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182527))))

(declare-fun b!118627 () Bool)

(declare-fun e!77775 () Bool)

(assert (=> b!118627 (= e!77775 e!77769)))

(declare-fun res!98179 () Bool)

(assert (=> b!118627 (=> (not res!98179) (not e!77769))))

(declare-fun lt!182551 () (_ BitVec 64))

(declare-fun lt!182546 () (_ BitVec 64))

(assert (=> b!118627 (= res!98179 (= lt!182551 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182546)))))

(assert (=> b!118627 (= lt!182551 (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))))))

(assert (=> b!118627 (= lt!182546 (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(declare-fun b!118628 () Bool)

(declare-fun e!77778 () Bool)

(assert (=> b!118628 (= e!77778 (not e!77770))))

(declare-fun res!98187 () Bool)

(assert (=> b!118628 (=> res!98187 e!77770)))

(declare-fun lt!182543 () tuple2!9954)

(assert (=> b!118628 (= res!98187 (not (= (_1!5241 (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!182543) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182527)) (_2!5242 lt!182543))))))

(declare-fun lt!182549 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540))) lt!182549)))

(declare-fun lt!182552 () Unit!7299)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4302 array!5323 (_ BitVec 64)) Unit!7299)

(assert (=> b!118628 (= lt!182552 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5239 lt!182540) (buf!2833 (_2!5239 lt!182528)) lt!182549))))

(assert (=> b!118628 (= lt!182549 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182533 () (_ BitVec 64))

(declare-fun lt!182538 () tuple2!9950)

(assert (=> b!118628 (= lt!182527 (bvor lt!182529 (ite (_2!5240 lt!182538) lt!182533 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118628 (= lt!182550 (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!182539) nBits!396 i!615 lt!182529))))

(declare-fun lt!182542 () (_ BitVec 64))

(assert (=> b!118628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305)) lt!182542)))

(declare-fun lt!182545 () Unit!7299)

(assert (=> b!118628 (= lt!182545 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2833 (_2!5239 lt!182528)) lt!182542))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118628 (= lt!182529 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!118628 (= (_2!5240 lt!182538) lt!182544)))

(assert (=> b!118628 (= lt!182538 (readBitPure!0 (_1!5242 lt!182539)))))

(declare-fun reader!0 (BitStream!4302 BitStream!4302) tuple2!9954)

(assert (=> b!118628 (= lt!182543 (reader!0 (_2!5239 lt!182540) (_2!5239 lt!182528)))))

(assert (=> b!118628 (= lt!182539 (reader!0 thiss!1305 (_2!5239 lt!182528)))))

(declare-fun e!77772 () Bool)

(assert (=> b!118628 e!77772))

(declare-fun res!98183 () Bool)

(assert (=> b!118628 (=> (not res!98183) (not e!77772))))

(declare-fun lt!182541 () tuple2!9950)

(declare-fun lt!182537 () tuple2!9950)

(assert (=> b!118628 (= res!98183 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!182541))) (currentByte!5488 (_1!5240 lt!182541)) (currentBit!5483 (_1!5240 lt!182541))) (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!182537))) (currentByte!5488 (_1!5240 lt!182537)) (currentBit!5483 (_1!5240 lt!182537)))))))

(declare-fun lt!182536 () Unit!7299)

(declare-fun lt!182548 () BitStream!4302)

(declare-fun readBitPrefixLemma!0 (BitStream!4302 BitStream!4302) Unit!7299)

(assert (=> b!118628 (= lt!182536 (readBitPrefixLemma!0 lt!182548 (_2!5239 lt!182528)))))

(assert (=> b!118628 (= lt!182537 (readBitPure!0 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305))))))

(assert (=> b!118628 (= lt!182541 (readBitPure!0 lt!182548))))

(assert (=> b!118628 (= lt!182548 (BitStream!4303 (buf!2833 (_2!5239 lt!182540)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(assert (=> b!118628 e!77774))

(declare-fun res!98184 () Bool)

(assert (=> b!118628 (=> (not res!98184) (not e!77774))))

(declare-fun isPrefixOf!0 (BitStream!4302 BitStream!4302) Bool)

(assert (=> b!118628 (= res!98184 (isPrefixOf!0 thiss!1305 (_2!5239 lt!182528)))))

(declare-fun lt!182534 () Unit!7299)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4302 BitStream!4302 BitStream!4302) Unit!7299)

(assert (=> b!118628 (= lt!182534 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5239 lt!182540) (_2!5239 lt!182528)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4302 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9948)

(assert (=> b!118628 (= lt!182528 (appendNLeastSignificantBitsLoop!0 (_2!5239 lt!182540) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!118628 e!77775))

(declare-fun res!98182 () Bool)

(assert (=> b!118628 (=> (not res!98182) (not e!77775))))

(assert (=> b!118628 (= res!98182 (= (size!2414 (buf!2833 thiss!1305)) (size!2414 (buf!2833 (_2!5239 lt!182540)))))))

(declare-fun appendBit!0 (BitStream!4302 Bool) tuple2!9948)

(assert (=> b!118628 (= lt!182540 (appendBit!0 thiss!1305 lt!182544))))

(assert (=> b!118628 (= lt!182544 (not (= (bvand v!199 lt!182533) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118628 (= lt!182533 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118629 () Bool)

(declare-fun res!98186 () Bool)

(assert (=> b!118629 (=> (not res!98186) (not e!77774))))

(assert (=> b!118629 (= res!98186 (invariant!0 (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182540)))))))

(declare-fun b!118630 () Bool)

(assert (=> b!118630 (= e!77772 (= (_2!5240 lt!182541) (_2!5240 lt!182537)))))

(declare-fun b!118631 () Bool)

(declare-fun res!98180 () Bool)

(assert (=> b!118631 (=> (not res!98180) (not e!77778))))

(assert (=> b!118631 (= res!98180 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!118632 () Bool)

(declare-fun e!77776 () Bool)

(declare-fun array_inv!2216 (array!5323) Bool)

(assert (=> b!118632 (= e!77776 (array_inv!2216 (buf!2833 thiss!1305)))))

(declare-fun b!118633 () Bool)

(declare-fun res!98185 () Bool)

(assert (=> b!118633 (=> (not res!98185) (not e!77769))))

(assert (=> b!118633 (= res!98185 (isPrefixOf!0 thiss!1305 (_2!5239 lt!182540)))))

(declare-fun b!118634 () Bool)

(declare-fun res!98177 () Bool)

(assert (=> b!118634 (=> (not res!98177) (not e!77778))))

(assert (=> b!118634 (= res!98177 (bvslt i!615 nBits!396))))

(declare-fun b!118635 () Bool)

(assert (=> b!118635 (= e!77771 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!182535))) (currentByte!5488 (_1!5240 lt!182535)) (currentBit!5483 (_1!5240 lt!182535))) lt!182551))))

(declare-fun b!118636 () Bool)

(declare-fun e!77777 () Bool)

(assert (=> b!118636 (= e!77777 e!77778)))

(declare-fun res!98181 () Bool)

(assert (=> b!118636 (=> (not res!98181) (not e!77778))))

(assert (=> b!118636 (= res!98181 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 thiss!1305))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305)) lt!182542))))

(assert (=> b!118636 (= lt!182542 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!98178 () Bool)

(assert (=> start!23338 (=> (not res!98178) (not e!77777))))

(assert (=> start!23338 (= res!98178 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23338 e!77777))

(assert (=> start!23338 true))

(declare-fun inv!12 (BitStream!4302) Bool)

(assert (=> start!23338 (and (inv!12 thiss!1305) e!77776)))

(assert (= (and start!23338 res!98178) b!118636))

(assert (= (and b!118636 res!98181) b!118631))

(assert (= (and b!118631 res!98180) b!118634))

(assert (= (and b!118634 res!98177) b!118628))

(assert (= (and b!118628 res!98182) b!118627))

(assert (= (and b!118627 res!98179) b!118633))

(assert (= (and b!118633 res!98185) b!118625))

(assert (= (and b!118625 res!98176) b!118635))

(assert (= (and b!118628 res!98184) b!118629))

(assert (= (and b!118629 res!98186) b!118624))

(assert (= (and b!118628 res!98183) b!118630))

(assert (= (and b!118628 (not res!98187)) b!118626))

(assert (= start!23338 b!118632))

(declare-fun m!178227 () Bool)

(assert (=> b!118629 m!178227))

(declare-fun m!178229 () Bool)

(assert (=> b!118631 m!178229))

(declare-fun m!178231 () Bool)

(assert (=> b!118635 m!178231))

(declare-fun m!178233 () Bool)

(assert (=> b!118624 m!178233))

(declare-fun m!178235 () Bool)

(assert (=> b!118628 m!178235))

(declare-fun m!178237 () Bool)

(assert (=> b!118628 m!178237))

(declare-fun m!178239 () Bool)

(assert (=> b!118628 m!178239))

(declare-fun m!178241 () Bool)

(assert (=> b!118628 m!178241))

(declare-fun m!178243 () Bool)

(assert (=> b!118628 m!178243))

(declare-fun m!178245 () Bool)

(assert (=> b!118628 m!178245))

(declare-fun m!178247 () Bool)

(assert (=> b!118628 m!178247))

(declare-fun m!178249 () Bool)

(assert (=> b!118628 m!178249))

(declare-fun m!178251 () Bool)

(assert (=> b!118628 m!178251))

(declare-fun m!178253 () Bool)

(assert (=> b!118628 m!178253))

(declare-fun m!178255 () Bool)

(assert (=> b!118628 m!178255))

(declare-fun m!178257 () Bool)

(assert (=> b!118628 m!178257))

(declare-fun m!178259 () Bool)

(assert (=> b!118628 m!178259))

(declare-fun m!178261 () Bool)

(assert (=> b!118628 m!178261))

(declare-fun m!178263 () Bool)

(assert (=> b!118628 m!178263))

(declare-fun m!178265 () Bool)

(assert (=> b!118628 m!178265))

(declare-fun m!178267 () Bool)

(assert (=> b!118628 m!178267))

(declare-fun m!178269 () Bool)

(assert (=> b!118628 m!178269))

(declare-fun m!178271 () Bool)

(assert (=> b!118628 m!178271))

(declare-fun m!178273 () Bool)

(assert (=> b!118626 m!178273))

(declare-fun m!178275 () Bool)

(assert (=> b!118626 m!178275))

(declare-fun m!178277 () Bool)

(assert (=> b!118626 m!178277))

(declare-fun m!178279 () Bool)

(assert (=> b!118626 m!178279))

(assert (=> b!118626 m!178273))

(declare-fun m!178281 () Bool)

(assert (=> b!118626 m!178281))

(declare-fun m!178283 () Bool)

(assert (=> b!118632 m!178283))

(declare-fun m!178285 () Bool)

(assert (=> b!118636 m!178285))

(declare-fun m!178287 () Bool)

(assert (=> b!118625 m!178287))

(assert (=> b!118625 m!178287))

(declare-fun m!178289 () Bool)

(assert (=> b!118625 m!178289))

(declare-fun m!178291 () Bool)

(assert (=> b!118627 m!178291))

(assert (=> b!118627 m!178277))

(declare-fun m!178293 () Bool)

(assert (=> b!118633 m!178293))

(declare-fun m!178295 () Bool)

(assert (=> start!23338 m!178295))

(check-sat (not b!118627) (not b!118629) (not b!118632) (not b!118636) (not b!118628) (not b!118625) (not b!118626) (not b!118624) (not b!118635) (not start!23338) (not b!118631) (not b!118633))
(check-sat)
(get-model)

(declare-fun d!38042 () Bool)

(assert (=> d!38042 (= (array_inv!2216 (buf!2833 thiss!1305)) (bvsge (size!2414 (buf!2833 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!118632 d!38042))

(declare-fun d!38044 () Bool)

(assert (=> d!38044 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!118631 d!38044))

(declare-fun d!38046 () Bool)

(assert (=> d!38046 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305) (size!2414 (buf!2833 thiss!1305))))))

(declare-fun bs!9208 () Bool)

(assert (= bs!9208 d!38046))

(declare-fun m!178823 () Bool)

(assert (=> bs!9208 m!178823))

(assert (=> start!23338 d!38046))

(declare-fun d!38048 () Bool)

(assert (=> d!38048 (= (invariant!0 (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182540)))) (and (bvsge (currentBit!5483 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5483 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5488 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182540)))) (and (= (currentBit!5483 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182540))))))))))

(assert (=> b!118629 d!38048))

(declare-fun d!38050 () Bool)

(assert (=> d!38050 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!118628 d!38050))

(declare-fun d!38052 () Bool)

(assert (=> d!38052 (isPrefixOf!0 thiss!1305 (_2!5239 lt!182528))))

(declare-fun lt!183295 () Unit!7299)

(declare-fun choose!30 (BitStream!4302 BitStream!4302 BitStream!4302) Unit!7299)

(assert (=> d!38052 (= lt!183295 (choose!30 thiss!1305 (_2!5239 lt!182540) (_2!5239 lt!182528)))))

(assert (=> d!38052 (isPrefixOf!0 thiss!1305 (_2!5239 lt!182540))))

(assert (=> d!38052 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5239 lt!182540) (_2!5239 lt!182528)) lt!183295)))

(declare-fun bs!9209 () Bool)

(assert (= bs!9209 d!38052))

(assert (=> bs!9209 m!178259))

(declare-fun m!178825 () Bool)

(assert (=> bs!9209 m!178825))

(assert (=> bs!9209 m!178293))

(assert (=> b!118628 d!38052))

(declare-fun b!118904 () Bool)

(declare-fun e!77934 () Unit!7299)

(declare-fun lt!183336 () Unit!7299)

(assert (=> b!118904 (= e!77934 lt!183336)))

(declare-fun lt!183353 () (_ BitVec 64))

(assert (=> b!118904 (= lt!183353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183338 () (_ BitVec 64))

(assert (=> b!118904 (= lt!183338 (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5323 array!5323 (_ BitVec 64) (_ BitVec 64)) Unit!7299)

(assert (=> b!118904 (= lt!183336 (arrayBitRangesEqSymmetric!0 (buf!2833 thiss!1305) (buf!2833 (_2!5239 lt!182528)) lt!183353 lt!183338))))

(declare-fun arrayBitRangesEq!0 (array!5323 array!5323 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118904 (arrayBitRangesEq!0 (buf!2833 (_2!5239 lt!182528)) (buf!2833 thiss!1305) lt!183353 lt!183338)))

(declare-fun b!118905 () Bool)

(declare-fun res!98408 () Bool)

(declare-fun e!77933 () Bool)

(assert (=> b!118905 (=> (not res!98408) (not e!77933))))

(declare-fun lt!183345 () tuple2!9954)

(assert (=> b!118905 (= res!98408 (isPrefixOf!0 (_2!5242 lt!183345) (_2!5239 lt!182528)))))

(declare-fun d!38054 () Bool)

(assert (=> d!38054 e!77933))

(declare-fun res!98409 () Bool)

(assert (=> d!38054 (=> (not res!98409) (not e!77933))))

(assert (=> d!38054 (= res!98409 (isPrefixOf!0 (_1!5242 lt!183345) (_2!5242 lt!183345)))))

(declare-fun lt!183343 () BitStream!4302)

(assert (=> d!38054 (= lt!183345 (tuple2!9955 lt!183343 (_2!5239 lt!182528)))))

(declare-fun lt!183341 () Unit!7299)

(declare-fun lt!183350 () Unit!7299)

(assert (=> d!38054 (= lt!183341 lt!183350)))

(assert (=> d!38054 (isPrefixOf!0 lt!183343 (_2!5239 lt!182528))))

(assert (=> d!38054 (= lt!183350 (lemmaIsPrefixTransitive!0 lt!183343 (_2!5239 lt!182528) (_2!5239 lt!182528)))))

(declare-fun lt!183349 () Unit!7299)

(declare-fun lt!183351 () Unit!7299)

(assert (=> d!38054 (= lt!183349 lt!183351)))

(assert (=> d!38054 (isPrefixOf!0 lt!183343 (_2!5239 lt!182528))))

(assert (=> d!38054 (= lt!183351 (lemmaIsPrefixTransitive!0 lt!183343 thiss!1305 (_2!5239 lt!182528)))))

(declare-fun lt!183348 () Unit!7299)

(assert (=> d!38054 (= lt!183348 e!77934)))

(declare-fun c!7143 () Bool)

(assert (=> d!38054 (= c!7143 (not (= (size!2414 (buf!2833 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!183339 () Unit!7299)

(declare-fun lt!183347 () Unit!7299)

(assert (=> d!38054 (= lt!183339 lt!183347)))

(assert (=> d!38054 (isPrefixOf!0 (_2!5239 lt!182528) (_2!5239 lt!182528))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4302) Unit!7299)

(assert (=> d!38054 (= lt!183347 (lemmaIsPrefixRefl!0 (_2!5239 lt!182528)))))

(declare-fun lt!183337 () Unit!7299)

(declare-fun lt!183354 () Unit!7299)

(assert (=> d!38054 (= lt!183337 lt!183354)))

(assert (=> d!38054 (= lt!183354 (lemmaIsPrefixRefl!0 (_2!5239 lt!182528)))))

(declare-fun lt!183344 () Unit!7299)

(declare-fun lt!183342 () Unit!7299)

(assert (=> d!38054 (= lt!183344 lt!183342)))

(assert (=> d!38054 (isPrefixOf!0 lt!183343 lt!183343)))

(assert (=> d!38054 (= lt!183342 (lemmaIsPrefixRefl!0 lt!183343))))

(declare-fun lt!183352 () Unit!7299)

(declare-fun lt!183355 () Unit!7299)

(assert (=> d!38054 (= lt!183352 lt!183355)))

(assert (=> d!38054 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38054 (= lt!183355 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38054 (= lt!183343 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(assert (=> d!38054 (isPrefixOf!0 thiss!1305 (_2!5239 lt!182528))))

(assert (=> d!38054 (= (reader!0 thiss!1305 (_2!5239 lt!182528)) lt!183345)))

(declare-fun b!118906 () Bool)

(declare-fun Unit!7319 () Unit!7299)

(assert (=> b!118906 (= e!77934 Unit!7319)))

(declare-fun lt!183346 () (_ BitVec 64))

(declare-fun lt!183340 () (_ BitVec 64))

(declare-fun b!118907 () Bool)

(assert (=> b!118907 (= e!77933 (= (_1!5242 lt!183345) (withMovedBitIndex!0 (_2!5242 lt!183345) (bvsub lt!183346 lt!183340))))))

(assert (=> b!118907 (or (= (bvand lt!183346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183346 lt!183340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118907 (= lt!183340 (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182528))) (currentByte!5488 (_2!5239 lt!182528)) (currentBit!5483 (_2!5239 lt!182528))))))

(assert (=> b!118907 (= lt!183346 (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(declare-fun b!118908 () Bool)

(declare-fun res!98410 () Bool)

(assert (=> b!118908 (=> (not res!98410) (not e!77933))))

(assert (=> b!118908 (= res!98410 (isPrefixOf!0 (_1!5242 lt!183345) thiss!1305))))

(assert (= (and d!38054 c!7143) b!118904))

(assert (= (and d!38054 (not c!7143)) b!118906))

(assert (= (and d!38054 res!98409) b!118908))

(assert (= (and b!118908 res!98410) b!118905))

(assert (= (and b!118905 res!98408) b!118907))

(declare-fun m!178827 () Bool)

(assert (=> d!38054 m!178827))

(assert (=> d!38054 m!178259))

(declare-fun m!178829 () Bool)

(assert (=> d!38054 m!178829))

(declare-fun m!178831 () Bool)

(assert (=> d!38054 m!178831))

(declare-fun m!178833 () Bool)

(assert (=> d!38054 m!178833))

(declare-fun m!178835 () Bool)

(assert (=> d!38054 m!178835))

(declare-fun m!178837 () Bool)

(assert (=> d!38054 m!178837))

(declare-fun m!178839 () Bool)

(assert (=> d!38054 m!178839))

(declare-fun m!178841 () Bool)

(assert (=> d!38054 m!178841))

(declare-fun m!178843 () Bool)

(assert (=> d!38054 m!178843))

(declare-fun m!178845 () Bool)

(assert (=> d!38054 m!178845))

(assert (=> b!118904 m!178277))

(declare-fun m!178847 () Bool)

(assert (=> b!118904 m!178847))

(declare-fun m!178849 () Bool)

(assert (=> b!118904 m!178849))

(declare-fun m!178851 () Bool)

(assert (=> b!118907 m!178851))

(assert (=> b!118907 m!178281))

(assert (=> b!118907 m!178277))

(declare-fun m!178853 () Bool)

(assert (=> b!118908 m!178853))

(declare-fun m!178855 () Bool)

(assert (=> b!118905 m!178855))

(assert (=> b!118628 d!38054))

(declare-fun d!38056 () Bool)

(declare-fun res!98418 () Bool)

(declare-fun e!77939 () Bool)

(assert (=> d!38056 (=> (not res!98418) (not e!77939))))

(assert (=> d!38056 (= res!98418 (= (size!2414 (buf!2833 thiss!1305)) (size!2414 (buf!2833 (_2!5239 lt!182528)))))))

(assert (=> d!38056 (= (isPrefixOf!0 thiss!1305 (_2!5239 lt!182528)) e!77939)))

(declare-fun b!118915 () Bool)

(declare-fun res!98417 () Bool)

(assert (=> b!118915 (=> (not res!98417) (not e!77939))))

(assert (=> b!118915 (= res!98417 (bvsle (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)) (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182528))) (currentByte!5488 (_2!5239 lt!182528)) (currentBit!5483 (_2!5239 lt!182528)))))))

(declare-fun b!118916 () Bool)

(declare-fun e!77940 () Bool)

(assert (=> b!118916 (= e!77939 e!77940)))

(declare-fun res!98419 () Bool)

(assert (=> b!118916 (=> res!98419 e!77940)))

(assert (=> b!118916 (= res!98419 (= (size!2414 (buf!2833 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118917 () Bool)

(assert (=> b!118917 (= e!77940 (arrayBitRangesEq!0 (buf!2833 thiss!1305) (buf!2833 (_2!5239 lt!182528)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305))))))

(assert (= (and d!38056 res!98418) b!118915))

(assert (= (and b!118915 res!98417) b!118916))

(assert (= (and b!118916 (not res!98419)) b!118917))

(assert (=> b!118915 m!178277))

(assert (=> b!118915 m!178281))

(assert (=> b!118917 m!178277))

(assert (=> b!118917 m!178277))

(declare-fun m!178857 () Bool)

(assert (=> b!118917 m!178857))

(assert (=> b!118628 d!38056))

(declare-fun d!38058 () Bool)

(declare-datatypes ((tuple2!9972 0))(
  ( (tuple2!9973 (_1!5251 Bool) (_2!5251 BitStream!4302)) )
))
(declare-fun lt!183358 () tuple2!9972)

(declare-fun readBit!0 (BitStream!4302) tuple2!9972)

(assert (=> d!38058 (= lt!183358 (readBit!0 (_1!5242 lt!182539)))))

(assert (=> d!38058 (= (readBitPure!0 (_1!5242 lt!182539)) (tuple2!9951 (_2!5251 lt!183358) (_1!5251 lt!183358)))))

(declare-fun bs!9210 () Bool)

(assert (= bs!9210 d!38058))

(declare-fun m!178859 () Bool)

(assert (=> bs!9210 m!178859))

(assert (=> b!118628 d!38058))

(declare-fun d!38060 () Bool)

(assert (=> d!38060 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540))) lt!182549)))

(declare-fun lt!183361 () Unit!7299)

(declare-fun choose!9 (BitStream!4302 array!5323 (_ BitVec 64) BitStream!4302) Unit!7299)

(assert (=> d!38060 (= lt!183361 (choose!9 (_2!5239 lt!182540) (buf!2833 (_2!5239 lt!182528)) lt!182549 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540)))))))

(assert (=> d!38060 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5239 lt!182540) (buf!2833 (_2!5239 lt!182528)) lt!182549) lt!183361)))

(declare-fun bs!9211 () Bool)

(assert (= bs!9211 d!38060))

(assert (=> bs!9211 m!178267))

(declare-fun m!178861 () Bool)

(assert (=> bs!9211 m!178861))

(assert (=> b!118628 d!38060))

(declare-fun d!38062 () Bool)

(declare-fun e!77943 () Bool)

(assert (=> d!38062 e!77943))

(declare-fun res!98425 () Bool)

(assert (=> d!38062 (=> (not res!98425) (not e!77943))))

(declare-fun lt!183378 () (_ BitVec 64))

(declare-fun lt!183374 () (_ BitVec 64))

(declare-fun lt!183375 () (_ BitVec 64))

(assert (=> d!38062 (= res!98425 (= lt!183378 (bvsub lt!183375 lt!183374)))))

(assert (=> d!38062 (or (= (bvand lt!183375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183375 lt!183374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38062 (= lt!183374 (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182541)))) ((_ sign_extend 32) (currentByte!5488 (_1!5240 lt!182541))) ((_ sign_extend 32) (currentBit!5483 (_1!5240 lt!182541)))))))

(declare-fun lt!183377 () (_ BitVec 64))

(declare-fun lt!183379 () (_ BitVec 64))

(assert (=> d!38062 (= lt!183375 (bvmul lt!183377 lt!183379))))

(assert (=> d!38062 (or (= lt!183377 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183379 (bvsdiv (bvmul lt!183377 lt!183379) lt!183377)))))

(assert (=> d!38062 (= lt!183379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38062 (= lt!183377 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182541)))))))

(assert (=> d!38062 (= lt!183378 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5488 (_1!5240 lt!182541))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5483 (_1!5240 lt!182541)))))))

(assert (=> d!38062 (invariant!0 (currentBit!5483 (_1!5240 lt!182541)) (currentByte!5488 (_1!5240 lt!182541)) (size!2414 (buf!2833 (_1!5240 lt!182541))))))

(assert (=> d!38062 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!182541))) (currentByte!5488 (_1!5240 lt!182541)) (currentBit!5483 (_1!5240 lt!182541))) lt!183378)))

(declare-fun b!118922 () Bool)

(declare-fun res!98424 () Bool)

(assert (=> b!118922 (=> (not res!98424) (not e!77943))))

(assert (=> b!118922 (= res!98424 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183378))))

(declare-fun b!118923 () Bool)

(declare-fun lt!183376 () (_ BitVec 64))

(assert (=> b!118923 (= e!77943 (bvsle lt!183378 (bvmul lt!183376 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118923 (or (= lt!183376 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183376 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183376)))))

(assert (=> b!118923 (= lt!183376 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182541)))))))

(assert (= (and d!38062 res!98425) b!118922))

(assert (= (and b!118922 res!98424) b!118923))

(declare-fun m!178863 () Bool)

(assert (=> d!38062 m!178863))

(declare-fun m!178865 () Bool)

(assert (=> d!38062 m!178865))

(assert (=> b!118628 d!38062))

(declare-fun d!38064 () Bool)

(assert (=> d!38064 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305)) lt!182542)))

(declare-fun lt!183380 () Unit!7299)

(assert (=> d!38064 (= lt!183380 (choose!9 thiss!1305 (buf!2833 (_2!5239 lt!182528)) lt!182542 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305))))))

(assert (=> d!38064 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2833 (_2!5239 lt!182528)) lt!182542) lt!183380)))

(declare-fun bs!9212 () Bool)

(assert (= bs!9212 d!38064))

(assert (=> bs!9212 m!178245))

(declare-fun m!178867 () Bool)

(assert (=> bs!9212 m!178867))

(assert (=> b!118628 d!38064))

(declare-fun d!38066 () Bool)

(declare-fun e!77946 () Bool)

(assert (=> d!38066 e!77946))

(declare-fun res!98428 () Bool)

(assert (=> d!38066 (=> (not res!98428) (not e!77946))))

(declare-fun lt!183391 () tuple2!9950)

(declare-fun lt!183390 () tuple2!9950)

(assert (=> d!38066 (= res!98428 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!183391))) (currentByte!5488 (_1!5240 lt!183391)) (currentBit!5483 (_1!5240 lt!183391))) (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!183390))) (currentByte!5488 (_1!5240 lt!183390)) (currentBit!5483 (_1!5240 lt!183390)))))))

(declare-fun lt!183389 () BitStream!4302)

(declare-fun lt!183392 () Unit!7299)

(declare-fun choose!50 (BitStream!4302 BitStream!4302 BitStream!4302 tuple2!9950 tuple2!9950 BitStream!4302 Bool tuple2!9950 tuple2!9950 BitStream!4302 Bool) Unit!7299)

(assert (=> d!38066 (= lt!183392 (choose!50 lt!182548 (_2!5239 lt!182528) lt!183389 lt!183391 (tuple2!9951 (_1!5240 lt!183391) (_2!5240 lt!183391)) (_1!5240 lt!183391) (_2!5240 lt!183391) lt!183390 (tuple2!9951 (_1!5240 lt!183390) (_2!5240 lt!183390)) (_1!5240 lt!183390) (_2!5240 lt!183390)))))

(assert (=> d!38066 (= lt!183390 (readBitPure!0 lt!183389))))

(assert (=> d!38066 (= lt!183391 (readBitPure!0 lt!182548))))

(assert (=> d!38066 (= lt!183389 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 lt!182548) (currentBit!5483 lt!182548)))))

(assert (=> d!38066 (invariant!0 (currentBit!5483 lt!182548) (currentByte!5488 lt!182548) (size!2414 (buf!2833 (_2!5239 lt!182528))))))

(assert (=> d!38066 (= (readBitPrefixLemma!0 lt!182548 (_2!5239 lt!182528)) lt!183392)))

(declare-fun b!118926 () Bool)

(assert (=> b!118926 (= e!77946 (= (_2!5240 lt!183391) (_2!5240 lt!183390)))))

(assert (= (and d!38066 res!98428) b!118926))

(declare-fun m!178869 () Bool)

(assert (=> d!38066 m!178869))

(declare-fun m!178871 () Bool)

(assert (=> d!38066 m!178871))

(assert (=> d!38066 m!178271))

(declare-fun m!178873 () Bool)

(assert (=> d!38066 m!178873))

(declare-fun m!178875 () Bool)

(assert (=> d!38066 m!178875))

(declare-fun m!178877 () Bool)

(assert (=> d!38066 m!178877))

(assert (=> b!118628 d!38066))

(declare-fun d!38068 () Bool)

(assert (=> d!38068 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540))) lt!182549) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540)))) lt!182549))))

(declare-fun bs!9213 () Bool)

(assert (= bs!9213 d!38068))

(declare-fun m!178879 () Bool)

(assert (=> bs!9213 m!178879))

(assert (=> b!118628 d!38068))

(declare-fun d!38070 () Bool)

(declare-datatypes ((tuple2!9974 0))(
  ( (tuple2!9975 (_1!5252 (_ BitVec 64)) (_2!5252 BitStream!4302)) )
))
(declare-fun lt!183395 () tuple2!9974)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9974)

(assert (=> d!38070 (= lt!183395 (readNLeastSignificantBitsLoop!0 (_1!5242 lt!182539) nBits!396 i!615 lt!182529))))

(assert (=> d!38070 (= (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!182539) nBits!396 i!615 lt!182529) (tuple2!9953 (_2!5252 lt!183395) (_1!5252 lt!183395)))))

(declare-fun bs!9214 () Bool)

(assert (= bs!9214 d!38070))

(declare-fun m!178881 () Bool)

(assert (=> bs!9214 m!178881))

(assert (=> b!118628 d!38070))

(declare-fun d!38072 () Bool)

(declare-fun e!77947 () Bool)

(assert (=> d!38072 e!77947))

(declare-fun res!98430 () Bool)

(assert (=> d!38072 (=> (not res!98430) (not e!77947))))

(declare-fun lt!183397 () (_ BitVec 64))

(declare-fun lt!183396 () (_ BitVec 64))

(declare-fun lt!183400 () (_ BitVec 64))

(assert (=> d!38072 (= res!98430 (= lt!183400 (bvsub lt!183397 lt!183396)))))

(assert (=> d!38072 (or (= (bvand lt!183397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183397 lt!183396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38072 (= lt!183396 (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182537)))) ((_ sign_extend 32) (currentByte!5488 (_1!5240 lt!182537))) ((_ sign_extend 32) (currentBit!5483 (_1!5240 lt!182537)))))))

(declare-fun lt!183399 () (_ BitVec 64))

(declare-fun lt!183401 () (_ BitVec 64))

(assert (=> d!38072 (= lt!183397 (bvmul lt!183399 lt!183401))))

(assert (=> d!38072 (or (= lt!183399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183401 (bvsdiv (bvmul lt!183399 lt!183401) lt!183399)))))

(assert (=> d!38072 (= lt!183401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38072 (= lt!183399 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182537)))))))

(assert (=> d!38072 (= lt!183400 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5488 (_1!5240 lt!182537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5483 (_1!5240 lt!182537)))))))

(assert (=> d!38072 (invariant!0 (currentBit!5483 (_1!5240 lt!182537)) (currentByte!5488 (_1!5240 lt!182537)) (size!2414 (buf!2833 (_1!5240 lt!182537))))))

(assert (=> d!38072 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!182537))) (currentByte!5488 (_1!5240 lt!182537)) (currentBit!5483 (_1!5240 lt!182537))) lt!183400)))

(declare-fun b!118927 () Bool)

(declare-fun res!98429 () Bool)

(assert (=> b!118927 (=> (not res!98429) (not e!77947))))

(assert (=> b!118927 (= res!98429 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183400))))

(declare-fun b!118928 () Bool)

(declare-fun lt!183398 () (_ BitVec 64))

(assert (=> b!118928 (= e!77947 (bvsle lt!183400 (bvmul lt!183398 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118928 (or (= lt!183398 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183398 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183398)))))

(assert (=> b!118928 (= lt!183398 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182537)))))))

(assert (= (and d!38072 res!98430) b!118927))

(assert (= (and b!118927 res!98429) b!118928))

(declare-fun m!178883 () Bool)

(assert (=> d!38072 m!178883))

(declare-fun m!178885 () Bool)

(assert (=> d!38072 m!178885))

(assert (=> b!118628 d!38072))

(declare-fun b!118929 () Bool)

(declare-fun e!77949 () Unit!7299)

(declare-fun lt!183402 () Unit!7299)

(assert (=> b!118929 (= e!77949 lt!183402)))

(declare-fun lt!183419 () (_ BitVec 64))

(assert (=> b!118929 (= lt!183419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183404 () (_ BitVec 64))

(assert (=> b!118929 (= lt!183404 (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))))))

(assert (=> b!118929 (= lt!183402 (arrayBitRangesEqSymmetric!0 (buf!2833 (_2!5239 lt!182540)) (buf!2833 (_2!5239 lt!182528)) lt!183419 lt!183404))))

(assert (=> b!118929 (arrayBitRangesEq!0 (buf!2833 (_2!5239 lt!182528)) (buf!2833 (_2!5239 lt!182540)) lt!183419 lt!183404)))

(declare-fun b!118930 () Bool)

(declare-fun res!98431 () Bool)

(declare-fun e!77948 () Bool)

(assert (=> b!118930 (=> (not res!98431) (not e!77948))))

(declare-fun lt!183411 () tuple2!9954)

(assert (=> b!118930 (= res!98431 (isPrefixOf!0 (_2!5242 lt!183411) (_2!5239 lt!182528)))))

(declare-fun d!38074 () Bool)

(assert (=> d!38074 e!77948))

(declare-fun res!98432 () Bool)

(assert (=> d!38074 (=> (not res!98432) (not e!77948))))

(assert (=> d!38074 (= res!98432 (isPrefixOf!0 (_1!5242 lt!183411) (_2!5242 lt!183411)))))

(declare-fun lt!183409 () BitStream!4302)

(assert (=> d!38074 (= lt!183411 (tuple2!9955 lt!183409 (_2!5239 lt!182528)))))

(declare-fun lt!183407 () Unit!7299)

(declare-fun lt!183416 () Unit!7299)

(assert (=> d!38074 (= lt!183407 lt!183416)))

(assert (=> d!38074 (isPrefixOf!0 lt!183409 (_2!5239 lt!182528))))

(assert (=> d!38074 (= lt!183416 (lemmaIsPrefixTransitive!0 lt!183409 (_2!5239 lt!182528) (_2!5239 lt!182528)))))

(declare-fun lt!183415 () Unit!7299)

(declare-fun lt!183417 () Unit!7299)

(assert (=> d!38074 (= lt!183415 lt!183417)))

(assert (=> d!38074 (isPrefixOf!0 lt!183409 (_2!5239 lt!182528))))

(assert (=> d!38074 (= lt!183417 (lemmaIsPrefixTransitive!0 lt!183409 (_2!5239 lt!182540) (_2!5239 lt!182528)))))

(declare-fun lt!183414 () Unit!7299)

(assert (=> d!38074 (= lt!183414 e!77949)))

(declare-fun c!7144 () Bool)

(assert (=> d!38074 (= c!7144 (not (= (size!2414 (buf!2833 (_2!5239 lt!182540))) #b00000000000000000000000000000000)))))

(declare-fun lt!183405 () Unit!7299)

(declare-fun lt!183413 () Unit!7299)

(assert (=> d!38074 (= lt!183405 lt!183413)))

(assert (=> d!38074 (isPrefixOf!0 (_2!5239 lt!182528) (_2!5239 lt!182528))))

(assert (=> d!38074 (= lt!183413 (lemmaIsPrefixRefl!0 (_2!5239 lt!182528)))))

(declare-fun lt!183403 () Unit!7299)

(declare-fun lt!183420 () Unit!7299)

(assert (=> d!38074 (= lt!183403 lt!183420)))

(assert (=> d!38074 (= lt!183420 (lemmaIsPrefixRefl!0 (_2!5239 lt!182528)))))

(declare-fun lt!183410 () Unit!7299)

(declare-fun lt!183408 () Unit!7299)

(assert (=> d!38074 (= lt!183410 lt!183408)))

(assert (=> d!38074 (isPrefixOf!0 lt!183409 lt!183409)))

(assert (=> d!38074 (= lt!183408 (lemmaIsPrefixRefl!0 lt!183409))))

(declare-fun lt!183418 () Unit!7299)

(declare-fun lt!183421 () Unit!7299)

(assert (=> d!38074 (= lt!183418 lt!183421)))

(assert (=> d!38074 (isPrefixOf!0 (_2!5239 lt!182540) (_2!5239 lt!182540))))

(assert (=> d!38074 (= lt!183421 (lemmaIsPrefixRefl!0 (_2!5239 lt!182540)))))

(assert (=> d!38074 (= lt!183409 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))))))

(assert (=> d!38074 (isPrefixOf!0 (_2!5239 lt!182540) (_2!5239 lt!182528))))

(assert (=> d!38074 (= (reader!0 (_2!5239 lt!182540) (_2!5239 lt!182528)) lt!183411)))

(declare-fun b!118931 () Bool)

(declare-fun Unit!7320 () Unit!7299)

(assert (=> b!118931 (= e!77949 Unit!7320)))

(declare-fun b!118932 () Bool)

(declare-fun lt!183406 () (_ BitVec 64))

(declare-fun lt!183412 () (_ BitVec 64))

(assert (=> b!118932 (= e!77948 (= (_1!5242 lt!183411) (withMovedBitIndex!0 (_2!5242 lt!183411) (bvsub lt!183412 lt!183406))))))

(assert (=> b!118932 (or (= (bvand lt!183412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183412 lt!183406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118932 (= lt!183406 (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182528))) (currentByte!5488 (_2!5239 lt!182528)) (currentBit!5483 (_2!5239 lt!182528))))))

(assert (=> b!118932 (= lt!183412 (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))))))

(declare-fun b!118933 () Bool)

(declare-fun res!98433 () Bool)

(assert (=> b!118933 (=> (not res!98433) (not e!77948))))

(assert (=> b!118933 (= res!98433 (isPrefixOf!0 (_1!5242 lt!183411) (_2!5239 lt!182540)))))

(assert (= (and d!38074 c!7144) b!118929))

(assert (= (and d!38074 (not c!7144)) b!118931))

(assert (= (and d!38074 res!98432) b!118933))

(assert (= (and b!118933 res!98433) b!118930))

(assert (= (and b!118930 res!98431) b!118932))

(declare-fun m!178887 () Bool)

(assert (=> d!38074 m!178887))

(declare-fun m!178889 () Bool)

(assert (=> d!38074 m!178889))

(declare-fun m!178891 () Bool)

(assert (=> d!38074 m!178891))

(assert (=> d!38074 m!178831))

(declare-fun m!178893 () Bool)

(assert (=> d!38074 m!178893))

(declare-fun m!178895 () Bool)

(assert (=> d!38074 m!178895))

(declare-fun m!178897 () Bool)

(assert (=> d!38074 m!178897))

(assert (=> d!38074 m!178839))

(declare-fun m!178899 () Bool)

(assert (=> d!38074 m!178899))

(declare-fun m!178901 () Bool)

(assert (=> d!38074 m!178901))

(declare-fun m!178903 () Bool)

(assert (=> d!38074 m!178903))

(assert (=> b!118929 m!178291))

(declare-fun m!178905 () Bool)

(assert (=> b!118929 m!178905))

(declare-fun m!178907 () Bool)

(assert (=> b!118929 m!178907))

(declare-fun m!178909 () Bool)

(assert (=> b!118932 m!178909))

(assert (=> b!118932 m!178281))

(assert (=> b!118932 m!178291))

(declare-fun m!178911 () Bool)

(assert (=> b!118933 m!178911))

(declare-fun m!178913 () Bool)

(assert (=> b!118930 m!178913))

(assert (=> b!118628 d!38074))

(declare-fun d!38076 () Bool)

(declare-fun lt!183422 () tuple2!9972)

(assert (=> d!38076 (= lt!183422 (readBit!0 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305))))))

(assert (=> d!38076 (= (readBitPure!0 (BitStream!4303 (buf!2833 (_2!5239 lt!182528)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305))) (tuple2!9951 (_2!5251 lt!183422) (_1!5251 lt!183422)))))

(declare-fun bs!9215 () Bool)

(assert (= bs!9215 d!38076))

(declare-fun m!178915 () Bool)

(assert (=> bs!9215 m!178915))

(assert (=> b!118628 d!38076))

(declare-fun call!1544 () Bool)

(declare-fun lt!183520 () BitStream!4302)

(declare-fun c!7150 () Bool)

(declare-fun bm!1541 () Bool)

(declare-fun lt!183533 () tuple2!9948)

(assert (=> bm!1541 (= call!1544 (isPrefixOf!0 (ite c!7150 (_2!5239 lt!182540) lt!183520) (ite c!7150 (_2!5239 lt!183533) lt!183520)))))

(declare-fun b!118960 () Bool)

(declare-fun e!77968 () (_ BitVec 64))

(assert (=> b!118960 (= e!77968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!118961 () Bool)

(declare-fun res!98455 () Bool)

(assert (=> b!118961 (= res!98455 call!1544)))

(declare-fun e!77967 () Bool)

(assert (=> b!118961 (=> (not res!98455) (not e!77967))))

(declare-fun b!118962 () Bool)

(declare-fun e!77964 () Bool)

(declare-fun lt!183527 () tuple2!9952)

(declare-fun lt!183548 () tuple2!9954)

(assert (=> b!118962 (= e!77964 (and (= (_2!5241 lt!183527) v!199) (= (_1!5241 lt!183527) (_2!5242 lt!183548))))))

(declare-fun lt!183528 () (_ BitVec 64))

(assert (=> b!118962 (= lt!183527 (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!183548) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183528))))

(declare-fun lt!183555 () Unit!7299)

(declare-fun lt!183551 () Unit!7299)

(assert (=> b!118962 (= lt!183555 lt!183551)))

(declare-fun lt!183521 () tuple2!9948)

(declare-fun lt!183525 () (_ BitVec 64))

(assert (=> b!118962 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!183521)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540))) lt!183525)))

(assert (=> b!118962 (= lt!183551 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5239 lt!182540) (buf!2833 (_2!5239 lt!183521)) lt!183525))))

(declare-fun e!77965 () Bool)

(assert (=> b!118962 e!77965))

(declare-fun res!98454 () Bool)

(assert (=> b!118962 (=> (not res!98454) (not e!77965))))

(assert (=> b!118962 (= res!98454 (and (= (size!2414 (buf!2833 (_2!5239 lt!182540))) (size!2414 (buf!2833 (_2!5239 lt!183521)))) (bvsge lt!183525 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118962 (= lt!183525 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118962 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118962 (= lt!183528 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!118962 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118962 (= lt!183548 (reader!0 (_2!5239 lt!182540) (_2!5239 lt!183521)))))

(declare-fun b!118963 () Bool)

(assert (=> b!118963 (= e!77965 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182540)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540))) lt!183525))))

(declare-fun b!118964 () Bool)

(declare-fun e!77969 () Bool)

(declare-fun lt!183554 () tuple2!9950)

(assert (=> b!118964 (= e!77969 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!183554))) (currentByte!5488 (_1!5240 lt!183554)) (currentBit!5483 (_1!5240 lt!183554))) (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183533))) (currentByte!5488 (_2!5239 lt!183533)) (currentBit!5483 (_2!5239 lt!183533)))))))

(declare-fun d!38078 () Bool)

(assert (=> d!38078 e!77964))

(declare-fun res!98457 () Bool)

(assert (=> d!38078 (=> (not res!98457) (not e!77964))))

(assert (=> d!38078 (= res!98457 (= (size!2414 (buf!2833 (_2!5239 lt!182540))) (size!2414 (buf!2833 (_2!5239 lt!183521)))))))

(declare-fun e!77970 () tuple2!9948)

(assert (=> d!38078 (= lt!183521 e!77970)))

(assert (=> d!38078 (= c!7150 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38078 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38078 (= (appendNLeastSignificantBitsLoop!0 (_2!5239 lt!182540) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!183521)))

(declare-fun b!118965 () Bool)

(declare-fun res!98456 () Bool)

(assert (=> b!118965 (=> (not res!98456) (not e!77964))))

(declare-fun lt!183524 () (_ BitVec 64))

(declare-fun lt!183514 () (_ BitVec 64))

(assert (=> b!118965 (= res!98456 (= (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183521))) (currentByte!5488 (_2!5239 lt!183521)) (currentBit!5483 (_2!5239 lt!183521))) (bvadd lt!183524 lt!183514)))))

(assert (=> b!118965 (or (not (= (bvand lt!183524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183514 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183524 lt!183514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118965 (= lt!183514 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118965 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118965 (= lt!183524 (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))))))

(declare-fun b!118966 () Bool)

(assert (=> b!118966 (= lt!183554 (readBitPure!0 (readerFrom!0 (_2!5239 lt!183533) (currentBit!5483 (_2!5239 lt!182540)) (currentByte!5488 (_2!5239 lt!182540)))))))

(declare-fun lt!183556 () Bool)

(declare-fun res!98458 () Bool)

(assert (=> b!118966 (= res!98458 (and (= (_2!5240 lt!183554) lt!183556) (= (_1!5240 lt!183554) (_2!5239 lt!183533))))))

(assert (=> b!118966 (=> (not res!98458) (not e!77969))))

(assert (=> b!118966 (= e!77967 e!77969)))

(declare-fun b!118967 () Bool)

(declare-fun e!77966 () Bool)

(declare-fun lt!183540 () tuple2!9950)

(declare-fun lt!183535 () tuple2!9950)

(assert (=> b!118967 (= e!77966 (= (_2!5240 lt!183540) (_2!5240 lt!183535)))))

(declare-fun b!118968 () Bool)

(declare-fun res!98452 () Bool)

(assert (=> b!118968 (=> (not res!98452) (not e!77964))))

(assert (=> b!118968 (= res!98452 (isPrefixOf!0 (_2!5239 lt!182540) (_2!5239 lt!183521)))))

(declare-fun b!118969 () Bool)

(declare-fun lt!183513 () tuple2!9948)

(declare-fun Unit!7321 () Unit!7299)

(assert (=> b!118969 (= e!77970 (tuple2!9949 Unit!7321 (_2!5239 lt!183513)))))

(assert (=> b!118969 (= lt!183556 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118969 (= lt!183533 (appendBit!0 (_2!5239 lt!182540) lt!183556))))

(declare-fun res!98459 () Bool)

(assert (=> b!118969 (= res!98459 (= (size!2414 (buf!2833 (_2!5239 lt!182540))) (size!2414 (buf!2833 (_2!5239 lt!183533)))))))

(assert (=> b!118969 (=> (not res!98459) (not e!77967))))

(assert (=> b!118969 e!77967))

(declare-fun lt!183557 () tuple2!9948)

(assert (=> b!118969 (= lt!183557 lt!183533)))

(assert (=> b!118969 (= lt!183513 (appendNLeastSignificantBitsLoop!0 (_2!5239 lt!183557) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!183553 () Unit!7299)

(assert (=> b!118969 (= lt!183553 (lemmaIsPrefixTransitive!0 (_2!5239 lt!182540) (_2!5239 lt!183557) (_2!5239 lt!183513)))))

(assert (=> b!118969 (isPrefixOf!0 (_2!5239 lt!182540) (_2!5239 lt!183513))))

(declare-fun lt!183516 () Unit!7299)

(assert (=> b!118969 (= lt!183516 lt!183553)))

(assert (=> b!118969 (invariant!0 (currentBit!5483 (_2!5239 lt!182540)) (currentByte!5488 (_2!5239 lt!182540)) (size!2414 (buf!2833 (_2!5239 lt!183557))))))

(declare-fun lt!183523 () BitStream!4302)

(assert (=> b!118969 (= lt!183523 (BitStream!4303 (buf!2833 (_2!5239 lt!183557)) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))))))

(assert (=> b!118969 (invariant!0 (currentBit!5483 lt!183523) (currentByte!5488 lt!183523) (size!2414 (buf!2833 (_2!5239 lt!183513))))))

(declare-fun lt!183541 () BitStream!4302)

(assert (=> b!118969 (= lt!183541 (BitStream!4303 (buf!2833 (_2!5239 lt!183513)) (currentByte!5488 lt!183523) (currentBit!5483 lt!183523)))))

(assert (=> b!118969 (= lt!183540 (readBitPure!0 lt!183523))))

(assert (=> b!118969 (= lt!183535 (readBitPure!0 lt!183541))))

(declare-fun lt!183519 () Unit!7299)

(assert (=> b!118969 (= lt!183519 (readBitPrefixLemma!0 lt!183523 (_2!5239 lt!183513)))))

(declare-fun res!98453 () Bool)

(assert (=> b!118969 (= res!98453 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!183540))) (currentByte!5488 (_1!5240 lt!183540)) (currentBit!5483 (_1!5240 lt!183540))) (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!183535))) (currentByte!5488 (_1!5240 lt!183535)) (currentBit!5483 (_1!5240 lt!183535)))))))

(assert (=> b!118969 (=> (not res!98453) (not e!77966))))

(assert (=> b!118969 e!77966))

(declare-fun lt!183537 () Unit!7299)

(assert (=> b!118969 (= lt!183537 lt!183519)))

(declare-fun lt!183550 () tuple2!9954)

(assert (=> b!118969 (= lt!183550 (reader!0 (_2!5239 lt!182540) (_2!5239 lt!183513)))))

(declare-fun lt!183526 () tuple2!9954)

(assert (=> b!118969 (= lt!183526 (reader!0 (_2!5239 lt!183557) (_2!5239 lt!183513)))))

(declare-fun lt!183529 () tuple2!9950)

(assert (=> b!118969 (= lt!183529 (readBitPure!0 (_1!5242 lt!183550)))))

(assert (=> b!118969 (= (_2!5240 lt!183529) lt!183556)))

(declare-fun lt!183530 () Unit!7299)

(declare-fun Unit!7322 () Unit!7299)

(assert (=> b!118969 (= lt!183530 Unit!7322)))

(declare-fun lt!183536 () (_ BitVec 64))

(assert (=> b!118969 (= lt!183536 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!183552 () (_ BitVec 64))

(assert (=> b!118969 (= lt!183552 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!183532 () Unit!7299)

(assert (=> b!118969 (= lt!183532 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5239 lt!182540) (buf!2833 (_2!5239 lt!183513)) lt!183552))))

(assert (=> b!118969 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!183513)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540))) lt!183552)))

(declare-fun lt!183517 () Unit!7299)

(assert (=> b!118969 (= lt!183517 lt!183532)))

(declare-fun lt!183531 () tuple2!9952)

(assert (=> b!118969 (= lt!183531 (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!183550) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183536))))

(declare-fun lt!183534 () (_ BitVec 64))

(assert (=> b!118969 (= lt!183534 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!183518 () Unit!7299)

(assert (=> b!118969 (= lt!183518 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5239 lt!183557) (buf!2833 (_2!5239 lt!183513)) lt!183534))))

(assert (=> b!118969 (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!183513)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!183557))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!183557))) lt!183534)))

(declare-fun lt!183522 () Unit!7299)

(assert (=> b!118969 (= lt!183522 lt!183518)))

(declare-fun lt!183549 () tuple2!9952)

(assert (=> b!118969 (= lt!183549 (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!183526) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!183536 (ite (_2!5240 lt!183529) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!183515 () tuple2!9952)

(assert (=> b!118969 (= lt!183515 (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!183550) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183536))))

(declare-fun c!7149 () Bool)

(assert (=> b!118969 (= c!7149 (_2!5240 (readBitPure!0 (_1!5242 lt!183550))))))

(declare-fun lt!183546 () tuple2!9952)

(assert (=> b!118969 (= lt!183546 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5242 lt!183550) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!183536 e!77968)))))

(declare-fun lt!183543 () Unit!7299)

(assert (=> b!118969 (= lt!183543 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5242 lt!183550) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183536))))

(assert (=> b!118969 (and (= (_2!5241 lt!183515) (_2!5241 lt!183546)) (= (_1!5241 lt!183515) (_1!5241 lt!183546)))))

(declare-fun lt!183539 () Unit!7299)

(assert (=> b!118969 (= lt!183539 lt!183543)))

(assert (=> b!118969 (= (_1!5242 lt!183550) (withMovedBitIndex!0 (_2!5242 lt!183550) (bvsub (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))) (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183513))) (currentByte!5488 (_2!5239 lt!183513)) (currentBit!5483 (_2!5239 lt!183513))))))))

(declare-fun lt!183547 () Unit!7299)

(declare-fun Unit!7323 () Unit!7299)

(assert (=> b!118969 (= lt!183547 Unit!7323)))

(assert (=> b!118969 (= (_1!5242 lt!183526) (withMovedBitIndex!0 (_2!5242 lt!183526) (bvsub (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183557))) (currentByte!5488 (_2!5239 lt!183557)) (currentBit!5483 (_2!5239 lt!183557))) (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183513))) (currentByte!5488 (_2!5239 lt!183513)) (currentBit!5483 (_2!5239 lt!183513))))))))

(declare-fun lt!183542 () Unit!7299)

(declare-fun Unit!7324 () Unit!7299)

(assert (=> b!118969 (= lt!183542 Unit!7324)))

(assert (=> b!118969 (= (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))) (bvsub (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183557))) (currentByte!5488 (_2!5239 lt!183557)) (currentBit!5483 (_2!5239 lt!183557))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!183545 () Unit!7299)

(declare-fun Unit!7325 () Unit!7299)

(assert (=> b!118969 (= lt!183545 Unit!7325)))

(assert (=> b!118969 (= (_2!5241 lt!183531) (_2!5241 lt!183549))))

(declare-fun lt!183538 () Unit!7299)

(declare-fun Unit!7326 () Unit!7299)

(assert (=> b!118969 (= lt!183538 Unit!7326)))

(assert (=> b!118969 (= (_1!5241 lt!183531) (_2!5242 lt!183550))))

(declare-fun b!118970 () Bool)

(assert (=> b!118970 (= e!77968 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!118971 () Bool)

(declare-fun lt!183544 () Unit!7299)

(assert (=> b!118971 (= e!77970 (tuple2!9949 lt!183544 (_2!5239 lt!182540)))))

(assert (=> b!118971 (= lt!183520 (_2!5239 lt!182540))))

(assert (=> b!118971 (= lt!183544 (lemmaIsPrefixRefl!0 lt!183520))))

(assert (=> b!118971 call!1544))

(declare-fun b!118972 () Bool)

(declare-fun res!98460 () Bool)

(assert (=> b!118972 (= res!98460 (= (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183533))) (currentByte!5488 (_2!5239 lt!183533)) (currentBit!5483 (_2!5239 lt!183533))) (bvadd (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!118972 (=> (not res!98460) (not e!77967))))

(assert (= (and d!38078 c!7150) b!118969))

(assert (= (and d!38078 (not c!7150)) b!118971))

(assert (= (and b!118969 res!98459) b!118972))

(assert (= (and b!118972 res!98460) b!118961))

(assert (= (and b!118961 res!98455) b!118966))

(assert (= (and b!118966 res!98458) b!118964))

(assert (= (and b!118969 res!98453) b!118967))

(assert (= (and b!118969 c!7149) b!118970))

(assert (= (and b!118969 (not c!7149)) b!118960))

(assert (= (or b!118961 b!118971) bm!1541))

(assert (= (and d!38078 res!98457) b!118965))

(assert (= (and b!118965 res!98456) b!118968))

(assert (= (and b!118968 res!98452) b!118962))

(assert (= (and b!118962 res!98454) b!118963))

(declare-fun m!178917 () Bool)

(assert (=> bm!1541 m!178917))

(declare-fun m!178919 () Bool)

(assert (=> b!118962 m!178919))

(declare-fun m!178921 () Bool)

(assert (=> b!118962 m!178921))

(declare-fun m!178923 () Bool)

(assert (=> b!118962 m!178923))

(declare-fun m!178925 () Bool)

(assert (=> b!118962 m!178925))

(declare-fun m!178927 () Bool)

(assert (=> b!118962 m!178927))

(declare-fun m!178929 () Bool)

(assert (=> b!118969 m!178929))

(declare-fun m!178931 () Bool)

(assert (=> b!118969 m!178931))

(declare-fun m!178933 () Bool)

(assert (=> b!118969 m!178933))

(assert (=> b!118969 m!178919))

(declare-fun m!178935 () Bool)

(assert (=> b!118969 m!178935))

(declare-fun m!178937 () Bool)

(assert (=> b!118969 m!178937))

(declare-fun m!178939 () Bool)

(assert (=> b!118969 m!178939))

(declare-fun m!178941 () Bool)

(assert (=> b!118969 m!178941))

(declare-fun m!178943 () Bool)

(assert (=> b!118969 m!178943))

(declare-fun m!178945 () Bool)

(assert (=> b!118969 m!178945))

(declare-fun m!178947 () Bool)

(assert (=> b!118969 m!178947))

(assert (=> b!118969 m!178291))

(declare-fun m!178949 () Bool)

(assert (=> b!118969 m!178949))

(declare-fun m!178951 () Bool)

(assert (=> b!118969 m!178951))

(declare-fun m!178953 () Bool)

(assert (=> b!118969 m!178953))

(declare-fun m!178955 () Bool)

(assert (=> b!118969 m!178955))

(assert (=> b!118969 m!178943))

(declare-fun m!178957 () Bool)

(assert (=> b!118969 m!178957))

(declare-fun m!178959 () Bool)

(assert (=> b!118969 m!178959))

(declare-fun m!178961 () Bool)

(assert (=> b!118969 m!178961))

(declare-fun m!178963 () Bool)

(assert (=> b!118969 m!178963))

(declare-fun m!178965 () Bool)

(assert (=> b!118969 m!178965))

(declare-fun m!178967 () Bool)

(assert (=> b!118969 m!178967))

(declare-fun m!178969 () Bool)

(assert (=> b!118969 m!178969))

(declare-fun m!178971 () Bool)

(assert (=> b!118969 m!178971))

(declare-fun m!178973 () Bool)

(assert (=> b!118969 m!178973))

(declare-fun m!178975 () Bool)

(assert (=> b!118969 m!178975))

(declare-fun m!178977 () Bool)

(assert (=> b!118969 m!178977))

(declare-fun m!178979 () Bool)

(assert (=> b!118969 m!178979))

(declare-fun m!178981 () Bool)

(assert (=> b!118969 m!178981))

(declare-fun m!178983 () Bool)

(assert (=> b!118963 m!178983))

(declare-fun m!178985 () Bool)

(assert (=> b!118972 m!178985))

(assert (=> b!118972 m!178291))

(declare-fun m!178987 () Bool)

(assert (=> b!118968 m!178987))

(declare-fun m!178989 () Bool)

(assert (=> b!118971 m!178989))

(declare-fun m!178991 () Bool)

(assert (=> b!118966 m!178991))

(assert (=> b!118966 m!178991))

(declare-fun m!178993 () Bool)

(assert (=> b!118966 m!178993))

(declare-fun m!178995 () Bool)

(assert (=> b!118965 m!178995))

(assert (=> b!118965 m!178291))

(declare-fun m!178997 () Bool)

(assert (=> b!118964 m!178997))

(assert (=> b!118964 m!178985))

(assert (=> b!118628 d!38078))

(declare-fun b!118982 () Bool)

(declare-fun res!98472 () Bool)

(declare-fun e!77975 () Bool)

(assert (=> b!118982 (=> (not res!98472) (not e!77975))))

(declare-fun lt!183568 () (_ BitVec 64))

(declare-fun lt!183567 () (_ BitVec 64))

(declare-fun lt!183566 () tuple2!9948)

(assert (=> b!118982 (= res!98472 (= (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183566))) (currentByte!5488 (_2!5239 lt!183566)) (currentBit!5483 (_2!5239 lt!183566))) (bvadd lt!183567 lt!183568)))))

(assert (=> b!118982 (or (not (= (bvand lt!183567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183568 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183567 lt!183568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118982 (= lt!183568 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!118982 (= lt!183567 (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(declare-fun b!118984 () Bool)

(declare-fun e!77976 () Bool)

(assert (=> b!118984 (= e!77975 e!77976)))

(declare-fun res!98470 () Bool)

(assert (=> b!118984 (=> (not res!98470) (not e!77976))))

(declare-fun lt!183569 () tuple2!9950)

(assert (=> b!118984 (= res!98470 (and (= (_2!5240 lt!183569) lt!182544) (= (_1!5240 lt!183569) (_2!5239 lt!183566))))))

(assert (=> b!118984 (= lt!183569 (readBitPure!0 (readerFrom!0 (_2!5239 lt!183566) (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305))))))

(declare-fun b!118985 () Bool)

(assert (=> b!118985 (= e!77976 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!183569))) (currentByte!5488 (_1!5240 lt!183569)) (currentBit!5483 (_1!5240 lt!183569))) (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!183566))) (currentByte!5488 (_2!5239 lt!183566)) (currentBit!5483 (_2!5239 lt!183566)))))))

(declare-fun b!118983 () Bool)

(declare-fun res!98469 () Bool)

(assert (=> b!118983 (=> (not res!98469) (not e!77975))))

(assert (=> b!118983 (= res!98469 (isPrefixOf!0 thiss!1305 (_2!5239 lt!183566)))))

(declare-fun d!38080 () Bool)

(assert (=> d!38080 e!77975))

(declare-fun res!98471 () Bool)

(assert (=> d!38080 (=> (not res!98471) (not e!77975))))

(assert (=> d!38080 (= res!98471 (= (size!2414 (buf!2833 thiss!1305)) (size!2414 (buf!2833 (_2!5239 lt!183566)))))))

(declare-fun choose!16 (BitStream!4302 Bool) tuple2!9948)

(assert (=> d!38080 (= lt!183566 (choose!16 thiss!1305 lt!182544))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38080 (validate_offset_bit!0 ((_ sign_extend 32) (size!2414 (buf!2833 thiss!1305))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305)))))

(assert (=> d!38080 (= (appendBit!0 thiss!1305 lt!182544) lt!183566)))

(assert (= (and d!38080 res!98471) b!118982))

(assert (= (and b!118982 res!98472) b!118983))

(assert (= (and b!118983 res!98469) b!118984))

(assert (= (and b!118984 res!98470) b!118985))

(declare-fun m!178999 () Bool)

(assert (=> b!118983 m!178999))

(declare-fun m!179001 () Bool)

(assert (=> b!118985 m!179001))

(declare-fun m!179003 () Bool)

(assert (=> b!118985 m!179003))

(declare-fun m!179005 () Bool)

(assert (=> d!38080 m!179005))

(declare-fun m!179007 () Bool)

(assert (=> d!38080 m!179007))

(declare-fun m!179009 () Bool)

(assert (=> b!118984 m!179009))

(assert (=> b!118984 m!179009))

(declare-fun m!179011 () Bool)

(assert (=> b!118984 m!179011))

(assert (=> b!118982 m!179003))

(assert (=> b!118982 m!178277))

(assert (=> b!118628 d!38080))

(declare-fun d!38082 () Bool)

(assert (=> d!38082 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305)) lt!182542) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305))) lt!182542))))

(declare-fun bs!9216 () Bool)

(assert (= bs!9216 d!38082))

(declare-fun m!179013 () Bool)

(assert (=> bs!9216 m!179013))

(assert (=> b!118628 d!38082))

(declare-fun d!38084 () Bool)

(declare-fun lt!183570 () tuple2!9972)

(assert (=> d!38084 (= lt!183570 (readBit!0 lt!182548))))

(assert (=> d!38084 (= (readBitPure!0 lt!182548) (tuple2!9951 (_2!5251 lt!183570) (_1!5251 lt!183570)))))

(declare-fun bs!9217 () Bool)

(assert (= bs!9217 d!38084))

(declare-fun m!179015 () Bool)

(assert (=> bs!9217 m!179015))

(assert (=> b!118628 d!38084))

(declare-fun lt!183571 () tuple2!9974)

(declare-fun d!38086 () Bool)

(assert (=> d!38086 (= lt!183571 (readNLeastSignificantBitsLoop!0 (_1!5242 lt!182543) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182527))))

(assert (=> d!38086 (= (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!182543) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182527) (tuple2!9953 (_2!5252 lt!183571) (_1!5252 lt!183571)))))

(declare-fun bs!9218 () Bool)

(assert (= bs!9218 d!38086))

(declare-fun m!179017 () Bool)

(assert (=> bs!9218 m!179017))

(assert (=> b!118628 d!38086))

(declare-fun d!38088 () Bool)

(declare-fun e!77977 () Bool)

(assert (=> d!38088 e!77977))

(declare-fun res!98474 () Bool)

(assert (=> d!38088 (=> (not res!98474) (not e!77977))))

(declare-fun lt!183576 () (_ BitVec 64))

(declare-fun lt!183572 () (_ BitVec 64))

(declare-fun lt!183573 () (_ BitVec 64))

(assert (=> d!38088 (= res!98474 (= lt!183576 (bvsub lt!183573 lt!183572)))))

(assert (=> d!38088 (or (= (bvand lt!183573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183572 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183573 lt!183572) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38088 (= lt!183572 (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182540)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540)))))))

(declare-fun lt!183575 () (_ BitVec 64))

(declare-fun lt!183577 () (_ BitVec 64))

(assert (=> d!38088 (= lt!183573 (bvmul lt!183575 lt!183577))))

(assert (=> d!38088 (or (= lt!183575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183577 (bvsdiv (bvmul lt!183575 lt!183577) lt!183575)))))

(assert (=> d!38088 (= lt!183577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38088 (= lt!183575 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182540)))))))

(assert (=> d!38088 (= lt!183576 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182540))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182540)))))))

(assert (=> d!38088 (invariant!0 (currentBit!5483 (_2!5239 lt!182540)) (currentByte!5488 (_2!5239 lt!182540)) (size!2414 (buf!2833 (_2!5239 lt!182540))))))

(assert (=> d!38088 (= (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540))) lt!183576)))

(declare-fun b!118986 () Bool)

(declare-fun res!98473 () Bool)

(assert (=> b!118986 (=> (not res!98473) (not e!77977))))

(assert (=> b!118986 (= res!98473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183576))))

(declare-fun b!118987 () Bool)

(declare-fun lt!183574 () (_ BitVec 64))

(assert (=> b!118987 (= e!77977 (bvsle lt!183576 (bvmul lt!183574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118987 (or (= lt!183574 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183574 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183574)))))

(assert (=> b!118987 (= lt!183574 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182540)))))))

(assert (= (and d!38088 res!98474) b!118986))

(assert (= (and b!118986 res!98473) b!118987))

(declare-fun m!179019 () Bool)

(assert (=> d!38088 m!179019))

(declare-fun m!179021 () Bool)

(assert (=> d!38088 m!179021))

(assert (=> b!118627 d!38088))

(declare-fun d!38090 () Bool)

(declare-fun e!77978 () Bool)

(assert (=> d!38090 e!77978))

(declare-fun res!98476 () Bool)

(assert (=> d!38090 (=> (not res!98476) (not e!77978))))

(declare-fun lt!183578 () (_ BitVec 64))

(declare-fun lt!183579 () (_ BitVec 64))

(declare-fun lt!183582 () (_ BitVec 64))

(assert (=> d!38090 (= res!98476 (= lt!183582 (bvsub lt!183579 lt!183578)))))

(assert (=> d!38090 (or (= (bvand lt!183579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183579 lt!183578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38090 (= lt!183578 (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 thiss!1305))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305))))))

(declare-fun lt!183581 () (_ BitVec 64))

(declare-fun lt!183583 () (_ BitVec 64))

(assert (=> d!38090 (= lt!183579 (bvmul lt!183581 lt!183583))))

(assert (=> d!38090 (or (= lt!183581 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183583 (bvsdiv (bvmul lt!183581 lt!183583) lt!183581)))))

(assert (=> d!38090 (= lt!183583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38090 (= lt!183581 ((_ sign_extend 32) (size!2414 (buf!2833 thiss!1305))))))

(assert (=> d!38090 (= lt!183582 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5488 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5483 thiss!1305))))))

(assert (=> d!38090 (invariant!0 (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305) (size!2414 (buf!2833 thiss!1305)))))

(assert (=> d!38090 (= (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)) lt!183582)))

(declare-fun b!118988 () Bool)

(declare-fun res!98475 () Bool)

(assert (=> b!118988 (=> (not res!98475) (not e!77978))))

(assert (=> b!118988 (= res!98475 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183582))))

(declare-fun b!118989 () Bool)

(declare-fun lt!183580 () (_ BitVec 64))

(assert (=> b!118989 (= e!77978 (bvsle lt!183582 (bvmul lt!183580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118989 (or (= lt!183580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183580)))))

(assert (=> b!118989 (= lt!183580 ((_ sign_extend 32) (size!2414 (buf!2833 thiss!1305))))))

(assert (= (and d!38090 res!98476) b!118988))

(assert (= (and b!118988 res!98475) b!118989))

(declare-fun m!179023 () Bool)

(assert (=> d!38090 m!179023))

(assert (=> d!38090 m!178823))

(assert (=> b!118627 d!38090))

(declare-fun d!38092 () Bool)

(declare-fun e!77979 () Bool)

(assert (=> d!38092 e!77979))

(declare-fun res!98478 () Bool)

(assert (=> d!38092 (=> (not res!98478) (not e!77979))))

(declare-fun lt!183584 () (_ BitVec 64))

(declare-fun lt!183585 () (_ BitVec 64))

(declare-fun lt!183588 () (_ BitVec 64))

(assert (=> d!38092 (= res!98478 (= lt!183588 (bvsub lt!183585 lt!183584)))))

(assert (=> d!38092 (or (= (bvand lt!183585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183585 lt!183584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38092 (= lt!183584 (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))) ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182528))) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182528)))))))

(declare-fun lt!183587 () (_ BitVec 64))

(declare-fun lt!183589 () (_ BitVec 64))

(assert (=> d!38092 (= lt!183585 (bvmul lt!183587 lt!183589))))

(assert (=> d!38092 (or (= lt!183587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183589 (bvsdiv (bvmul lt!183587 lt!183589) lt!183587)))))

(assert (=> d!38092 (= lt!183589 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38092 (= lt!183587 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))))))

(assert (=> d!38092 (= lt!183588 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5488 (_2!5239 lt!182528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5483 (_2!5239 lt!182528)))))))

(assert (=> d!38092 (invariant!0 (currentBit!5483 (_2!5239 lt!182528)) (currentByte!5488 (_2!5239 lt!182528)) (size!2414 (buf!2833 (_2!5239 lt!182528))))))

(assert (=> d!38092 (= (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182528))) (currentByte!5488 (_2!5239 lt!182528)) (currentBit!5483 (_2!5239 lt!182528))) lt!183588)))

(declare-fun b!118990 () Bool)

(declare-fun res!98477 () Bool)

(assert (=> b!118990 (=> (not res!98477) (not e!77979))))

(assert (=> b!118990 (= res!98477 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183588))))

(declare-fun b!118991 () Bool)

(declare-fun lt!183586 () (_ BitVec 64))

(assert (=> b!118991 (= e!77979 (bvsle lt!183588 (bvmul lt!183586 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118991 (or (= lt!183586 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183586 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183586)))))

(assert (=> b!118991 (= lt!183586 ((_ sign_extend 32) (size!2414 (buf!2833 (_2!5239 lt!182528)))))))

(assert (= (and d!38092 res!98478) b!118990))

(assert (= (and b!118990 res!98477) b!118991))

(declare-fun m!179025 () Bool)

(assert (=> d!38092 m!179025))

(declare-fun m!179027 () Bool)

(assert (=> d!38092 m!179027))

(assert (=> b!118626 d!38092))

(declare-fun d!38094 () Bool)

(declare-fun lt!183590 () tuple2!9974)

(assert (=> d!38094 (= lt!183590 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5242 lt!182539) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182527))))

(assert (=> d!38094 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5242 lt!182539) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182527) (tuple2!9953 (_2!5252 lt!183590) (_1!5252 lt!183590)))))

(declare-fun bs!9219 () Bool)

(assert (= bs!9219 d!38094))

(assert (=> bs!9219 m!178273))

(declare-fun m!179029 () Bool)

(assert (=> bs!9219 m!179029))

(assert (=> b!118626 d!38094))

(declare-fun d!38096 () Bool)

(declare-fun e!77982 () Bool)

(assert (=> d!38096 e!77982))

(declare-fun res!98481 () Bool)

(assert (=> d!38096 (=> (not res!98481) (not e!77982))))

(declare-fun lt!183596 () (_ BitVec 64))

(declare-fun lt!183595 () BitStream!4302)

(assert (=> d!38096 (= res!98481 (= (bvadd lt!183596 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2414 (buf!2833 lt!183595)) (currentByte!5488 lt!183595) (currentBit!5483 lt!183595))))))

(assert (=> d!38096 (or (not (= (bvand lt!183596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183596 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38096 (= lt!183596 (bitIndex!0 (size!2414 (buf!2833 (_1!5242 lt!182539))) (currentByte!5488 (_1!5242 lt!182539)) (currentBit!5483 (_1!5242 lt!182539))))))

(declare-fun moveBitIndex!0 (BitStream!4302 (_ BitVec 64)) tuple2!9948)

(assert (=> d!38096 (= lt!183595 (_2!5239 (moveBitIndex!0 (_1!5242 lt!182539) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4302 (_ BitVec 64)) Bool)

(assert (=> d!38096 (moveBitIndexPrecond!0 (_1!5242 lt!182539) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38096 (= (withMovedBitIndex!0 (_1!5242 lt!182539) #b0000000000000000000000000000000000000000000000000000000000000001) lt!183595)))

(declare-fun b!118994 () Bool)

(assert (=> b!118994 (= e!77982 (= (size!2414 (buf!2833 (_1!5242 lt!182539))) (size!2414 (buf!2833 lt!183595))))))

(assert (= (and d!38096 res!98481) b!118994))

(declare-fun m!179031 () Bool)

(assert (=> d!38096 m!179031))

(declare-fun m!179033 () Bool)

(assert (=> d!38096 m!179033))

(declare-fun m!179035 () Bool)

(assert (=> d!38096 m!179035))

(declare-fun m!179037 () Bool)

(assert (=> d!38096 m!179037))

(assert (=> b!118626 d!38096))

(declare-fun d!38098 () Bool)

(declare-fun lt!183611 () tuple2!9952)

(declare-fun lt!183613 () tuple2!9952)

(assert (=> d!38098 (and (= (_2!5241 lt!183611) (_2!5241 lt!183613)) (= (_1!5241 lt!183611) (_1!5241 lt!183613)))))

(declare-fun lt!183612 () Unit!7299)

(declare-fun lt!183614 () (_ BitVec 64))

(declare-fun lt!183610 () BitStream!4302)

(declare-fun lt!183609 () Bool)

(declare-fun choose!45 (BitStream!4302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9952 tuple2!9952 BitStream!4302 (_ BitVec 64) Bool BitStream!4302 (_ BitVec 64) tuple2!9952 tuple2!9952 BitStream!4302 (_ BitVec 64)) Unit!7299)

(assert (=> d!38098 (= lt!183612 (choose!45 (_1!5242 lt!182539) nBits!396 i!615 lt!182529 lt!183611 (tuple2!9953 (_1!5241 lt!183611) (_2!5241 lt!183611)) (_1!5241 lt!183611) (_2!5241 lt!183611) lt!183609 lt!183610 lt!183614 lt!183613 (tuple2!9953 (_1!5241 lt!183613) (_2!5241 lt!183613)) (_1!5241 lt!183613) (_2!5241 lt!183613)))))

(assert (=> d!38098 (= lt!183613 (readNLeastSignificantBitsLoopPure!0 lt!183610 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!183614))))

(assert (=> d!38098 (= lt!183614 (bvor lt!182529 (ite lt!183609 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38098 (= lt!183610 (withMovedBitIndex!0 (_1!5242 lt!182539) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38098 (= lt!183609 (_2!5240 (readBitPure!0 (_1!5242 lt!182539))))))

(assert (=> d!38098 (= lt!183611 (readNLeastSignificantBitsLoopPure!0 (_1!5242 lt!182539) nBits!396 i!615 lt!182529))))

(assert (=> d!38098 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5242 lt!182539) nBits!396 i!615 lt!182529) lt!183612)))

(declare-fun bs!9221 () Bool)

(assert (= bs!9221 d!38098))

(assert (=> bs!9221 m!178265))

(declare-fun m!179039 () Bool)

(assert (=> bs!9221 m!179039))

(assert (=> bs!9221 m!178273))

(assert (=> bs!9221 m!178255))

(declare-fun m!179041 () Bool)

(assert (=> bs!9221 m!179041))

(assert (=> b!118626 d!38098))

(assert (=> b!118626 d!38090))

(declare-fun d!38100 () Bool)

(assert (=> d!38100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2414 (buf!2833 thiss!1305))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305)) lt!182542) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 thiss!1305))) ((_ sign_extend 32) (currentByte!5488 thiss!1305)) ((_ sign_extend 32) (currentBit!5483 thiss!1305))) lt!182542))))

(declare-fun bs!9222 () Bool)

(assert (= bs!9222 d!38100))

(assert (=> bs!9222 m!179023))

(assert (=> b!118636 d!38100))

(declare-fun d!38102 () Bool)

(declare-fun lt!183615 () tuple2!9972)

(assert (=> d!38102 (= lt!183615 (readBit!0 (readerFrom!0 (_2!5239 lt!182540) (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305))))))

(assert (=> d!38102 (= (readBitPure!0 (readerFrom!0 (_2!5239 lt!182540) (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305))) (tuple2!9951 (_2!5251 lt!183615) (_1!5251 lt!183615)))))

(declare-fun bs!9223 () Bool)

(assert (= bs!9223 d!38102))

(assert (=> bs!9223 m!178287))

(declare-fun m!179043 () Bool)

(assert (=> bs!9223 m!179043))

(assert (=> b!118625 d!38102))

(declare-fun d!38104 () Bool)

(declare-fun e!77985 () Bool)

(assert (=> d!38104 e!77985))

(declare-fun res!98485 () Bool)

(assert (=> d!38104 (=> (not res!98485) (not e!77985))))

(assert (=> d!38104 (= res!98485 (invariant!0 (currentBit!5483 (_2!5239 lt!182540)) (currentByte!5488 (_2!5239 lt!182540)) (size!2414 (buf!2833 (_2!5239 lt!182540)))))))

(assert (=> d!38104 (= (readerFrom!0 (_2!5239 lt!182540) (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305)) (BitStream!4303 (buf!2833 (_2!5239 lt!182540)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)))))

(declare-fun b!118997 () Bool)

(assert (=> b!118997 (= e!77985 (invariant!0 (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182540)))))))

(assert (= (and d!38104 res!98485) b!118997))

(assert (=> d!38104 m!179021))

(assert (=> b!118997 m!178227))

(assert (=> b!118625 d!38104))

(declare-fun d!38106 () Bool)

(assert (=> d!38106 (= (invariant!0 (currentBit!5483 thiss!1305) (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182528)))) (and (bvsge (currentBit!5483 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5483 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5488 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182528)))) (and (= (currentBit!5483 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5488 thiss!1305) (size!2414 (buf!2833 (_2!5239 lt!182528))))))))))

(assert (=> b!118624 d!38106))

(declare-fun d!38108 () Bool)

(declare-fun e!77986 () Bool)

(assert (=> d!38108 e!77986))

(declare-fun res!98487 () Bool)

(assert (=> d!38108 (=> (not res!98487) (not e!77986))))

(declare-fun lt!183616 () (_ BitVec 64))

(declare-fun lt!183620 () (_ BitVec 64))

(declare-fun lt!183617 () (_ BitVec 64))

(assert (=> d!38108 (= res!98487 (= lt!183620 (bvsub lt!183617 lt!183616)))))

(assert (=> d!38108 (or (= (bvand lt!183617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183616 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183617 lt!183616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38108 (= lt!183616 (remainingBits!0 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182535)))) ((_ sign_extend 32) (currentByte!5488 (_1!5240 lt!182535))) ((_ sign_extend 32) (currentBit!5483 (_1!5240 lt!182535)))))))

(declare-fun lt!183619 () (_ BitVec 64))

(declare-fun lt!183621 () (_ BitVec 64))

(assert (=> d!38108 (= lt!183617 (bvmul lt!183619 lt!183621))))

(assert (=> d!38108 (or (= lt!183619 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183621 (bvsdiv (bvmul lt!183619 lt!183621) lt!183619)))))

(assert (=> d!38108 (= lt!183621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38108 (= lt!183619 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182535)))))))

(assert (=> d!38108 (= lt!183620 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5488 (_1!5240 lt!182535))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5483 (_1!5240 lt!182535)))))))

(assert (=> d!38108 (invariant!0 (currentBit!5483 (_1!5240 lt!182535)) (currentByte!5488 (_1!5240 lt!182535)) (size!2414 (buf!2833 (_1!5240 lt!182535))))))

(assert (=> d!38108 (= (bitIndex!0 (size!2414 (buf!2833 (_1!5240 lt!182535))) (currentByte!5488 (_1!5240 lt!182535)) (currentBit!5483 (_1!5240 lt!182535))) lt!183620)))

(declare-fun b!118998 () Bool)

(declare-fun res!98486 () Bool)

(assert (=> b!118998 (=> (not res!98486) (not e!77986))))

(assert (=> b!118998 (= res!98486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183620))))

(declare-fun b!118999 () Bool)

(declare-fun lt!183618 () (_ BitVec 64))

(assert (=> b!118999 (= e!77986 (bvsle lt!183620 (bvmul lt!183618 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118999 (or (= lt!183618 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183618 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183618)))))

(assert (=> b!118999 (= lt!183618 ((_ sign_extend 32) (size!2414 (buf!2833 (_1!5240 lt!182535)))))))

(assert (= (and d!38108 res!98487) b!118998))

(assert (= (and b!118998 res!98486) b!118999))

(declare-fun m!179045 () Bool)

(assert (=> d!38108 m!179045))

(declare-fun m!179047 () Bool)

(assert (=> d!38108 m!179047))

(assert (=> b!118635 d!38108))

(declare-fun d!38110 () Bool)

(declare-fun res!98489 () Bool)

(declare-fun e!77987 () Bool)

(assert (=> d!38110 (=> (not res!98489) (not e!77987))))

(assert (=> d!38110 (= res!98489 (= (size!2414 (buf!2833 thiss!1305)) (size!2414 (buf!2833 (_2!5239 lt!182540)))))))

(assert (=> d!38110 (= (isPrefixOf!0 thiss!1305 (_2!5239 lt!182540)) e!77987)))

(declare-fun b!119000 () Bool)

(declare-fun res!98488 () Bool)

(assert (=> b!119000 (=> (not res!98488) (not e!77987))))

(assert (=> b!119000 (= res!98488 (bvsle (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305)) (bitIndex!0 (size!2414 (buf!2833 (_2!5239 lt!182540))) (currentByte!5488 (_2!5239 lt!182540)) (currentBit!5483 (_2!5239 lt!182540)))))))

(declare-fun b!119001 () Bool)

(declare-fun e!77988 () Bool)

(assert (=> b!119001 (= e!77987 e!77988)))

(declare-fun res!98490 () Bool)

(assert (=> b!119001 (=> res!98490 e!77988)))

(assert (=> b!119001 (= res!98490 (= (size!2414 (buf!2833 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119002 () Bool)

(assert (=> b!119002 (= e!77988 (arrayBitRangesEq!0 (buf!2833 thiss!1305) (buf!2833 (_2!5239 lt!182540)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2414 (buf!2833 thiss!1305)) (currentByte!5488 thiss!1305) (currentBit!5483 thiss!1305))))))

(assert (= (and d!38110 res!98489) b!119000))

(assert (= (and b!119000 res!98488) b!119001))

(assert (= (and b!119001 (not res!98490)) b!119002))

(assert (=> b!119000 m!178277))

(assert (=> b!119000 m!178291))

(assert (=> b!119002 m!178277))

(assert (=> b!119002 m!178277))

(declare-fun m!179049 () Bool)

(assert (=> b!119002 m!179049))

(assert (=> b!118633 d!38110))

(check-sat (not d!38094) (not b!118917) (not d!38102) (not b!118969) (not b!118932) (not d!38054) (not d!38062) (not b!118904) (not d!38066) (not b!118915) (not d!38096) (not d!38104) (not b!118985) (not d!38060) (not d!38088) (not b!119002) (not d!38082) (not b!118929) (not d!38072) (not b!118971) (not b!118966) (not b!118964) (not d!38068) (not b!118965) (not b!118905) (not d!38070) (not d!38100) (not d!38046) (not b!119000) (not d!38090) (not b!118972) (not b!118962) (not d!38086) (not b!118907) (not bm!1541) (not d!38092) (not b!118933) (not d!38098) (not d!38052) (not b!118968) (not b!118997) (not b!118930) (not b!118963) (not d!38058) (not d!38064) (not b!118982) (not d!38076) (not d!38080) (not d!38084) (not b!118983) (not d!38108) (not b!118908) (not b!118984) (not d!38074))
