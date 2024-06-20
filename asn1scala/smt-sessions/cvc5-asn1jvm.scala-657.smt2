; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18448 () Bool)

(assert start!18448)

(declare-fun b!91613 () Bool)

(declare-fun e!60223 () Bool)

(declare-datatypes ((array!4281 0))(
  ( (array!4282 (arr!2565 (Array (_ BitVec 32) (_ BitVec 8))) (size!1928 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3418 0))(
  ( (BitStream!3419 (buf!2318 array!4281) (currentByte!4617 (_ BitVec 32)) (currentBit!4612 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3418)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91613 (= e!60223 (not (invariant!0 (currentBit!4612 base!8) (currentByte!4617 base!8) (size!1928 (buf!2318 base!8)))))))

(declare-fun b!91614 () Bool)

(declare-fun res!75647 () Bool)

(assert (=> b!91614 (=> (not res!75647) (not e!60223))))

(declare-fun bitStream2!8 () BitStream!3418)

(declare-fun isPrefixOf!0 (BitStream!3418 BitStream!3418) Bool)

(assert (=> b!91614 (= res!75647 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91615 () Bool)

(declare-fun res!75649 () Bool)

(assert (=> b!91615 (=> (not res!75649) (not e!60223))))

(declare-fun bitStream1!8 () BitStream!3418)

(assert (=> b!91615 (= res!75649 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!91616 () Bool)

(declare-fun e!60222 () Bool)

(declare-fun array_inv!1774 (array!4281) Bool)

(assert (=> b!91616 (= e!60222 (array_inv!1774 (buf!2318 bitStream1!8)))))

(declare-fun b!91617 () Bool)

(declare-fun e!60219 () Bool)

(assert (=> b!91617 (= e!60219 (array_inv!1774 (buf!2318 base!8)))))

(declare-fun res!75645 () Bool)

(assert (=> start!18448 (=> (not res!75645) (not e!60223))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18448 (= res!75645 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18448 e!60223))

(assert (=> start!18448 true))

(declare-fun inv!12 (BitStream!3418) Bool)

(assert (=> start!18448 (and (inv!12 bitStream1!8) e!60222)))

(declare-fun e!60221 () Bool)

(assert (=> start!18448 (and (inv!12 bitStream2!8) e!60221)))

(assert (=> start!18448 (and (inv!12 base!8) e!60219)))

(declare-fun b!91618 () Bool)

(declare-fun res!75646 () Bool)

(assert (=> b!91618 (=> (not res!75646) (not e!60223))))

(declare-datatypes ((List!815 0))(
  ( (Nil!812) (Cons!811 (h!930 Bool) (t!1565 List!815)) )
))
(declare-fun listBits!13 () List!815)

(declare-fun length!406 (List!815) Int)

(assert (=> b!91618 (= res!75646 (> (length!406 listBits!13) 0))))

(declare-fun b!91619 () Bool)

(declare-fun res!75648 () Bool)

(assert (=> b!91619 (=> (not res!75648) (not e!60223))))

(assert (=> b!91619 (= res!75648 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91620 () Bool)

(assert (=> b!91620 (= e!60221 (array_inv!1774 (buf!2318 bitStream2!8)))))

(declare-fun b!91621 () Bool)

(declare-fun res!75644 () Bool)

(assert (=> b!91621 (=> (not res!75644) (not e!60223))))

(assert (=> b!91621 (= res!75644 (and (= (buf!2318 bitStream1!8) (buf!2318 bitStream2!8)) (= (buf!2318 bitStream1!8) (buf!2318 base!8))))))

(assert (= (and start!18448 res!75645) b!91618))

(assert (= (and b!91618 res!75646) b!91619))

(assert (= (and b!91619 res!75648) b!91614))

(assert (= (and b!91614 res!75647) b!91615))

(assert (= (and b!91615 res!75649) b!91621))

(assert (= (and b!91621 res!75644) b!91613))

(assert (= start!18448 b!91616))

(assert (= start!18448 b!91620))

(assert (= start!18448 b!91617))

(declare-fun m!135725 () Bool)

(assert (=> b!91617 m!135725))

(declare-fun m!135727 () Bool)

(assert (=> b!91620 m!135727))

(declare-fun m!135729 () Bool)

(assert (=> b!91613 m!135729))

(declare-fun m!135731 () Bool)

(assert (=> start!18448 m!135731))

(declare-fun m!135733 () Bool)

(assert (=> start!18448 m!135733))

(declare-fun m!135735 () Bool)

(assert (=> start!18448 m!135735))

(declare-fun m!135737 () Bool)

(assert (=> b!91618 m!135737))

(declare-fun m!135739 () Bool)

(assert (=> b!91614 m!135739))

(declare-fun m!135741 () Bool)

(assert (=> b!91615 m!135741))

(declare-fun m!135743 () Bool)

(assert (=> b!91619 m!135743))

(declare-fun m!135745 () Bool)

(assert (=> b!91616 m!135745))

(push 1)

(assert (not b!91620))

(assert (not b!91616))

(assert (not b!91613))

(assert (not b!91614))

(assert (not b!91617))

(assert (not b!91615))

(assert (not b!91619))

(assert (not start!18448))

(assert (not b!91618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28484 () Bool)

(assert (=> d!28484 (= (array_inv!1774 (buf!2318 bitStream1!8)) (bvsge (size!1928 (buf!2318 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91616 d!28484))

(declare-fun d!28488 () Bool)

(assert (=> d!28488 (= (array_inv!1774 (buf!2318 base!8)) (bvsge (size!1928 (buf!2318 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91617 d!28488))

(declare-fun d!28490 () Bool)

(assert (=> d!28490 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4612 bitStream1!8) (currentByte!4617 bitStream1!8) (size!1928 (buf!2318 bitStream1!8))))))

(declare-fun bs!7031 () Bool)

(assert (= bs!7031 d!28490))

(declare-fun m!135791 () Bool)

(assert (=> bs!7031 m!135791))

(assert (=> start!18448 d!28490))

(declare-fun d!28492 () Bool)

(assert (=> d!28492 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4612 bitStream2!8) (currentByte!4617 bitStream2!8) (size!1928 (buf!2318 bitStream2!8))))))

(declare-fun bs!7032 () Bool)

(assert (= bs!7032 d!28492))

(declare-fun m!135793 () Bool)

(assert (=> bs!7032 m!135793))

(assert (=> start!18448 d!28492))

(declare-fun d!28494 () Bool)

(assert (=> d!28494 (= (inv!12 base!8) (invariant!0 (currentBit!4612 base!8) (currentByte!4617 base!8) (size!1928 (buf!2318 base!8))))))

(declare-fun bs!7033 () Bool)

(assert (= bs!7033 d!28494))

(assert (=> bs!7033 m!135729))

(assert (=> start!18448 d!28494))

(declare-fun d!28496 () Bool)

(declare-fun res!75708 () Bool)

(declare-fun e!60282 () Bool)

(assert (=> d!28496 (=> (not res!75708) (not e!60282))))

(assert (=> d!28496 (= res!75708 (= (size!1928 (buf!2318 bitStream1!8)) (size!1928 (buf!2318 base!8))))))

(assert (=> d!28496 (= (isPrefixOf!0 bitStream1!8 base!8) e!60282)))

(declare-fun b!91697 () Bool)

(declare-fun res!75709 () Bool)

(assert (=> b!91697 (=> (not res!75709) (not e!60282))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91697 (= res!75709 (bvsle (bitIndex!0 (size!1928 (buf!2318 bitStream1!8)) (currentByte!4617 bitStream1!8) (currentBit!4612 bitStream1!8)) (bitIndex!0 (size!1928 (buf!2318 base!8)) (currentByte!4617 base!8) (currentBit!4612 base!8))))))

(declare-fun b!91698 () Bool)

(declare-fun e!60283 () Bool)

(assert (=> b!91698 (= e!60282 e!60283)))

(declare-fun res!75707 () Bool)

(assert (=> b!91698 (=> res!75707 e!60283)))

(assert (=> b!91698 (= res!75707 (= (size!1928 (buf!2318 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91699 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4281 array!4281 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91699 (= e!60283 (arrayBitRangesEq!0 (buf!2318 bitStream1!8) (buf!2318 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1928 (buf!2318 bitStream1!8)) (currentByte!4617 bitStream1!8) (currentBit!4612 bitStream1!8))))))

(assert (= (and d!28496 res!75708) b!91697))

(assert (= (and b!91697 res!75709) b!91698))

(assert (= (and b!91698 (not res!75707)) b!91699))

(declare-fun m!135805 () Bool)

(assert (=> b!91697 m!135805))

(declare-fun m!135807 () Bool)

(assert (=> b!91697 m!135807))

(assert (=> b!91699 m!135805))

(assert (=> b!91699 m!135805))

(declare-fun m!135811 () Bool)

(assert (=> b!91699 m!135811))

(assert (=> b!91619 d!28496))

(declare-fun d!28506 () Bool)

(declare-fun size!1931 (List!815) Int)

(assert (=> d!28506 (= (length!406 listBits!13) (size!1931 listBits!13))))

(declare-fun bs!7037 () Bool)

(assert (= bs!7037 d!28506))

(declare-fun m!135815 () Bool)

(assert (=> bs!7037 m!135815))

(assert (=> b!91618 d!28506))

(declare-fun d!28512 () Bool)

(assert (=> d!28512 (= (invariant!0 (currentBit!4612 base!8) (currentByte!4617 base!8) (size!1928 (buf!2318 base!8))) (and (bvsge (currentBit!4612 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4612 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4617 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4617 base!8) (size!1928 (buf!2318 base!8))) (and (= (currentBit!4612 base!8) #b00000000000000000000000000000000) (= (currentByte!4617 base!8) (size!1928 (buf!2318 base!8)))))))))

(assert (=> b!91613 d!28512))

(declare-fun d!28516 () Bool)

(assert (=> d!28516 (= (array_inv!1774 (buf!2318 bitStream2!8)) (bvsge (size!1928 (buf!2318 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91620 d!28516))

(declare-fun d!28518 () Bool)

(declare-fun res!75717 () Bool)

(declare-fun e!60288 () Bool)

(assert (=> d!28518 (=> (not res!75717) (not e!60288))))

(assert (=> d!28518 (= res!75717 (= (size!1928 (buf!2318 bitStream1!8)) (size!1928 (buf!2318 bitStream2!8))))))

(assert (=> d!28518 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60288)))

(declare-fun b!91706 () Bool)

(declare-fun res!75718 () Bool)

(assert (=> b!91706 (=> (not res!75718) (not e!60288))))

(assert (=> b!91706 (= res!75718 (bvsle (bitIndex!0 (size!1928 (buf!2318 bitStream1!8)) (currentByte!4617 bitStream1!8) (currentBit!4612 bitStream1!8)) (bitIndex!0 (size!1928 (buf!2318 bitStream2!8)) (currentByte!4617 bitStream2!8) (currentBit!4612 bitStream2!8))))))

(declare-fun b!91707 () Bool)

(declare-fun e!60289 () Bool)

(assert (=> b!91707 (= e!60288 e!60289)))

(declare-fun res!75716 () Bool)

(assert (=> b!91707 (=> res!75716 e!60289)))

(assert (=> b!91707 (= res!75716 (= (size!1928 (buf!2318 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91708 () Bool)

(assert (=> b!91708 (= e!60289 (arrayBitRangesEq!0 (buf!2318 bitStream1!8) (buf!2318 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1928 (buf!2318 bitStream1!8)) (currentByte!4617 bitStream1!8) (currentBit!4612 bitStream1!8))))))

(assert (= (and d!28518 res!75717) b!91706))

(assert (= (and b!91706 res!75718) b!91707))

(assert (= (and b!91707 (not res!75716)) b!91708))

(assert (=> b!91706 m!135805))

(declare-fun m!135825 () Bool)

(assert (=> b!91706 m!135825))

(assert (=> b!91708 m!135805))

(assert (=> b!91708 m!135805))

(declare-fun m!135827 () Bool)

(assert (=> b!91708 m!135827))

(assert (=> b!91615 d!28518))

(declare-fun d!28526 () Bool)

(declare-fun res!75720 () Bool)

(declare-fun e!60290 () Bool)

(assert (=> d!28526 (=> (not res!75720) (not e!60290))))

(assert (=> d!28526 (= res!75720 (= (size!1928 (buf!2318 bitStream2!8)) (size!1928 (buf!2318 base!8))))))

(assert (=> d!28526 (= (isPrefixOf!0 bitStream2!8 base!8) e!60290)))

(declare-fun b!91709 () Bool)

(declare-fun res!75721 () Bool)

(assert (=> b!91709 (=> (not res!75721) (not e!60290))))

(assert (=> b!91709 (= res!75721 (bvsle (bitIndex!0 (size!1928 (buf!2318 bitStream2!8)) (currentByte!4617 bitStream2!8) (currentBit!4612 bitStream2!8)) (bitIndex!0 (size!1928 (buf!2318 base!8)) (currentByte!4617 base!8) (currentBit!4612 base!8))))))

(declare-fun b!91710 () Bool)

(declare-fun e!60291 () Bool)

(assert (=> b!91710 (= e!60290 e!60291)))

(declare-fun res!75719 () Bool)

(assert (=> b!91710 (=> res!75719 e!60291)))

(assert (=> b!91710 (= res!75719 (= (size!1928 (buf!2318 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91711 () Bool)

(assert (=> b!91711 (= e!60291 (arrayBitRangesEq!0 (buf!2318 bitStream2!8) (buf!2318 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1928 (buf!2318 bitStream2!8)) (currentByte!4617 bitStream2!8) (currentBit!4612 bitStream2!8))))))

(assert (= (and d!28526 res!75720) b!91709))

(assert (= (and b!91709 res!75721) b!91710))

(assert (= (and b!91710 (not res!75719)) b!91711))

(assert (=> b!91709 m!135825))

(assert (=> b!91709 m!135807))

(assert (=> b!91711 m!135825))

(assert (=> b!91711 m!135825))

(declare-fun m!135829 () Bool)

(assert (=> b!91711 m!135829))

(assert (=> b!91614 d!28526))

(push 1)

(assert (not b!91711))

(assert (not d!28492))

(assert (not b!91697))

(assert (not d!28490))

(assert (not b!91709))

(assert (not d!28494))

(assert (not b!91708))

(assert (not d!28506))

(assert (not b!91699))

(assert (not b!91706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

