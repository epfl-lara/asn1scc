; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18452 () Bool)

(assert start!18452)

(declare-fun b!91667 () Bool)

(declare-fun res!75685 () Bool)

(declare-fun e!60263 () Bool)

(assert (=> b!91667 (=> (not res!75685) (not e!60263))))

(declare-datatypes ((array!4285 0))(
  ( (array!4286 (arr!2567 (Array (_ BitVec 32) (_ BitVec 8))) (size!1930 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3422 0))(
  ( (BitStream!3423 (buf!2320 array!4285) (currentByte!4619 (_ BitVec 32)) (currentBit!4614 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3422)

(declare-fun base!8 () BitStream!3422)

(declare-fun isPrefixOf!0 (BitStream!3422 BitStream!3422) Bool)

(assert (=> b!91667 (= res!75685 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91668 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91668 (= e!60263 (not (invariant!0 (currentBit!4614 base!8) (currentByte!4619 base!8) (size!1930 (buf!2320 base!8)))))))

(declare-fun b!91669 () Bool)

(declare-fun res!75681 () Bool)

(assert (=> b!91669 (=> (not res!75681) (not e!60263))))

(declare-datatypes ((List!817 0))(
  ( (Nil!814) (Cons!813 (h!932 Bool) (t!1567 List!817)) )
))
(declare-fun listBits!13 () List!817)

(declare-fun length!408 (List!817) Int)

(assert (=> b!91669 (= res!75681 (> (length!408 listBits!13) 0))))

(declare-fun b!91670 () Bool)

(declare-fun res!75684 () Bool)

(assert (=> b!91670 (=> (not res!75684) (not e!60263))))

(declare-fun bitStream1!8 () BitStream!3422)

(assert (=> b!91670 (= res!75684 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!91671 () Bool)

(declare-fun res!75682 () Bool)

(assert (=> b!91671 (=> (not res!75682) (not e!60263))))

(assert (=> b!91671 (= res!75682 (and (= (buf!2320 bitStream1!8) (buf!2320 bitStream2!8)) (= (buf!2320 bitStream1!8) (buf!2320 base!8))))))

(declare-fun res!75680 () Bool)

(assert (=> start!18452 (=> (not res!75680) (not e!60263))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18452 (= res!75680 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18452 e!60263))

(assert (=> start!18452 true))

(declare-fun e!60262 () Bool)

(declare-fun inv!12 (BitStream!3422) Bool)

(assert (=> start!18452 (and (inv!12 bitStream1!8) e!60262)))

(declare-fun e!60264 () Bool)

(assert (=> start!18452 (and (inv!12 bitStream2!8) e!60264)))

(declare-fun e!60267 () Bool)

(assert (=> start!18452 (and (inv!12 base!8) e!60267)))

(declare-fun b!91672 () Bool)

(declare-fun res!75683 () Bool)

(assert (=> b!91672 (=> (not res!75683) (not e!60263))))

(assert (=> b!91672 (= res!75683 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91673 () Bool)

(declare-fun array_inv!1776 (array!4285) Bool)

(assert (=> b!91673 (= e!60264 (array_inv!1776 (buf!2320 bitStream2!8)))))

(declare-fun b!91674 () Bool)

(assert (=> b!91674 (= e!60262 (array_inv!1776 (buf!2320 bitStream1!8)))))

(declare-fun b!91675 () Bool)

(assert (=> b!91675 (= e!60267 (array_inv!1776 (buf!2320 base!8)))))

(assert (= (and start!18452 res!75680) b!91669))

(assert (= (and b!91669 res!75681) b!91672))

(assert (= (and b!91672 res!75683) b!91667))

(assert (= (and b!91667 res!75685) b!91670))

(assert (= (and b!91670 res!75684) b!91671))

(assert (= (and b!91671 res!75682) b!91668))

(assert (= start!18452 b!91674))

(assert (= start!18452 b!91673))

(assert (= start!18452 b!91675))

(declare-fun m!135769 () Bool)

(assert (=> b!91674 m!135769))

(declare-fun m!135771 () Bool)

(assert (=> b!91667 m!135771))

(declare-fun m!135773 () Bool)

(assert (=> b!91672 m!135773))

(declare-fun m!135775 () Bool)

(assert (=> b!91673 m!135775))

(declare-fun m!135777 () Bool)

(assert (=> b!91669 m!135777))

(declare-fun m!135779 () Bool)

(assert (=> start!18452 m!135779))

(declare-fun m!135781 () Bool)

(assert (=> start!18452 m!135781))

(declare-fun m!135783 () Bool)

(assert (=> start!18452 m!135783))

(declare-fun m!135785 () Bool)

(assert (=> b!91668 m!135785))

(declare-fun m!135787 () Bool)

(assert (=> b!91670 m!135787))

(declare-fun m!135789 () Bool)

(assert (=> b!91675 m!135789))

(push 1)

(assert (not b!91667))

(assert (not b!91669))

(assert (not b!91675))

(assert (not b!91674))

(assert (not start!18452))

(assert (not b!91670))

(assert (not b!91672))

(assert (not b!91673))

(assert (not b!91668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28486 () Bool)

(declare-fun res!75698 () Bool)

(declare-fun e!60274 () Bool)

(assert (=> d!28486 (=> (not res!75698) (not e!60274))))

(assert (=> d!28486 (= res!75698 (= (size!1930 (buf!2320 bitStream2!8)) (size!1930 (buf!2320 base!8))))))

(assert (=> d!28486 (= (isPrefixOf!0 bitStream2!8 base!8) e!60274)))

(declare-fun b!91684 () Bool)

(declare-fun res!75697 () Bool)

(assert (=> b!91684 (=> (not res!75697) (not e!60274))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91684 (= res!75697 (bvsle (bitIndex!0 (size!1930 (buf!2320 bitStream2!8)) (currentByte!4619 bitStream2!8) (currentBit!4614 bitStream2!8)) (bitIndex!0 (size!1930 (buf!2320 base!8)) (currentByte!4619 base!8) (currentBit!4614 base!8))))))

(declare-fun b!91685 () Bool)

(declare-fun e!60275 () Bool)

(assert (=> b!91685 (= e!60274 e!60275)))

(declare-fun res!75696 () Bool)

(assert (=> b!91685 (=> res!75696 e!60275)))

(assert (=> b!91685 (= res!75696 (= (size!1930 (buf!2320 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91686 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4285 array!4285 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91686 (= e!60275 (arrayBitRangesEq!0 (buf!2320 bitStream2!8) (buf!2320 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1930 (buf!2320 bitStream2!8)) (currentByte!4619 bitStream2!8) (currentBit!4614 bitStream2!8))))))

(assert (= (and d!28486 res!75698) b!91684))

(assert (= (and b!91684 res!75697) b!91685))

(assert (= (and b!91685 (not res!75696)) b!91686))

(declare-fun m!135795 () Bool)

(assert (=> b!91684 m!135795))

(declare-fun m!135797 () Bool)

(assert (=> b!91684 m!135797))

(assert (=> b!91686 m!135795))

(assert (=> b!91686 m!135795))

(declare-fun m!135799 () Bool)

(assert (=> b!91686 m!135799))

(assert (=> b!91667 d!28486))

(declare-fun d!28498 () Bool)

(assert (=> d!28498 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4614 bitStream1!8) (currentByte!4619 bitStream1!8) (size!1930 (buf!2320 bitStream1!8))))))

(declare-fun bs!7034 () Bool)

(assert (= bs!7034 d!28498))

(declare-fun m!135801 () Bool)

(assert (=> bs!7034 m!135801))

(assert (=> start!18452 d!28498))

(declare-fun d!28500 () Bool)

(assert (=> d!28500 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4614 bitStream2!8) (currentByte!4619 bitStream2!8) (size!1930 (buf!2320 bitStream2!8))))))

(declare-fun bs!7035 () Bool)

(assert (= bs!7035 d!28500))

(declare-fun m!135803 () Bool)

(assert (=> bs!7035 m!135803))

(assert (=> start!18452 d!28500))

(declare-fun d!28502 () Bool)

(assert (=> d!28502 (= (inv!12 base!8) (invariant!0 (currentBit!4614 base!8) (currentByte!4619 base!8) (size!1930 (buf!2320 base!8))))))

(declare-fun bs!7036 () Bool)

(assert (= bs!7036 d!28502))

(assert (=> bs!7036 m!135785))

(assert (=> start!18452 d!28502))

(declare-fun d!28504 () Bool)

(declare-fun res!75712 () Bool)

(declare-fun e!60284 () Bool)

(assert (=> d!28504 (=> (not res!75712) (not e!60284))))

(assert (=> d!28504 (= res!75712 (= (size!1930 (buf!2320 bitStream1!8)) (size!1930 (buf!2320 base!8))))))

(assert (=> d!28504 (= (isPrefixOf!0 bitStream1!8 base!8) e!60284)))

(declare-fun b!91700 () Bool)

(declare-fun res!75711 () Bool)

(assert (=> b!91700 (=> (not res!75711) (not e!60284))))

(assert (=> b!91700 (= res!75711 (bvsle (bitIndex!0 (size!1930 (buf!2320 bitStream1!8)) (currentByte!4619 bitStream1!8) (currentBit!4614 bitStream1!8)) (bitIndex!0 (size!1930 (buf!2320 base!8)) (currentByte!4619 base!8) (currentBit!4614 base!8))))))

(declare-fun b!91701 () Bool)

(declare-fun e!60285 () Bool)

(assert (=> b!91701 (= e!60284 e!60285)))

(declare-fun res!75710 () Bool)

(assert (=> b!91701 (=> res!75710 e!60285)))

(assert (=> b!91701 (= res!75710 (= (size!1930 (buf!2320 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91702 () Bool)

(assert (=> b!91702 (= e!60285 (arrayBitRangesEq!0 (buf!2320 bitStream1!8) (buf!2320 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1930 (buf!2320 bitStream1!8)) (currentByte!4619 bitStream1!8) (currentBit!4614 bitStream1!8))))))

(assert (= (and d!28504 res!75712) b!91700))

(assert (= (and b!91700 res!75711) b!91701))

(assert (= (and b!91701 (not res!75710)) b!91702))

(declare-fun m!135809 () Bool)

(assert (=> b!91700 m!135809))

(assert (=> b!91700 m!135797))

(assert (=> b!91702 m!135809))

(assert (=> b!91702 m!135809))

(declare-fun m!135813 () Bool)

(assert (=> b!91702 m!135813))

(assert (=> b!91672 d!28504))

(declare-fun d!28508 () Bool)

(assert (=> d!28508 (= (array_inv!1776 (buf!2320 bitStream2!8)) (bvsge (size!1930 (buf!2320 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91673 d!28508))

(declare-fun d!28510 () Bool)

(assert (=> d!28510 (= (invariant!0 (currentBit!4614 base!8) (currentByte!4619 base!8) (size!1930 (buf!2320 base!8))) (and (bvsge (currentBit!4614 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4614 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4619 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4619 base!8) (size!1930 (buf!2320 base!8))) (and (= (currentBit!4614 base!8) #b00000000000000000000000000000000) (= (currentByte!4619 base!8) (size!1930 (buf!2320 base!8)))))))))

(assert (=> b!91668 d!28510))

(declare-fun d!28514 () Bool)

(declare-fun size!1932 (List!817) Int)

(assert (=> d!28514 (= (length!408 listBits!13) (size!1932 listBits!13))))

(declare-fun bs!7038 () Bool)

(assert (= bs!7038 d!28514))

(declare-fun m!135823 () Bool)

(assert (=> bs!7038 m!135823))

(assert (=> b!91669 d!28514))

(declare-fun d!28522 () Bool)

(assert (=> d!28522 (= (array_inv!1776 (buf!2320 bitStream1!8)) (bvsge (size!1930 (buf!2320 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91674 d!28522))

(declare-fun d!28524 () Bool)

(assert (=> d!28524 (= (array_inv!1776 (buf!2320 base!8)) (bvsge (size!1930 (buf!2320 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91675 d!28524))

(declare-fun d!28528 () Bool)

(declare-fun res!75724 () Bool)

(declare-fun e!60292 () Bool)

(assert (=> d!28528 (=> (not res!75724) (not e!60292))))

(assert (=> d!28528 (= res!75724 (= (size!1930 (buf!2320 bitStream1!8)) (size!1930 (buf!2320 bitStream2!8))))))

(assert (=> d!28528 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60292)))

(declare-fun b!91712 () Bool)

(declare-fun res!75723 () Bool)

(assert (=> b!91712 (=> (not res!75723) (not e!60292))))

(assert (=> b!91712 (= res!75723 (bvsle (bitIndex!0 (size!1930 (buf!2320 bitStream1!8)) (currentByte!4619 bitStream1!8) (currentBit!4614 bitStream1!8)) (bitIndex!0 (size!1930 (buf!2320 bitStream2!8)) (currentByte!4619 bitStream2!8) (currentBit!4614 bitStream2!8))))))

(declare-fun b!91713 () Bool)

(declare-fun e!60293 () Bool)

(assert (=> b!91713 (= e!60292 e!60293)))

(declare-fun res!75722 () Bool)

(assert (=> b!91713 (=> res!75722 e!60293)))

(assert (=> b!91713 (= res!75722 (= (size!1930 (buf!2320 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91714 () Bool)

(assert (=> b!91714 (= e!60293 (arrayBitRangesEq!0 (buf!2320 bitStream1!8) (buf!2320 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1930 (buf!2320 bitStream1!8)) (currentByte!4619 bitStream1!8) (currentBit!4614 bitStream1!8))))))

(assert (= (and d!28528 res!75724) b!91712))

(assert (= (and b!91712 res!75723) b!91713))

(assert (= (and b!91713 (not res!75722)) b!91714))

(assert (=> b!91712 m!135809))

(assert (=> b!91712 m!135795))

(assert (=> b!91714 m!135809))

(assert (=> b!91714 m!135809))

(declare-fun m!135831 () Bool)

(assert (=> b!91714 m!135831))

(assert (=> b!91670 d!28528))

(push 1)

