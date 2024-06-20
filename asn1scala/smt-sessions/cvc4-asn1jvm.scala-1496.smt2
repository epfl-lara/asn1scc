; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41310 () Bool)

(assert start!41310)

(declare-fun lt!300472 () (_ BitVec 64))

(declare-fun e!133261 () Bool)

(declare-datatypes ((array!9984 0))(
  ( (array!9985 (arr!5334 (Array (_ BitVec 32) (_ BitVec 8))) (size!4404 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7916 0))(
  ( (BitStream!7917 (buf!4884 array!9984) (currentByte!9168 (_ BitVec 32)) (currentBit!9163 (_ BitVec 32))) )
))
(declare-fun lt!300458 () BitStream!7916)

(declare-fun b!193562 () Bool)

(declare-datatypes ((tuple2!16764 0))(
  ( (tuple2!16765 (_1!9027 BitStream!7916) (_2!9027 (_ BitVec 64))) )
))
(declare-fun lt!300457 () tuple2!16764)

(declare-datatypes ((tuple2!16766 0))(
  ( (tuple2!16767 (_1!9028 BitStream!7916) (_2!9028 BitStream!7916)) )
))
(declare-fun lt!300464 () tuple2!16766)

(declare-fun lt!300453 () tuple2!16764)

(declare-fun lt!300451 () (_ BitVec 64))

(assert (=> b!193562 (= e!133261 (and (= lt!300451 (bvsub lt!300472 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9028 lt!300464) lt!300458)) (= (_2!9027 lt!300457) (_2!9027 lt!300453)))))))

(declare-fun b!193563 () Bool)

(declare-fun res!161793 () Bool)

(declare-fun e!133270 () Bool)

(assert (=> b!193563 (=> (not res!161793) (not e!133270))))

(declare-fun thiss!1204 () BitStream!7916)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193563 (= res!161793 (invariant!0 (currentBit!9163 thiss!1204) (currentByte!9168 thiss!1204) (size!4404 (buf!4884 thiss!1204))))))

(declare-fun b!193564 () Bool)

(declare-fun res!161806 () Bool)

(assert (=> b!193564 (=> (not res!161806) (not e!133261))))

(declare-fun lt!300473 () tuple2!16766)

(declare-fun lt!300475 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7916 (_ BitVec 64)) BitStream!7916)

(assert (=> b!193564 (= res!161806 (= (_1!9028 lt!300473) (withMovedBitIndex!0 (_2!9028 lt!300473) (bvsub lt!300451 lt!300475))))))

(declare-fun b!193565 () Bool)

(declare-fun res!161804 () Bool)

(declare-fun e!133259 () Bool)

(assert (=> b!193565 (=> res!161804 e!133259)))

(declare-datatypes ((Unit!13685 0))(
  ( (Unit!13686) )
))
(declare-datatypes ((tuple2!16768 0))(
  ( (tuple2!16769 (_1!9029 Unit!13685) (_2!9029 BitStream!7916)) )
))
(declare-fun lt!300468 () tuple2!16768)

(declare-fun lt!300462 () tuple2!16768)

(declare-fun isPrefixOf!0 (BitStream!7916 BitStream!7916) Bool)

(assert (=> b!193565 (= res!161804 (not (isPrefixOf!0 (_2!9029 lt!300468) (_2!9029 lt!300462))))))

(declare-fun b!193566 () Bool)

(declare-fun e!133269 () Bool)

(assert (=> b!193566 (= e!133259 e!133269)))

(declare-fun res!161811 () Bool)

(assert (=> b!193566 (=> res!161811 e!133269)))

(assert (=> b!193566 (= res!161811 (not (= (_1!9027 lt!300453) (_2!9028 lt!300464))))))

(declare-fun lt!300455 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16764)

(assert (=> b!193566 (= lt!300453 (readNBitsLSBFirstsLoopPure!0 (_1!9028 lt!300464) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300455))))

(declare-fun lt!300478 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193566 (validate_offset_bits!1 ((_ sign_extend 32) (size!4404 (buf!4884 (_2!9029 lt!300462)))) ((_ sign_extend 32) (currentByte!9168 (_2!9029 lt!300468))) ((_ sign_extend 32) (currentBit!9163 (_2!9029 lt!300468))) lt!300478)))

