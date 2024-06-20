; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58054 () Bool)

(assert start!58054)

(declare-fun b!266708 () Bool)

(declare-fun e!186660 () Bool)

(declare-fun e!186654 () Bool)

(assert (=> b!266708 (= e!186660 (not e!186654))))

(declare-fun res!222723 () Bool)

(assert (=> b!266708 (=> res!222723 e!186654)))

(declare-fun e!186651 () Bool)

(assert (=> b!266708 (= res!222723 e!186651)))

(declare-fun res!222724 () Bool)

(assert (=> b!266708 (=> (not res!222724) (not e!186651))))

(declare-datatypes ((array!14868 0))(
  ( (array!14869 (arr!7470 (Array (_ BitVec 32) (_ BitVec 8))) (size!6483 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11780 0))(
  ( (BitStream!11781 (buf!6951 array!14868) (currentByte!12845 (_ BitVec 32)) (currentBit!12840 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11780)

(assert (=> b!266708 (= res!222724 (not (= (size!6483 (buf!6951 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11780)

(declare-fun isPrefixOf!0 (BitStream!11780 BitStream!11780) Bool)

(assert (=> b!266708 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18947 0))(
  ( (Unit!18948) )
))
(declare-fun lt!407417 () Unit!18947)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11780) Unit!18947)

(assert (=> b!266708 (= lt!407417 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407426 () BitStream!11780)

(assert (=> b!266708 (isPrefixOf!0 lt!407426 lt!407426)))

(declare-fun lt!407422 () Unit!18947)

(assert (=> b!266708 (= lt!407422 (lemmaIsPrefixRefl!0 lt!407426))))

(assert (=> b!266708 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407418 () Unit!18947)

(assert (=> b!266708 (= lt!407418 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266708 (= lt!407426 (BitStream!11781 (buf!6951 w2!580) (currentByte!12845 w1!584) (currentBit!12840 w1!584)))))

(declare-fun lt!407415 () (_ BitVec 64))

(declare-fun b!266709 () Bool)

(declare-fun lt!407420 () (_ BitVec 64))

(declare-fun lt!407425 () (_ BitVec 64))

(declare-fun e!186659 () Bool)

(assert (=> b!266709 (= e!186659 (or (= lt!407415 (bvand lt!407420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!407415 (bvand (bvsub lt!407425 lt!407420) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!266709 (= lt!407415 (bvand lt!407425 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266709 (= lt!407420 (bitIndex!0 (size!6483 (buf!6951 w2!580)) (currentByte!12845 w2!580) (currentBit!12840 w2!580)))))

(assert (=> b!266709 (= lt!407425 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)))))

(declare-fun lt!407424 () Unit!18947)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11780 BitStream!11780 BitStream!11780) Unit!18947)

(assert (=> b!266709 (= lt!407424 (lemmaIsPrefixTransitive!0 lt!407426 w2!580 w2!580))))

(assert (=> b!266709 (isPrefixOf!0 lt!407426 w2!580)))

(declare-fun lt!407416 () Unit!18947)

(assert (=> b!266709 (= lt!407416 (lemmaIsPrefixTransitive!0 lt!407426 w1!584 w2!580))))

(declare-fun b!266710 () Bool)

(declare-fun res!222725 () Bool)

(assert (=> b!266710 (=> res!222725 e!186659)))

(assert (=> b!266710 (= res!222725 (not (isPrefixOf!0 lt!407426 w1!584)))))

(declare-fun b!266711 () Bool)

(declare-fun e!186655 () Unit!18947)

(declare-fun lt!407419 () Unit!18947)

(assert (=> b!266711 (= e!186655 lt!407419)))

(declare-fun lt!407423 () (_ BitVec 64))

(assert (=> b!266711 (= lt!407423 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14868 array!14868 (_ BitVec 64) (_ BitVec 64)) Unit!18947)

(assert (=> b!266711 (= lt!407419 (arrayBitRangesEqSymmetric!0 (buf!6951 w1!584) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423))))

(declare-fun arrayBitRangesEq!0 (array!14868 array!14868 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266711 (arrayBitRangesEq!0 (buf!6951 w2!580) (buf!6951 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423)))

(declare-fun b!266712 () Bool)

(declare-fun e!186653 () Bool)

(declare-fun array_inv!6207 (array!14868) Bool)

(assert (=> b!266712 (= e!186653 (array_inv!6207 (buf!6951 w2!580)))))

(declare-fun b!266713 () Bool)

(assert (=> b!266713 (= e!186651 (not (arrayBitRangesEq!0 (buf!6951 w1!584) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)))))))

(declare-fun b!266714 () Bool)

(declare-fun e!186657 () Bool)

(assert (=> b!266714 (= e!186657 (not (arrayBitRangesEq!0 (buf!6951 w2!580) (buf!6951 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)))))))

(declare-fun b!266715 () Bool)

(declare-fun Unit!18949 () Unit!18947)

(assert (=> b!266715 (= e!186655 Unit!18949)))

(declare-fun b!266716 () Bool)

(declare-fun e!186652 () Bool)

(assert (=> b!266716 (= e!186652 (array_inv!6207 (buf!6951 w1!584)))))

(declare-fun res!222726 () Bool)

(assert (=> start!58054 (=> (not res!222726) (not e!186660))))

(assert (=> start!58054 (= res!222726 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58054 e!186660))

(declare-fun inv!12 (BitStream!11780) Bool)

(assert (=> start!58054 (and (inv!12 w1!584) e!186652)))

(assert (=> start!58054 (and (inv!12 w2!580) e!186653)))

(declare-fun b!266717 () Bool)

(assert (=> b!266717 (= e!186654 e!186659)))

(declare-fun res!222722 () Bool)

(assert (=> b!266717 (=> res!222722 e!186659)))

(assert (=> b!266717 (= res!222722 e!186657)))

(declare-fun res!222727 () Bool)

(assert (=> b!266717 (=> (not res!222727) (not e!186657))))

(assert (=> b!266717 (= res!222727 (not (= (size!6483 (buf!6951 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407421 () Unit!18947)

(assert (=> b!266717 (= lt!407421 e!186655)))

(declare-fun c!12288 () Bool)

(assert (=> b!266717 (= c!12288 (not (= (size!6483 (buf!6951 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!58054 res!222726) b!266708))

(assert (= (and b!266708 res!222724) b!266713))

(assert (= (and b!266708 (not res!222723)) b!266717))

(assert (= (and b!266717 c!12288) b!266711))

(assert (= (and b!266717 (not c!12288)) b!266715))

(assert (= (and b!266717 res!222727) b!266714))

(assert (= (and b!266717 (not res!222722)) b!266710))

(assert (= (and b!266710 (not res!222725)) b!266709))

(assert (= start!58054 b!266716))

(assert (= start!58054 b!266712))

(declare-fun m!397595 () Bool)

(assert (=> start!58054 m!397595))

(declare-fun m!397597 () Bool)

(assert (=> start!58054 m!397597))

(declare-fun m!397599 () Bool)

(assert (=> start!58054 m!397599))

(declare-fun m!397601 () Bool)

(assert (=> b!266716 m!397601))

(declare-fun m!397603 () Bool)

(assert (=> b!266713 m!397603))

(assert (=> b!266713 m!397603))

(declare-fun m!397605 () Bool)

(assert (=> b!266713 m!397605))

(declare-fun m!397607 () Bool)

(assert (=> b!266710 m!397607))

(assert (=> b!266711 m!397603))

(declare-fun m!397609 () Bool)

(assert (=> b!266711 m!397609))

(declare-fun m!397611 () Bool)

(assert (=> b!266711 m!397611))

(declare-fun m!397613 () Bool)

(assert (=> b!266712 m!397613))

(assert (=> b!266709 m!397603))

(declare-fun m!397615 () Bool)

(assert (=> b!266709 m!397615))

(declare-fun m!397617 () Bool)

(assert (=> b!266709 m!397617))

(declare-fun m!397619 () Bool)

(assert (=> b!266709 m!397619))

(declare-fun m!397621 () Bool)

(assert (=> b!266709 m!397621))

(declare-fun m!397623 () Bool)

(assert (=> b!266708 m!397623))

(declare-fun m!397625 () Bool)

(assert (=> b!266708 m!397625))

(declare-fun m!397627 () Bool)

(assert (=> b!266708 m!397627))

(declare-fun m!397629 () Bool)

(assert (=> b!266708 m!397629))

(declare-fun m!397631 () Bool)

(assert (=> b!266708 m!397631))

(declare-fun m!397633 () Bool)

(assert (=> b!266708 m!397633))

(assert (=> b!266714 m!397603))

(assert (=> b!266714 m!397603))

(declare-fun m!397635 () Bool)

(assert (=> b!266714 m!397635))

(push 1)

(assert (not b!266709))

(assert (not b!266713))

(assert (not b!266708))

(assert (not b!266710))

(assert (not b!266712))

(assert (not b!266711))

(assert (not b!266716))

(assert (not start!58054))

(assert (not b!266714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!266759 () Bool)

(declare-fun e!186696 () Bool)

(declare-fun e!186697 () Bool)

(assert (=> b!266759 (= e!186696 e!186697)))

(declare-fun res!222761 () Bool)

(assert (=> b!266759 (=> (not res!222761) (not e!186697))))

(declare-fun e!186699 () Bool)

(assert (=> b!266759 (= res!222761 e!186699)))

(declare-fun res!222759 () Bool)

(assert (=> b!266759 (=> res!222759 e!186699)))

(declare-datatypes ((tuple4!392 0))(
  ( (tuple4!393 (_1!12176 (_ BitVec 32)) (_2!12176 (_ BitVec 32)) (_3!976 (_ BitVec 32)) (_4!196 (_ BitVec 32))) )
))
(declare-fun lt!407466 () tuple4!392)

(assert (=> b!266759 (= res!222759 (bvsge (_1!12176 lt!407466) (_2!12176 lt!407466)))))

(declare-fun lt!407465 () (_ BitVec 32))

(assert (=> b!266759 (= lt!407465 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!407467 () (_ BitVec 32))

(assert (=> b!266759 (= lt!407467 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!392)

(assert (=> b!266759 (= lt!407466 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(declare-fun b!266760 () Bool)

(declare-fun res!222760 () Bool)

(assert (=> b!266760 (= res!222760 (= lt!407465 #b00000000000000000000000000000000))))

(declare-fun e!186698 () Bool)

(assert (=> b!266760 (=> res!222760 e!186698)))

(declare-fun e!186694 () Bool)

(assert (=> b!266760 (= e!186694 e!186698)))

(declare-fun bm!4169 () Bool)

(declare-fun call!4172 () Bool)

(declare-fun c!12294 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4169 (= call!4172 (byteRangesEq!0 (select (arr!7470 (buf!6951 w1!584)) (_3!976 lt!407466)) (select (arr!7470 (buf!6951 w2!580)) (_3!976 lt!407466)) lt!407467 (ite c!12294 lt!407465 #b00000000000000000000000000001000)))))

(declare-fun b!266761 () Bool)

(declare-fun e!186695 () Bool)

(assert (=> b!266761 (= e!186695 call!4172)))

(declare-fun d!89958 () Bool)

(declare-fun res!222763 () Bool)

(assert (=> d!89958 (=> res!222763 e!186696)))

(assert (=> d!89958 (= res!222763 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(assert (=> d!89958 (= (arrayBitRangesEq!0 (buf!6951 w1!584) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))) e!186696)))

(declare-fun b!266762 () Bool)

(declare-fun arrayRangesEq!1032 (array!14868 array!14868 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266762 (= e!186699 (arrayRangesEq!1032 (buf!6951 w1!584) (buf!6951 w2!580) (_1!12176 lt!407466) (_2!12176 lt!407466)))))

(declare-fun b!266763 () Bool)

(assert (=> b!266763 (= e!186695 e!186694)))

(declare-fun res!222762 () Bool)

(assert (=> b!266763 (= res!222762 call!4172)))

(assert (=> b!266763 (=> (not res!222762) (not e!186694))))

(declare-fun b!266764 () Bool)

(assert (=> b!266764 (= e!186698 (byteRangesEq!0 (select (arr!7470 (buf!6951 w1!584)) (_4!196 lt!407466)) (select (arr!7470 (buf!6951 w2!580)) (_4!196 lt!407466)) #b00000000000000000000000000000000 lt!407465))))

(declare-fun b!266765 () Bool)

(assert (=> b!266765 (= e!186697 e!186695)))

(assert (=> b!266765 (= c!12294 (= (_3!976 lt!407466) (_4!196 lt!407466)))))

(assert (= (and d!89958 (not res!222763)) b!266759))

(assert (= (and b!266759 (not res!222759)) b!266762))

(assert (= (and b!266759 res!222761) b!266765))

(assert (= (and b!266765 c!12294) b!266761))

(assert (= (and b!266765 (not c!12294)) b!266763))

(assert (= (and b!266763 res!222762) b!266760))

(assert (= (and b!266760 (not res!222760)) b!266764))

(assert (= (or b!266761 b!266763) bm!4169))

(assert (=> b!266759 m!397603))

(declare-fun m!397659 () Bool)

(assert (=> b!266759 m!397659))

(declare-fun m!397661 () Bool)

(assert (=> bm!4169 m!397661))

(declare-fun m!397663 () Bool)

(assert (=> bm!4169 m!397663))

(assert (=> bm!4169 m!397661))

(assert (=> bm!4169 m!397663))

(declare-fun m!397665 () Bool)

(assert (=> bm!4169 m!397665))

(declare-fun m!397667 () Bool)

(assert (=> b!266762 m!397667))

(declare-fun m!397669 () Bool)

(assert (=> b!266764 m!397669))

(declare-fun m!397671 () Bool)

(assert (=> b!266764 m!397671))

(assert (=> b!266764 m!397669))

(assert (=> b!266764 m!397671))

(declare-fun m!397673 () Bool)

(assert (=> b!266764 m!397673))

(assert (=> b!266713 d!89958))

(declare-fun d!89966 () Bool)

(declare-fun e!186730 () Bool)

(assert (=> d!89966 e!186730))

(declare-fun res!222801 () Bool)

(assert (=> d!89966 (=> (not res!222801) (not e!186730))))

(declare-fun lt!407520 () (_ BitVec 64))

(declare-fun lt!407517 () (_ BitVec 64))

(declare-fun lt!407518 () (_ BitVec 64))

(assert (=> d!89966 (= res!222801 (= lt!407520 (bvsub lt!407518 lt!407517)))))

(assert (=> d!89966 (or (= (bvand lt!407518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407517 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407518 lt!407517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89966 (= lt!407517 (remainingBits!0 ((_ sign_extend 32) (size!6483 (buf!6951 w1!584))) ((_ sign_extend 32) (currentByte!12845 w1!584)) ((_ sign_extend 32) (currentBit!12840 w1!584))))))

(declare-fun lt!407519 () (_ BitVec 64))

(declare-fun lt!407515 () (_ BitVec 64))

(assert (=> d!89966 (= lt!407518 (bvmul lt!407519 lt!407515))))

(assert (=> d!89966 (or (= lt!407519 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407515 (bvsdiv (bvmul lt!407519 lt!407515) lt!407519)))))

(assert (=> d!89966 (= lt!407515 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89966 (= lt!407519 ((_ sign_extend 32) (size!6483 (buf!6951 w1!584))))))

(assert (=> d!89966 (= lt!407520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12845 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12840 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89966 (invariant!0 (currentBit!12840 w1!584) (currentByte!12845 w1!584) (size!6483 (buf!6951 w1!584)))))

(assert (=> d!89966 (= (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)) lt!407520)))

(declare-fun b!266808 () Bool)

(declare-fun res!222800 () Bool)

(assert (=> b!266808 (=> (not res!222800) (not e!186730))))

(assert (=> b!266808 (= res!222800 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407520))))

(declare-fun b!266809 () Bool)

(declare-fun lt!407516 () (_ BitVec 64))

(assert (=> b!266809 (= e!186730 (bvsle lt!407520 (bvmul lt!407516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266809 (or (= lt!407516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407516)))))

(assert (=> b!266809 (= lt!407516 ((_ sign_extend 32) (size!6483 (buf!6951 w1!584))))))

(assert (= (and d!89966 res!222801) b!266808))

(assert (= (and b!266808 res!222800) b!266809))

(declare-fun m!397705 () Bool)

(assert (=> d!89966 m!397705))

(declare-fun m!397707 () Bool)

(assert (=> d!89966 m!397707))

(assert (=> b!266713 d!89966))

(declare-fun d!89982 () Bool)

(assert (=> d!89982 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407526 () Unit!18947)

(declare-fun choose!11 (BitStream!11780) Unit!18947)

(assert (=> d!89982 (= lt!407526 (choose!11 w2!580))))

(assert (=> d!89982 (= (lemmaIsPrefixRefl!0 w2!580) lt!407526)))

(declare-fun bs!22854 () Bool)

(assert (= bs!22854 d!89982))

(assert (=> bs!22854 m!397629))

(declare-fun m!397715 () Bool)

(assert (=> bs!22854 m!397715))

(assert (=> b!266708 d!89982))

(declare-fun d!89992 () Bool)

(assert (=> d!89992 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407527 () Unit!18947)

(assert (=> d!89992 (= lt!407527 (choose!11 w1!584))))

(assert (=> d!89992 (= (lemmaIsPrefixRefl!0 w1!584) lt!407527)))

(declare-fun bs!22855 () Bool)

(assert (= bs!22855 d!89992))

(assert (=> bs!22855 m!397627))

(declare-fun m!397723 () Bool)

(assert (=> bs!22855 m!397723))

(assert (=> b!266708 d!89992))

(declare-fun d!89994 () Bool)

(declare-fun res!222835 () Bool)

(declare-fun e!186758 () Bool)

(assert (=> d!89994 (=> (not res!222835) (not e!186758))))

(assert (=> d!89994 (= res!222835 (= (size!6483 (buf!6951 lt!407426)) (size!6483 (buf!6951 lt!407426))))))

(assert (=> d!89994 (= (isPrefixOf!0 lt!407426 lt!407426) e!186758)))

(declare-fun b!266845 () Bool)

(declare-fun res!222834 () Bool)

(assert (=> b!266845 (=> (not res!222834) (not e!186758))))

(assert (=> b!266845 (= res!222834 (bvsle (bitIndex!0 (size!6483 (buf!6951 lt!407426)) (currentByte!12845 lt!407426) (currentBit!12840 lt!407426)) (bitIndex!0 (size!6483 (buf!6951 lt!407426)) (currentByte!12845 lt!407426) (currentBit!12840 lt!407426))))))

(declare-fun b!266846 () Bool)

(declare-fun e!186757 () Bool)

(assert (=> b!266846 (= e!186758 e!186757)))

(declare-fun res!222833 () Bool)

(assert (=> b!266846 (=> res!222833 e!186757)))

(assert (=> b!266846 (= res!222833 (= (size!6483 (buf!6951 lt!407426)) #b00000000000000000000000000000000))))

(declare-fun b!266847 () Bool)

(assert (=> b!266847 (= e!186757 (arrayBitRangesEq!0 (buf!6951 lt!407426) (buf!6951 lt!407426) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 lt!407426)) (currentByte!12845 lt!407426) (currentBit!12840 lt!407426))))))

(assert (= (and d!89994 res!222835) b!266845))

(assert (= (and b!266845 res!222834) b!266846))

(assert (= (and b!266846 (not res!222833)) b!266847))

(declare-fun m!397759 () Bool)

(assert (=> b!266845 m!397759))

(assert (=> b!266845 m!397759))

(assert (=> b!266847 m!397759))

(assert (=> b!266847 m!397759))

(declare-fun m!397761 () Bool)

(assert (=> b!266847 m!397761))

(assert (=> b!266708 d!89994))

(declare-fun d!90012 () Bool)

(assert (=> d!90012 (isPrefixOf!0 lt!407426 lt!407426)))

(declare-fun lt!407539 () Unit!18947)

(assert (=> d!90012 (= lt!407539 (choose!11 lt!407426))))

(assert (=> d!90012 (= (lemmaIsPrefixRefl!0 lt!407426) lt!407539)))

(declare-fun bs!22862 () Bool)

(assert (= bs!22862 d!90012))

(assert (=> bs!22862 m!397625))

(declare-fun m!397765 () Bool)

(assert (=> bs!22862 m!397765))

(assert (=> b!266708 d!90012))

(declare-fun d!90016 () Bool)

(declare-fun res!222838 () Bool)

(declare-fun e!186760 () Bool)

(assert (=> d!90016 (=> (not res!222838) (not e!186760))))

(assert (=> d!90016 (= res!222838 (= (size!6483 (buf!6951 w1!584)) (size!6483 (buf!6951 w1!584))))))

(assert (=> d!90016 (= (isPrefixOf!0 w1!584 w1!584) e!186760)))

(declare-fun b!266848 () Bool)

(declare-fun res!222837 () Bool)

(assert (=> b!266848 (=> (not res!222837) (not e!186760))))

(assert (=> b!266848 (= res!222837 (bvsle (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)) (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(declare-fun b!266849 () Bool)

(declare-fun e!186759 () Bool)

(assert (=> b!266849 (= e!186760 e!186759)))

(declare-fun res!222836 () Bool)

(assert (=> b!266849 (=> res!222836 e!186759)))

(assert (=> b!266849 (= res!222836 (= (size!6483 (buf!6951 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266850 () Bool)

(assert (=> b!266850 (= e!186759 (arrayBitRangesEq!0 (buf!6951 w1!584) (buf!6951 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(assert (= (and d!90016 res!222838) b!266848))

(assert (= (and b!266848 res!222837) b!266849))

(assert (= (and b!266849 (not res!222836)) b!266850))

(assert (=> b!266848 m!397603))

(assert (=> b!266848 m!397603))

(assert (=> b!266850 m!397603))

(assert (=> b!266850 m!397603))

(declare-fun m!397769 () Bool)

(assert (=> b!266850 m!397769))

(assert (=> b!266708 d!90016))

(declare-fun d!90020 () Bool)

(declare-fun res!222841 () Bool)

(declare-fun e!186762 () Bool)

(assert (=> d!90020 (=> (not res!222841) (not e!186762))))

(assert (=> d!90020 (= res!222841 (= (size!6483 (buf!6951 w2!580)) (size!6483 (buf!6951 w2!580))))))

(assert (=> d!90020 (= (isPrefixOf!0 w2!580 w2!580) e!186762)))

(declare-fun b!266851 () Bool)

(declare-fun res!222840 () Bool)

(assert (=> b!266851 (=> (not res!222840) (not e!186762))))

(assert (=> b!266851 (= res!222840 (bvsle (bitIndex!0 (size!6483 (buf!6951 w2!580)) (currentByte!12845 w2!580) (currentBit!12840 w2!580)) (bitIndex!0 (size!6483 (buf!6951 w2!580)) (currentByte!12845 w2!580) (currentBit!12840 w2!580))))))

(declare-fun b!266852 () Bool)

(declare-fun e!186761 () Bool)

(assert (=> b!266852 (= e!186762 e!186761)))

(declare-fun res!222839 () Bool)

(assert (=> b!266852 (=> res!222839 e!186761)))

(assert (=> b!266852 (= res!222839 (= (size!6483 (buf!6951 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!266853 () Bool)

(assert (=> b!266853 (= e!186761 (arrayBitRangesEq!0 (buf!6951 w2!580) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w2!580)) (currentByte!12845 w2!580) (currentBit!12840 w2!580))))))

(assert (= (and d!90020 res!222841) b!266851))

(assert (= (and b!266851 res!222840) b!266852))

(assert (= (and b!266852 (not res!222839)) b!266853))

(assert (=> b!266851 m!397619))

(assert (=> b!266851 m!397619))

(assert (=> b!266853 m!397619))

(assert (=> b!266853 m!397619))

(declare-fun m!397771 () Bool)

(assert (=> b!266853 m!397771))

(assert (=> b!266708 d!90020))

(declare-fun d!90022 () Bool)

(assert (=> d!90022 (= (array_inv!6207 (buf!6951 w2!580)) (bvsge (size!6483 (buf!6951 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266712 d!90022))

(declare-fun d!90024 () Bool)

(declare-fun res!222844 () Bool)

(declare-fun e!186764 () Bool)

(assert (=> d!90024 (=> (not res!222844) (not e!186764))))

(assert (=> d!90024 (= res!222844 (= (size!6483 (buf!6951 w1!584)) (size!6483 (buf!6951 w2!580))))))

(assert (=> d!90024 (= (isPrefixOf!0 w1!584 w2!580) e!186764)))

(declare-fun b!266854 () Bool)

(declare-fun res!222843 () Bool)

(assert (=> b!266854 (=> (not res!222843) (not e!186764))))

(assert (=> b!266854 (= res!222843 (bvsle (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)) (bitIndex!0 (size!6483 (buf!6951 w2!580)) (currentByte!12845 w2!580) (currentBit!12840 w2!580))))))

(declare-fun b!266855 () Bool)

(declare-fun e!186763 () Bool)

(assert (=> b!266855 (= e!186764 e!186763)))

(declare-fun res!222842 () Bool)

(assert (=> b!266855 (=> res!222842 e!186763)))

(assert (=> b!266855 (= res!222842 (= (size!6483 (buf!6951 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266856 () Bool)

(assert (=> b!266856 (= e!186763 (arrayBitRangesEq!0 (buf!6951 w1!584) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(assert (= (and d!90024 res!222844) b!266854))

(assert (= (and b!266854 res!222843) b!266855))

(assert (= (and b!266855 (not res!222842)) b!266856))

(assert (=> b!266854 m!397603))

(assert (=> b!266854 m!397619))

(assert (=> b!266856 m!397603))

(assert (=> b!266856 m!397603))

(assert (=> b!266856 m!397605))

(assert (=> start!58054 d!90024))

(declare-fun d!90028 () Bool)

(assert (=> d!90028 (= (inv!12 w1!584) (invariant!0 (currentBit!12840 w1!584) (currentByte!12845 w1!584) (size!6483 (buf!6951 w1!584))))))

(declare-fun bs!22865 () Bool)

(assert (= bs!22865 d!90028))

(assert (=> bs!22865 m!397707))

(assert (=> start!58054 d!90028))

(declare-fun d!90030 () Bool)

(assert (=> d!90030 (= (inv!12 w2!580) (invariant!0 (currentBit!12840 w2!580) (currentByte!12845 w2!580) (size!6483 (buf!6951 w2!580))))))

(declare-fun bs!22866 () Bool)

(assert (= bs!22866 d!90030))

(declare-fun m!397791 () Bool)

(assert (=> bs!22866 m!397791))

(assert (=> start!58054 d!90030))

(declare-fun d!90032 () Bool)

(declare-fun res!222852 () Bool)

(declare-fun e!186772 () Bool)

(assert (=> d!90032 (=> (not res!222852) (not e!186772))))

(assert (=> d!90032 (= res!222852 (= (size!6483 (buf!6951 lt!407426)) (size!6483 (buf!6951 w1!584))))))

(assert (=> d!90032 (= (isPrefixOf!0 lt!407426 w1!584) e!186772)))

(declare-fun b!266864 () Bool)

(declare-fun res!222851 () Bool)

(assert (=> b!266864 (=> (not res!222851) (not e!186772))))

(assert (=> b!266864 (= res!222851 (bvsle (bitIndex!0 (size!6483 (buf!6951 lt!407426)) (currentByte!12845 lt!407426) (currentBit!12840 lt!407426)) (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(declare-fun b!266865 () Bool)

(declare-fun e!186771 () Bool)

(assert (=> b!266865 (= e!186772 e!186771)))

(declare-fun res!222850 () Bool)

(assert (=> b!266865 (=> res!222850 e!186771)))

(assert (=> b!266865 (= res!222850 (= (size!6483 (buf!6951 lt!407426)) #b00000000000000000000000000000000))))

(declare-fun b!266866 () Bool)

(assert (=> b!266866 (= e!186771 (arrayBitRangesEq!0 (buf!6951 lt!407426) (buf!6951 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 lt!407426)) (currentByte!12845 lt!407426) (currentBit!12840 lt!407426))))))

(assert (= (and d!90032 res!222852) b!266864))

(assert (= (and b!266864 res!222851) b!266865))

(assert (= (and b!266865 (not res!222850)) b!266866))

(assert (=> b!266864 m!397759))

(assert (=> b!266864 m!397603))

(assert (=> b!266866 m!397759))

(assert (=> b!266866 m!397759))

(declare-fun m!397793 () Bool)

(assert (=> b!266866 m!397793))

(assert (=> b!266710 d!90032))

(declare-fun d!90034 () Bool)

(assert (=> d!90034 (= (array_inv!6207 (buf!6951 w1!584)) (bvsge (size!6483 (buf!6951 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266716 d!90034))

(assert (=> b!266711 d!89966))

(declare-fun d!90036 () Bool)

(assert (=> d!90036 (arrayBitRangesEq!0 (buf!6951 w2!580) (buf!6951 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423)))

(declare-fun lt!407549 () Unit!18947)

(declare-fun choose!8 (array!14868 array!14868 (_ BitVec 64) (_ BitVec 64)) Unit!18947)

(assert (=> d!90036 (= lt!407549 (choose!8 (buf!6951 w1!584) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423))))

(assert (=> d!90036 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423))))

(assert (=> d!90036 (= (arrayBitRangesEqSymmetric!0 (buf!6951 w1!584) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423) lt!407549)))

(declare-fun bs!22867 () Bool)

(assert (= bs!22867 d!90036))

(assert (=> bs!22867 m!397611))

(declare-fun m!397795 () Bool)

(assert (=> bs!22867 m!397795))

(assert (=> b!266711 d!90036))

(declare-fun b!266873 () Bool)

(declare-fun e!186779 () Bool)

(declare-fun e!186780 () Bool)

(assert (=> b!266873 (= e!186779 e!186780)))

(declare-fun res!222861 () Bool)

(assert (=> b!266873 (=> (not res!222861) (not e!186780))))

(declare-fun e!186782 () Bool)

(assert (=> b!266873 (= res!222861 e!186782)))

(declare-fun res!222859 () Bool)

(assert (=> b!266873 (=> res!222859 e!186782)))

(declare-fun lt!407551 () tuple4!392)

(assert (=> b!266873 (= res!222859 (bvsge (_1!12176 lt!407551) (_2!12176 lt!407551)))))

(declare-fun lt!407550 () (_ BitVec 32))

(assert (=> b!266873 (= lt!407550 ((_ extract 31 0) (bvsrem lt!407423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!407552 () (_ BitVec 32))

(assert (=> b!266873 (= lt!407552 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266873 (= lt!407551 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423))))

(declare-fun b!266874 () Bool)

(declare-fun res!222860 () Bool)

(assert (=> b!266874 (= res!222860 (= lt!407550 #b00000000000000000000000000000000))))

(declare-fun e!186781 () Bool)

(assert (=> b!266874 (=> res!222860 e!186781)))

(declare-fun e!186777 () Bool)

(assert (=> b!266874 (= e!186777 e!186781)))

(declare-fun bm!4176 () Bool)

(declare-fun call!4179 () Bool)

(declare-fun c!12301 () Bool)

(assert (=> bm!4176 (= call!4179 (byteRangesEq!0 (select (arr!7470 (buf!6951 w2!580)) (_3!976 lt!407551)) (select (arr!7470 (buf!6951 w1!584)) (_3!976 lt!407551)) lt!407552 (ite c!12301 lt!407550 #b00000000000000000000000000001000)))))

(declare-fun b!266875 () Bool)

(declare-fun e!186778 () Bool)

(assert (=> b!266875 (= e!186778 call!4179)))

(declare-fun d!90038 () Bool)

(declare-fun res!222863 () Bool)

(assert (=> d!90038 (=> res!222863 e!186779)))

(assert (=> d!90038 (= res!222863 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423))))

(assert (=> d!90038 (= (arrayBitRangesEq!0 (buf!6951 w2!580) (buf!6951 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407423) e!186779)))

(declare-fun b!266876 () Bool)

(assert (=> b!266876 (= e!186782 (arrayRangesEq!1032 (buf!6951 w2!580) (buf!6951 w1!584) (_1!12176 lt!407551) (_2!12176 lt!407551)))))

(declare-fun b!266877 () Bool)

(assert (=> b!266877 (= e!186778 e!186777)))

(declare-fun res!222862 () Bool)

(assert (=> b!266877 (= res!222862 call!4179)))

(assert (=> b!266877 (=> (not res!222862) (not e!186777))))

(declare-fun b!266878 () Bool)

(assert (=> b!266878 (= e!186781 (byteRangesEq!0 (select (arr!7470 (buf!6951 w2!580)) (_4!196 lt!407551)) (select (arr!7470 (buf!6951 w1!584)) (_4!196 lt!407551)) #b00000000000000000000000000000000 lt!407550))))

(declare-fun b!266879 () Bool)

(assert (=> b!266879 (= e!186780 e!186778)))

(assert (=> b!266879 (= c!12301 (= (_3!976 lt!407551) (_4!196 lt!407551)))))

(assert (= (and d!90038 (not res!222863)) b!266873))

(assert (= (and b!266873 (not res!222859)) b!266876))

(assert (= (and b!266873 res!222861) b!266879))

(assert (= (and b!266879 c!12301) b!266875))

(assert (= (and b!266879 (not c!12301)) b!266877))

(assert (= (and b!266877 res!222862) b!266874))

(assert (= (and b!266874 (not res!222860)) b!266878))

(assert (= (or b!266875 b!266877) bm!4176))

(declare-fun m!397797 () Bool)

(assert (=> b!266873 m!397797))

(declare-fun m!397799 () Bool)

(assert (=> bm!4176 m!397799))

(declare-fun m!397801 () Bool)

(assert (=> bm!4176 m!397801))

(assert (=> bm!4176 m!397799))

(assert (=> bm!4176 m!397801))

(declare-fun m!397803 () Bool)

(assert (=> bm!4176 m!397803))

(declare-fun m!397805 () Bool)

(assert (=> b!266876 m!397805))

(declare-fun m!397807 () Bool)

(assert (=> b!266878 m!397807))

(declare-fun m!397809 () Bool)

(assert (=> b!266878 m!397809))

(assert (=> b!266878 m!397807))

(assert (=> b!266878 m!397809))

(declare-fun m!397813 () Bool)

(assert (=> b!266878 m!397813))

(assert (=> b!266711 d!90038))

(declare-fun b!266883 () Bool)

(declare-fun e!186787 () Bool)

(declare-fun e!186788 () Bool)

(assert (=> b!266883 (= e!186787 e!186788)))

(declare-fun res!222869 () Bool)

(assert (=> b!266883 (=> (not res!222869) (not e!186788))))

(declare-fun e!186790 () Bool)

(assert (=> b!266883 (= res!222869 e!186790)))

(declare-fun res!222867 () Bool)

(assert (=> b!266883 (=> res!222867 e!186790)))

(declare-fun lt!407554 () tuple4!392)

(assert (=> b!266883 (= res!222867 (bvsge (_1!12176 lt!407554) (_2!12176 lt!407554)))))

(declare-fun lt!407553 () (_ BitVec 32))

(assert (=> b!266883 (= lt!407553 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!407555 () (_ BitVec 32))

(assert (=> b!266883 (= lt!407555 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266883 (= lt!407554 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(declare-fun b!266884 () Bool)

(declare-fun res!222868 () Bool)

(assert (=> b!266884 (= res!222868 (= lt!407553 #b00000000000000000000000000000000))))

(declare-fun e!186789 () Bool)

(assert (=> b!266884 (=> res!222868 e!186789)))

(declare-fun e!186785 () Bool)

(assert (=> b!266884 (= e!186785 e!186789)))

(declare-fun call!4180 () Bool)

(declare-fun c!12302 () Bool)

(declare-fun bm!4177 () Bool)

(assert (=> bm!4177 (= call!4180 (byteRangesEq!0 (select (arr!7470 (buf!6951 w2!580)) (_3!976 lt!407554)) (select (arr!7470 (buf!6951 w1!584)) (_3!976 lt!407554)) lt!407555 (ite c!12302 lt!407553 #b00000000000000000000000000001000)))))

(declare-fun b!266885 () Bool)

(declare-fun e!186786 () Bool)

(assert (=> b!266885 (= e!186786 call!4180)))

(declare-fun d!90040 () Bool)

(declare-fun res!222871 () Bool)

(assert (=> d!90040 (=> res!222871 e!186787)))

(assert (=> d!90040 (= res!222871 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))))))

(assert (=> d!90040 (= (arrayBitRangesEq!0 (buf!6951 w2!580) (buf!6951 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 w1!584)) (currentByte!12845 w1!584) (currentBit!12840 w1!584))) e!186787)))

(declare-fun b!266886 () Bool)

(assert (=> b!266886 (= e!186790 (arrayRangesEq!1032 (buf!6951 w2!580) (buf!6951 w1!584) (_1!12176 lt!407554) (_2!12176 lt!407554)))))

(declare-fun b!266887 () Bool)

(assert (=> b!266887 (= e!186786 e!186785)))

(declare-fun res!222870 () Bool)

(assert (=> b!266887 (= res!222870 call!4180)))

(assert (=> b!266887 (=> (not res!222870) (not e!186785))))

(declare-fun b!266888 () Bool)

(assert (=> b!266888 (= e!186789 (byteRangesEq!0 (select (arr!7470 (buf!6951 w2!580)) (_4!196 lt!407554)) (select (arr!7470 (buf!6951 w1!584)) (_4!196 lt!407554)) #b00000000000000000000000000000000 lt!407553))))

(declare-fun b!266889 () Bool)

(assert (=> b!266889 (= e!186788 e!186786)))

(assert (=> b!266889 (= c!12302 (= (_3!976 lt!407554) (_4!196 lt!407554)))))

(assert (= (and d!90040 (not res!222871)) b!266883))

(assert (= (and b!266883 (not res!222867)) b!266886))

(assert (= (and b!266883 res!222869) b!266889))

(assert (= (and b!266889 c!12302) b!266885))

(assert (= (and b!266889 (not c!12302)) b!266887))

(assert (= (and b!266887 res!222870) b!266884))

(assert (= (and b!266884 (not res!222868)) b!266888))

(assert (= (or b!266885 b!266887) bm!4177))

(assert (=> b!266883 m!397603))

(assert (=> b!266883 m!397659))

(declare-fun m!397819 () Bool)

(assert (=> bm!4177 m!397819))

(declare-fun m!397821 () Bool)

(assert (=> bm!4177 m!397821))

(assert (=> bm!4177 m!397819))

(assert (=> bm!4177 m!397821))

(declare-fun m!397823 () Bool)

(assert (=> bm!4177 m!397823))

(declare-fun m!397825 () Bool)

(assert (=> b!266886 m!397825))

(declare-fun m!397827 () Bool)

(assert (=> b!266888 m!397827))

(declare-fun m!397829 () Bool)

(assert (=> b!266888 m!397829))

(assert (=> b!266888 m!397827))

(assert (=> b!266888 m!397829))

(declare-fun m!397831 () Bool)

(assert (=> b!266888 m!397831))

(assert (=> b!266714 d!90040))

(assert (=> b!266714 d!89966))

(declare-fun d!90046 () Bool)

(declare-fun e!186793 () Bool)

(assert (=> d!90046 e!186793))

(declare-fun res!222876 () Bool)

(assert (=> d!90046 (=> (not res!222876) (not e!186793))))

(declare-fun lt!407559 () (_ BitVec 64))

(declare-fun lt!407560 () (_ BitVec 64))

(declare-fun lt!407562 () (_ BitVec 64))

(assert (=> d!90046 (= res!222876 (= lt!407562 (bvsub lt!407560 lt!407559)))))

(assert (=> d!90046 (or (= (bvand lt!407560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407559 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407560 lt!407559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90046 (= lt!407559 (remainingBits!0 ((_ sign_extend 32) (size!6483 (buf!6951 w2!580))) ((_ sign_extend 32) (currentByte!12845 w2!580)) ((_ sign_extend 32) (currentBit!12840 w2!580))))))

(declare-fun lt!407561 () (_ BitVec 64))

(declare-fun lt!407557 () (_ BitVec 64))

(assert (=> d!90046 (= lt!407560 (bvmul lt!407561 lt!407557))))

(assert (=> d!90046 (or (= lt!407561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407557 (bvsdiv (bvmul lt!407561 lt!407557) lt!407561)))))

(assert (=> d!90046 (= lt!407557 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90046 (= lt!407561 ((_ sign_extend 32) (size!6483 (buf!6951 w2!580))))))

(assert (=> d!90046 (= lt!407562 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12845 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12840 w2!580))))))

(assert (=> d!90046 (invariant!0 (currentBit!12840 w2!580) (currentByte!12845 w2!580) (size!6483 (buf!6951 w2!580)))))

(assert (=> d!90046 (= (bitIndex!0 (size!6483 (buf!6951 w2!580)) (currentByte!12845 w2!580) (currentBit!12840 w2!580)) lt!407562)))

(declare-fun b!266893 () Bool)

(declare-fun res!222875 () Bool)

(assert (=> b!266893 (=> (not res!222875) (not e!186793))))

(assert (=> b!266893 (= res!222875 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407562))))

(declare-fun b!266894 () Bool)

(declare-fun lt!407558 () (_ BitVec 64))

(assert (=> b!266894 (= e!186793 (bvsle lt!407562 (bvmul lt!407558 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266894 (or (= lt!407558 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407558 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407558)))))

(assert (=> b!266894 (= lt!407558 ((_ sign_extend 32) (size!6483 (buf!6951 w2!580))))))

(assert (= (and d!90046 res!222876) b!266893))

(assert (= (and b!266893 res!222875) b!266894))

(declare-fun m!397833 () Bool)

(assert (=> d!90046 m!397833))

(assert (=> d!90046 m!397791))

(assert (=> b!266709 d!90046))

(declare-fun d!90048 () Bool)

(declare-fun res!222879 () Bool)

(declare-fun e!186795 () Bool)

(assert (=> d!90048 (=> (not res!222879) (not e!186795))))

(assert (=> d!90048 (= res!222879 (= (size!6483 (buf!6951 lt!407426)) (size!6483 (buf!6951 w2!580))))))

(assert (=> d!90048 (= (isPrefixOf!0 lt!407426 w2!580) e!186795)))

(declare-fun b!266895 () Bool)

(declare-fun res!222878 () Bool)

(assert (=> b!266895 (=> (not res!222878) (not e!186795))))

(assert (=> b!266895 (= res!222878 (bvsle (bitIndex!0 (size!6483 (buf!6951 lt!407426)) (currentByte!12845 lt!407426) (currentBit!12840 lt!407426)) (bitIndex!0 (size!6483 (buf!6951 w2!580)) (currentByte!12845 w2!580) (currentBit!12840 w2!580))))))

(declare-fun b!266896 () Bool)

(declare-fun e!186794 () Bool)

(assert (=> b!266896 (= e!186795 e!186794)))

(declare-fun res!222877 () Bool)

(assert (=> b!266896 (=> res!222877 e!186794)))

(assert (=> b!266896 (= res!222877 (= (size!6483 (buf!6951 lt!407426)) #b00000000000000000000000000000000))))

(declare-fun b!266897 () Bool)

(assert (=> b!266897 (= e!186794 (arrayBitRangesEq!0 (buf!6951 lt!407426) (buf!6951 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6483 (buf!6951 lt!407426)) (currentByte!12845 lt!407426) (currentBit!12840 lt!407426))))))

(assert (= (and d!90048 res!222879) b!266895))

(assert (= (and b!266895 res!222878) b!266896))

(assert (= (and b!266896 (not res!222877)) b!266897))

(assert (=> b!266895 m!397759))

(assert (=> b!266895 m!397619))

(assert (=> b!266897 m!397759))

(assert (=> b!266897 m!397759))

(declare-fun m!397837 () Bool)

(assert (=> b!266897 m!397837))

(assert (=> b!266709 d!90048))

(declare-fun d!90052 () Bool)

(assert (=> d!90052 (isPrefixOf!0 lt!407426 w2!580)))

(declare-fun lt!407565 () Unit!18947)

(declare-fun choose!30 (BitStream!11780 BitStream!11780 BitStream!11780) Unit!18947)

(assert (=> d!90052 (= lt!407565 (choose!30 lt!407426 w2!580 w2!580))))

(assert (=> d!90052 (isPrefixOf!0 lt!407426 w2!580)))

(assert (=> d!90052 (= (lemmaIsPrefixTransitive!0 lt!407426 w2!580 w2!580) lt!407565)))

(declare-fun bs!22869 () Bool)

(assert (= bs!22869 d!90052))

(assert (=> bs!22869 m!397621))

(declare-fun m!397841 () Bool)

(assert (=> bs!22869 m!397841))

(assert (=> bs!22869 m!397621))

(assert (=> b!266709 d!90052))

(declare-fun d!90058 () Bool)

(assert (=> d!90058 (isPrefixOf!0 lt!407426 w2!580)))

(declare-fun lt!407566 () Unit!18947)

(assert (=> d!90058 (= lt!407566 (choose!30 lt!407426 w1!584 w2!580))))

(assert (=> d!90058 (isPrefixOf!0 lt!407426 w1!584)))

(assert (=> d!90058 (= (lemmaIsPrefixTransitive!0 lt!407426 w1!584 w2!580) lt!407566)))

(declare-fun bs!22870 () Bool)

(assert (= bs!22870 d!90058))

(assert (=> bs!22870 m!397621))

(declare-fun m!397843 () Bool)

(assert (=> bs!22870 m!397843))

(assert (=> bs!22870 m!397607))

(assert (=> b!266709 d!90058))

(assert (=> b!266709 d!89966))

(push 1)

(assert (not b!266845))

(assert (not d!89966))

(assert (not b!266759))

(assert (not b!266895))

(assert (not b!266897))

(assert (not b!266853))

(assert (not d!90012))

(assert (not bm!4177))

(assert (not d!89992))

(assert (not d!90030))

(assert (not b!266888))

(assert (not d!89982))

(assert (not b!266883))

(assert (not b!266850))

(assert (not d!90058))

(assert (not b!266864))

(assert (not d!90046))

(assert (not d!90052))

(assert (not b!266873))

(assert (not bm!4176))

(assert (not b!266856))

(assert (not d!90036))

(assert (not b!266866))

(assert (not b!266764))

(assert (not b!266847))

(assert (not b!266848))

(assert (not b!266876))

(assert (not b!266851))

(assert (not b!266854))

(assert (not b!266886))

(assert (not b!266762))

(assert (not d!90028))

(assert (not b!266878))

(assert (not bm!4169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