(declare-fun lt!300471 () Unit!13685)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7916 array!9984 (_ BitVec 64)) Unit!13685)

(assert (=> b!193566 (= lt!300471 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9029 lt!300468) (buf!4884 (_2!9029 lt!300462)) lt!300478))))

(assert (=> b!193566 (= lt!300478 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!300466 () (_ BitVec 64))

(declare-datatypes ((tuple2!16770 0))(
  ( (tuple2!16771 (_1!9030 BitStream!7916) (_2!9030 Bool)) )
))
(declare-fun lt!300465 () tuple2!16770)

(declare-fun lt!300450 () (_ BitVec 64))

(assert (=> b!193566 (= lt!300455 (bvor lt!300466 (ite (_2!9030 lt!300465) lt!300450 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193566 (= lt!300457 (readNBitsLSBFirstsLoopPure!0 (_1!9028 lt!300473) nBits!348 i!590 lt!300466))))

(declare-fun lt!300460 () (_ BitVec 64))

(assert (=> b!193566 (validate_offset_bits!1 ((_ sign_extend 32) (size!4404 (buf!4884 (_2!9029 lt!300462)))) ((_ sign_extend 32) (currentByte!9168 thiss!1204)) ((_ sign_extend 32) (currentBit!9163 thiss!1204)) lt!300460)))

(declare-fun lt!300459 () Unit!13685)

(assert (=> b!193566 (= lt!300459 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4884 (_2!9029 lt!300462)) lt!300460))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193566 (= lt!300466 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!300456 () Bool)

(assert (=> b!193566 (= (_2!9030 lt!300465) lt!300456)))

(declare-fun readBitPure!0 (BitStream!7916) tuple2!16770)

(assert (=> b!193566 (= lt!300465 (readBitPure!0 (_1!9028 lt!300473)))))

(declare-fun reader!0 (BitStream!7916 BitStream!7916) tuple2!16766)

(assert (=> b!193566 (= lt!300464 (reader!0 (_2!9029 lt!300468) (_2!9029 lt!300462)))))

(assert (=> b!193566 (= lt!300473 (reader!0 thiss!1204 (_2!9029 lt!300462)))))

(declare-fun e!133265 () Bool)

(assert (=> b!193566 e!133265))

(declare-fun res!161798 () Bool)

(assert (=> b!193566 (=> (not res!161798) (not e!133265))))

(declare-fun lt!300477 () tuple2!16770)

(declare-fun lt!300452 () tuple2!16770)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193566 (= res!161798 (= (bitIndex!0 (size!4404 (buf!4884 (_1!9030 lt!300477))) (currentByte!9168 (_1!9030 lt!300477)) (currentBit!9163 (_1!9030 lt!300477))) (bitIndex!0 (size!4404 (buf!4884 (_1!9030 lt!300452))) (currentByte!9168 (_1!9030 lt!300452)) (currentBit!9163 (_1!9030 lt!300452)))))))

(declare-fun lt!300474 () Unit!13685)

(declare-fun lt!300467 () BitStream!7916)

(declare-fun readBitPrefixLemma!0 (BitStream!7916 BitStream!7916) Unit!13685)

(assert (=> b!193566 (= lt!300474 (readBitPrefixLemma!0 lt!300467 (_2!9029 lt!300462)))))

(assert (=> b!193566 (= lt!300452 (readBitPure!0 (BitStream!7917 (buf!4884 (_2!9029 lt!300462)) (currentByte!9168 thiss!1204) (currentBit!9163 thiss!1204))))))

(assert (=> b!193566 (= lt!300477 (readBitPure!0 lt!300467))))

(declare-fun e!133268 () Bool)

(assert (=> b!193566 e!133268))

(declare-fun res!161808 () Bool)

(assert (=> b!193566 (=> (not res!161808) (not e!133268))))

(assert (=> b!193566 (= res!161808 (invariant!0 (currentBit!9163 thiss!1204) (currentByte!9168 thiss!1204) (size!4404 (buf!4884 (_2!9029 lt!300468)))))))

(assert (=> b!193566 (= lt!300467 (BitStream!7917 (buf!4884 (_2!9029 lt!300468)) (currentByte!9168 thiss!1204) (currentBit!9163 thiss!1204)))))

(declare-fun b!193567 () Bool)

(declare-fun res!161795 () Bool)

(declare-fun e!133262 () Bool)

(assert (=> b!193567 (=> (not res!161795) (not e!133262))))

(assert (=> b!193567 (= res!161795 (isPrefixOf!0 thiss!1204 (_2!9029 lt!300468)))))

(declare-fun b!193568 () Bool)

(declare-fun e!133264 () Bool)

(declare-fun array_inv!4145 (array!9984) Bool)

(assert (=> b!193568 (= e!133264 (array_inv!4145 (buf!4884 thiss!1204)))))

(declare-fun b!193569 () Bool)

(declare-fun e!133266 () Bool)

(declare-fun lt!300476 () tuple2!16770)

(declare-fun lt!300463 () (_ BitVec 64))

(assert (=> b!193569 (= e!133266 (= (bitIndex!0 (size!4404 (buf!4884 (_1!9030 lt!300476))) (currentByte!9168 (_1!9030 lt!300476)) (currentBit!9163 (_1!9030 lt!300476))) lt!300463))))

(declare-fun b!193570 () Bool)

(declare-fun res!161796 () Bool)

(assert (=> b!193570 (=> res!161796 e!133259)))

(assert (=> b!193570 (= res!161796 (or (not (= (size!4404 (buf!4884 (_2!9029 lt!300462))) (size!4404 (buf!4884 thiss!1204)))) (not (= lt!300475 (bvsub (bvadd lt!300451 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!193571 () Bool)

(assert (=> b!193571 (= e!133262 e!133266)))

(declare-fun res!161803 () Bool)

(assert (=> b!193571 (=> (not res!161803) (not e!133266))))

(assert (=> b!193571 (= res!161803 (and (= (_2!9030 lt!300476) lt!300456) (= (_1!9030 lt!300476) (_2!9029 lt!300468))))))

(declare-fun readerFrom!0 (BitStream!7916 (_ BitVec 32) (_ BitVec 32)) BitStream!7916)

(assert (=> b!193571 (= lt!300476 (readBitPure!0 (readerFrom!0 (_2!9029 lt!300468) (currentBit!9163 thiss!1204) (currentByte!9168 thiss!1204))))))

(declare-fun b!193572 () Bool)

(declare-fun res!161791 () Bool)

(assert (=> b!193572 (=> (not res!161791) (not e!133270))))

(assert (=> b!193572 (= res!161791 (not (= i!590 nBits!348)))))

(declare-fun b!193573 () Bool)

(declare-fun res!161810 () Bool)

(declare-fun e!133263 () Bool)

(assert (=> b!193573 (=> (not res!161810) (not e!133263))))

(assert (=> b!193573 (= res!161810 (= (_2!9027 lt!300457) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!193574 () Bool)

(declare-fun res!161800 () Bool)

(assert (=> b!193574 (=> (not res!161800) (not e!133261))))

(assert (=> b!193574 (= res!161800 (= (_1!9028 lt!300464) (withMovedBitIndex!0 (_2!9028 lt!300464) (bvsub lt!300472 lt!300475))))))

(declare-fun b!193575 () Bool)

(declare-fun res!161797 () Bool)

(assert (=> b!193575 (=> res!161797 e!133259)))

(assert (=> b!193575 (= res!161797 (not (invariant!0 (currentBit!9163 (_2!9029 lt!300462)) (currentByte!9168 (_2!9029 lt!300462)) (size!4404 (buf!4884 (_2!9029 lt!300462))))))))

(declare-fun res!161799 () Bool)

(declare-fun e!133257 () Bool)

(assert (=> start!41310 (=> (not res!161799) (not e!133257))))

(assert (=> start!41310 (= res!161799 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41310 e!133257))

(assert (=> start!41310 true))

(declare-fun inv!12 (BitStream!7916) Bool)

(assert (=> start!41310 (and (inv!12 thiss!1204) e!133264)))

(declare-fun b!193576 () Bool)

(declare-fun res!161794 () Bool)

(declare-fun e!133267 () Bool)

(assert (=> b!193576 (=> res!161794 e!133267)))

(assert (=> b!193576 (= res!161794 (not (= (bitIndex!0 (size!4404 (buf!4884 (_1!9027 lt!300457))) (currentByte!9168 (_1!9027 lt!300457)) (currentBit!9163 (_1!9027 lt!300457))) (bitIndex!0 (size!4404 (buf!4884 (_2!9028 lt!300473))) (currentByte!9168 (_2!9028 lt!300473)) (currentBit!9163 (_2!9028 lt!300473))))))))

(declare-fun b!193577 () Bool)

(assert (=> b!193577 (= e!133269 e!133267)))

(declare-fun res!161805 () Bool)

(assert (=> b!193577 (=> res!161805 e!133267)))

(assert (=> b!193577 (= res!161805 (not (= (_1!9028 lt!300464) lt!300458)))))

(assert (=> b!193577 e!133261))

(declare-fun res!161801 () Bool)

(assert (=> b!193577 (=> (not res!161801) (not e!133261))))

(declare-fun lt!300469 () tuple2!16764)

(assert (=> b!193577 (= res!161801 (and (= (_2!9027 lt!300457) (_2!9027 lt!300469)) (= (_1!9027 lt!300457) (_1!9027 lt!300469))))))

(declare-fun lt!300470 () Unit!13685)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13685)

(assert (=> b!193577 (= lt!300470 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9028 lt!300473) nBits!348 i!590 lt!300466))))

(assert (=> b!193577 (= lt!300469 (readNBitsLSBFirstsLoopPure!0 lt!300458 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300455))))

(assert (=> b!193577 (= lt!300458 (withMovedBitIndex!0 (_1!9028 lt!300473) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!193578 () Bool)

(declare-fun e!133271 () Bool)

(assert (=> b!193578 (= e!133271 e!133259)))

(declare-fun res!161814 () Bool)

(assert (=> b!193578 (=> res!161814 e!133259)))

(assert (=> b!193578 (= res!161814 (not (= lt!300475 (bvsub (bvsub (bvadd lt!300472 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!193578 (= lt!300475 (bitIndex!0 (size!4404 (buf!4884 (_2!9029 lt!300462))) (currentByte!9168 (_2!9029 lt!300462)) (currentBit!9163 (_2!9029 lt!300462))))))

(assert (=> b!193578 (isPrefixOf!0 thiss!1204 (_2!9029 lt!300462))))

(declare-fun lt!300461 () Unit!13685)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7916 BitStream!7916 BitStream!7916) Unit!13685)

(assert (=> b!193578 (= lt!300461 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9029 lt!300468) (_2!9029 lt!300462)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7916 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16768)

(assert (=> b!193578 (= lt!300462 (appendBitsLSBFirstLoopTR!0 (_2!9029 lt!300468) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!193579 () Bool)

(assert (=> b!193579 (= e!133270 (not e!133271))))

(declare-fun res!161809 () Bool)

(assert (=> b!193579 (=> res!161809 e!133271)))

(assert (=> b!193579 (= res!161809 (not (= lt!300472 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300451))))))

(assert (=> b!193579 (= lt!300472 (bitIndex!0 (size!4404 (buf!4884 (_2!9029 lt!300468))) (currentByte!9168 (_2!9029 lt!300468)) (currentBit!9163 (_2!9029 lt!300468))))))

(assert (=> b!193579 (= lt!300451 (bitIndex!0 (size!4404 (buf!4884 thiss!1204)) (currentByte!9168 thiss!1204) (currentBit!9163 thiss!1204)))))

(declare-fun e!133260 () Bool)

(assert (=> b!193579 e!133260))

(declare-fun res!161792 () Bool)

(assert (=> b!193579 (=> (not res!161792) (not e!133260))))

(assert (=> b!193579 (= res!161792 (= (size!4404 (buf!4884 thiss!1204)) (size!4404 (buf!4884 (_2!9029 lt!300468)))))))

(declare-fun appendBit!0 (BitStream!7916 Bool) tuple2!16768)

(assert (=> b!193579 (= lt!300468 (appendBit!0 thiss!1204 lt!300456))))

(assert (=> b!193579 (= lt!300456 (not (= (bvand v!189 lt!300450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193579 (= lt!300450 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!193580 () Bool)

(assert (=> b!193580 (= e!133260 e!133262)))

(declare-fun res!161813 () Bool)

(assert (=> b!193580 (=> (not res!161813) (not e!133262))))

(declare-fun lt!300454 () (_ BitVec 64))

(assert (=> b!193580 (= res!161813 (= lt!300463 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300454)))))

(assert (=> b!193580 (= lt!300463 (bitIndex!0 (size!4404 (buf!4884 (_2!9029 lt!300468))) (currentByte!9168 (_2!9029 lt!300468)) (currentBit!9163 (_2!9029 lt!300468))))))

(assert (=> b!193580 (= lt!300454 (bitIndex!0 (size!4404 (buf!4884 thiss!1204)) (currentByte!9168 thiss!1204) (currentBit!9163 thiss!1204)))))

(declare-fun b!193581 () Bool)

(assert (=> b!193581 (= e!133265 (= (_2!9030 lt!300477) (_2!9030 lt!300452)))))

(declare-fun b!193582 () Bool)

(assert (=> b!193582 (= e!133267 true)))

(assert (=> b!193582 e!133263))

(declare-fun res!161802 () Bool)

(assert (=> b!193582 (=> (not res!161802) (not e!133263))))

(assert (=> b!193582 (= res!161802 (= (size!4404 (buf!4884 thiss!1204)) (size!4404 (buf!4884 (_2!9029 lt!300462)))))))

(declare-fun b!193583 () Bool)

(declare-fun res!161812 () Bool)

(assert (=> b!193583 (=> res!161812 e!133259)))

(assert (=> b!193583 (= res!161812 (not (isPrefixOf!0 thiss!1204 (_2!9029 lt!300468))))))

(declare-fun b!193584 () Bool)

(assert (=> b!193584 (= e!133263 (= (_1!9027 lt!300457) (_2!9028 lt!300473)))))

(declare-fun b!193585 () Bool)

(assert (=> b!193585 (= e!133268 (invariant!0 (currentBit!9163 thiss!1204) (currentByte!9168 thiss!1204) (size!4404 (buf!4884 (_2!9029 lt!300462)))))))

(declare-fun b!193586 () Bool)

(assert (=> b!193586 (= e!133257 e!133270)))

(declare-fun res!161807 () Bool)

(assert (=> b!193586 (=> (not res!161807) (not e!133270))))

(assert (=> b!193586 (= res!161807 (validate_offset_bits!1 ((_ sign_extend 32) (size!4404 (buf!4884 thiss!1204))) ((_ sign_extend 32) (currentByte!9168 thiss!1204)) ((_ sign_extend 32) (currentBit!9163 thiss!1204)) lt!300460))))

(assert (=> b!193586 (= lt!300460 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!41310 res!161799) b!193586))

(assert (= (and b!193586 res!161807) b!193563))

(assert (= (and b!193563 res!161793) b!193572))

(assert (= (and b!193572 res!161791) b!193579))

(assert (= (and b!193579 res!161792) b!193580))

(assert (= (and b!193580 res!161813) b!193567))

(assert (= (and b!193567 res!161795) b!193571))

(assert (= (and b!193571 res!161803) b!193569))

(assert (= (and b!193579 (not res!161809)) b!193578))

(assert (= (and b!193578 (not res!161814)) b!193575))

(assert (= (and b!193575 (not res!161797)) b!193570))

(assert (= (and b!193570 (not res!161796)) b!193565))

(assert (= (and b!193565 (not res!161804)) b!193583))

(assert (= (and b!193583 (not res!161812)) b!193566))

(assert (= (and b!193566 res!161808) b!193585))

(assert (= (and b!193566 res!161798) b!193581))

(assert (= (and b!193566 (not res!161811)) b!193577))

(assert (= (and b!193577 res!161801) b!193564))

(assert (= (and b!193564 res!161806) b!193574))

(assert (= (and b!193574 res!161800) b!193562))

(assert (= (and b!193577 (not res!161805)) b!193576))

(assert (= (and b!193576 (not res!161794)) b!193582))

(assert (= (and b!193582 res!161802) b!193573))

(assert (= (and b!193573 res!161810) b!193584))

(assert (= start!41310 b!193568))

(declare-fun m!299867 () Bool)

(assert (=> b!193566 m!299867))

(declare-fun m!299869 () Bool)

(assert (=> b!193566 m!299869))

(declare-fun m!299871 () Bool)

(assert (=> b!193566 m!299871))

(declare-fun m!299873 () Bool)

(assert (=> b!193566 m!299873))

(declare-fun m!299875 () Bool)

(assert (=> b!193566 m!299875))

(declare-fun m!299877 () Bool)

(assert (=> b!193566 m!299877))

(declare-fun m!299879 () Bool)

(assert (=> b!193566 m!299879))

(declare-fun m!299881 () Bool)

(assert (=> b!193566 m!299881))

(declare-fun m!299883 () Bool)

(assert (=> b!193566 m!299883))

(declare-fun m!299885 () Bool)

(assert (=> b!193566 m!299885))

(declare-fun m!299887 () Bool)

(assert (=> b!193566 m!299887))

(declare-fun m!299889 () Bool)

(assert (=> b!193566 m!299889))

(declare-fun m!299891 () Bool)

(assert (=> b!193566 m!299891))

(declare-fun m!299893 () Bool)

(assert (=> b!193566 m!299893))

(declare-fun m!299895 () Bool)

(assert (=> b!193566 m!299895))

(declare-fun m!299897 () Bool)

(assert (=> b!193566 m!299897))

(declare-fun m!299899 () Bool)

(assert (=> b!193571 m!299899))

(assert (=> b!193571 m!299899))

(declare-fun m!299901 () Bool)

(assert (=> b!193571 m!299901))

(declare-fun m!299903 () Bool)

(assert (=> b!193583 m!299903))

(declare-fun m!299905 () Bool)

(assert (=> b!193577 m!299905))

(declare-fun m!299907 () Bool)

(assert (=> b!193577 m!299907))

(declare-fun m!299909 () Bool)

(assert (=> b!193577 m!299909))

(declare-fun m!299911 () Bool)

(assert (=> b!193569 m!299911))

(declare-fun m!299913 () Bool)

(assert (=> b!193585 m!299913))

(declare-fun m!299915 () Bool)

(assert (=> b!193563 m!299915))

(declare-fun m!299917 () Bool)

(assert (=> b!193586 m!299917))

(assert (=> b!193567 m!299903))

(declare-fun m!299919 () Bool)

(assert (=> start!41310 m!299919))

(declare-fun m!299921 () Bool)

(assert (=> b!193565 m!299921))

(declare-fun m!299923 () Bool)

(assert (=> b!193580 m!299923))

(declare-fun m!299925 () Bool)

(assert (=> b!193580 m!299925))

(declare-fun m!299927 () Bool)

(assert (=> b!193568 m!299927))

(declare-fun m!299929 () Bool)

(assert (=> b!193578 m!299929))

(declare-fun m!299931 () Bool)

(assert (=> b!193578 m!299931))

(declare-fun m!299933 () Bool)

(assert (=> b!193578 m!299933))

(declare-fun m!299935 () Bool)

(assert (=> b!193578 m!299935))

(declare-fun m!299937 () Bool)

(assert (=> b!193564 m!299937))

(declare-fun m!299939 () Bool)

(assert (=> b!193576 m!299939))

(declare-fun m!299941 () Bool)

(assert (=> b!193576 m!299941))

(declare-fun m!299943 () Bool)

(assert (=> b!193574 m!299943))

(declare-fun m!299945 () Bool)

(assert (=> b!193575 m!299945))

(assert (=> b!193579 m!299923))

(assert (=> b!193579 m!299925))

(declare-fun m!299947 () Bool)

(assert (=> b!193579 m!299947))

(declare-fun m!299949 () Bool)

(assert (=> b!193573 m!299949))

(push 1)

(assert (not b!193577))

(assert (not b!193569))

(assert (not start!41310))

(assert (not b!193575))

(assert (not b!193563))

(assert (not b!193564))

(assert (not b!193583))

(assert (not b!193576))

(assert (not b!193573))

(assert (not b!193579))

(assert (not b!193566))

(assert (not b!193586))

(assert (not b!193580))

(assert (not b!193571))

(assert (not b!193568))

(assert (not b!193585))

(assert (not b!193574))

(assert (not b!193578))

(assert (not b!193567))

(assert (not b!193565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

