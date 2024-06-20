; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5964 () Bool)

(assert start!5964)

(declare-fun b!26808 () Bool)

(declare-fun res!23148 () Bool)

(declare-fun e!18162 () Bool)

(assert (=> b!26808 (=> res!23148 e!18162)))

(declare-datatypes ((array!1701 0))(
  ( (array!1702 (arr!1195 (Array (_ BitVec 32) (_ BitVec 8))) (size!733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1298 0))(
  ( (BitStream!1299 (buf!1060 array!1701) (currentByte!2385 (_ BitVec 32)) (currentBit!2380 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2962 0))(
  ( (tuple2!2963 (_1!1568 BitStream!1298) (_2!1568 BitStream!1298)) )
))
(declare-fun lt!38426 () tuple2!2962)

(declare-datatypes ((Unit!2169 0))(
  ( (Unit!2170) )
))
(declare-datatypes ((tuple2!2964 0))(
  ( (tuple2!2965 (_1!1569 Unit!2169) (_2!1569 BitStream!1298)) )
))
(declare-fun lt!38428 () tuple2!2964)

(declare-fun isPrefixOf!0 (BitStream!1298 BitStream!1298) Bool)

(assert (=> b!26808 (= res!23148 (not (isPrefixOf!0 (_1!1568 lt!38426) (_2!1569 lt!38428))))))

(declare-fun b!26809 () Bool)

(declare-fun e!18168 () Bool)

(declare-fun e!18166 () Bool)

(assert (=> b!26809 (= e!18168 e!18166)))

(declare-fun res!23144 () Bool)

(assert (=> b!26809 (=> res!23144 e!18166)))

(declare-fun thiss!1379 () BitStream!1298)

(declare-fun lt!38433 () tuple2!2964)

(assert (=> b!26809 (= res!23144 (not (isPrefixOf!0 thiss!1379 (_2!1569 lt!38433))))))

(declare-fun lt!38419 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26809 (validate_offset_bits!1 ((_ sign_extend 32) (size!733 (buf!1060 (_2!1569 lt!38433)))) ((_ sign_extend 32) (currentByte!2385 (_2!1569 lt!38433))) ((_ sign_extend 32) (currentBit!2380 (_2!1569 lt!38433))) lt!38419)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!26809 (= lt!38419 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38432 () Unit!2169)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1298 BitStream!1298 (_ BitVec 64) (_ BitVec 64)) Unit!2169)

(assert (=> b!26809 (= lt!38432 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1569 lt!38433) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1701)

(declare-fun appendBitFromByte!0 (BitStream!1298 (_ BitVec 8) (_ BitVec 32)) tuple2!2964)

(assert (=> b!26809 (= lt!38433 (appendBitFromByte!0 thiss!1379 (select (arr!1195 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26810 () Bool)

(declare-fun res!23149 () Bool)

(declare-fun e!18167 () Bool)

(assert (=> b!26810 (=> res!23149 e!18167)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26810 (= res!23149 (not (invariant!0 (currentBit!2380 (_2!1569 lt!38433)) (currentByte!2385 (_2!1569 lt!38433)) (size!733 (buf!1060 (_2!1569 lt!38433))))))))

(declare-fun b!26811 () Bool)

(declare-fun res!23139 () Bool)

(assert (=> b!26811 (=> res!23139 e!18167)))

(assert (=> b!26811 (= res!23139 (not (invariant!0 (currentBit!2380 (_2!1569 lt!38433)) (currentByte!2385 (_2!1569 lt!38433)) (size!733 (buf!1060 (_2!1569 lt!38428))))))))

(declare-fun b!26812 () Bool)

(declare-fun e!18170 () Bool)

(declare-fun array_inv!702 (array!1701) Bool)

(assert (=> b!26812 (= e!18170 (array_inv!702 (buf!1060 thiss!1379)))))

(declare-fun b!26813 () Bool)

(declare-fun res!23150 () Bool)

(declare-fun e!18165 () Bool)

(assert (=> b!26813 (=> (not res!23150) (not e!18165))))

(assert (=> b!26813 (= res!23150 (validate_offset_bits!1 ((_ sign_extend 32) (size!733 (buf!1060 thiss!1379))) ((_ sign_extend 32) (currentByte!2385 thiss!1379)) ((_ sign_extend 32) (currentBit!2380 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!18172 () Bool)

(declare-fun lt!38420 () (_ BitVec 64))

(declare-fun b!26814 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26814 (= e!18172 (= lt!38420 (bvsub (bvsub (bvadd (bitIndex!0 (size!733 (buf!1060 (_2!1569 lt!38433))) (currentByte!2385 (_2!1569 lt!38433)) (currentBit!2380 (_2!1569 lt!38433))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!23153 () Bool)

(assert (=> start!5964 (=> (not res!23153) (not e!18165))))

(assert (=> start!5964 (= res!23153 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!733 srcBuffer!2))))))))

(assert (=> start!5964 e!18165))

(assert (=> start!5964 true))

(assert (=> start!5964 (array_inv!702 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1298) Bool)

(assert (=> start!5964 (and (inv!12 thiss!1379) e!18170)))

(declare-fun b!26815 () Bool)

(declare-fun res!23138 () Bool)

(assert (=> b!26815 (=> res!23138 e!18162)))

(declare-datatypes ((List!350 0))(
  ( (Nil!347) (Cons!346 (h!465 Bool) (t!1100 List!350)) )
))
(declare-fun lt!38425 () List!350)

(declare-fun length!76 (List!350) Int)

(assert (=> b!26815 (= res!23138 (<= (length!76 lt!38425) 0))))

(declare-fun b!26816 () Bool)

(declare-fun e!18171 () Bool)

(assert (=> b!26816 (= e!18171 e!18167)))

(declare-fun res!23143 () Bool)

(assert (=> b!26816 (=> res!23143 e!18167)))

(assert (=> b!26816 (= res!23143 (not (= (size!733 (buf!1060 (_2!1569 lt!38433))) (size!733 (buf!1060 (_2!1569 lt!38428))))))))

(assert (=> b!26816 e!18172))

(declare-fun res!23154 () Bool)

(assert (=> b!26816 (=> (not res!23154) (not e!18172))))

(assert (=> b!26816 (= res!23154 (= (size!733 (buf!1060 (_2!1569 lt!38428))) (size!733 (buf!1060 thiss!1379))))))

(declare-fun e!18161 () Bool)

(declare-fun b!26817 () Bool)

(declare-fun lt!38430 () tuple2!2962)

(declare-fun head!187 (List!350) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1298 array!1701 (_ BitVec 64) (_ BitVec 64)) List!350)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1298 BitStream!1298 (_ BitVec 64)) List!350)

(assert (=> b!26817 (= e!18161 (= (head!187 (byteArrayBitContentToList!0 (_2!1569 lt!38433) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!187 (bitStreamReadBitsIntoList!0 (_2!1569 lt!38433) (_1!1568 lt!38430) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26818 () Bool)

(assert (=> b!26818 (= e!18165 (not e!18168))))

(declare-fun res!23145 () Bool)

(assert (=> b!26818 (=> res!23145 e!18168)))

(assert (=> b!26818 (= res!23145 (bvsge i!635 to!314))))

(assert (=> b!26818 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38423 () Unit!2169)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1298) Unit!2169)

(assert (=> b!26818 (= lt!38423 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38431 () (_ BitVec 64))

(assert (=> b!26818 (= lt!38431 (bitIndex!0 (size!733 (buf!1060 thiss!1379)) (currentByte!2385 thiss!1379) (currentBit!2380 thiss!1379)))))

(declare-fun b!26819 () Bool)

(declare-fun res!23151 () Bool)

(assert (=> b!26819 (=> res!23151 e!18162)))

(declare-fun lt!38424 () tuple2!2962)

(assert (=> b!26819 (= res!23151 (or (not (= (buf!1060 (_1!1568 lt!38426)) (buf!1060 (_1!1568 lt!38424)))) (not (= (buf!1060 (_1!1568 lt!38426)) (buf!1060 (_2!1569 lt!38428)))) (bvsge lt!38420 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26820 () Bool)

(declare-fun e!18169 () Bool)

(assert (=> b!26820 (= e!18169 e!18171)))

(declare-fun res!23141 () Bool)

(assert (=> b!26820 (=> res!23141 e!18171)))

(assert (=> b!26820 (= res!23141 (not (= lt!38420 (bvsub (bvadd lt!38431 to!314) i!635))))))

(assert (=> b!26820 (= lt!38420 (bitIndex!0 (size!733 (buf!1060 (_2!1569 lt!38428))) (currentByte!2385 (_2!1569 lt!38428)) (currentBit!2380 (_2!1569 lt!38428))))))

(declare-fun b!26821 () Bool)

(declare-fun res!23147 () Bool)

(assert (=> b!26821 (=> res!23147 e!18171)))

(assert (=> b!26821 (= res!23147 (not (invariant!0 (currentBit!2380 (_2!1569 lt!38428)) (currentByte!2385 (_2!1569 lt!38428)) (size!733 (buf!1060 (_2!1569 lt!38428))))))))

(declare-fun b!26822 () Bool)

(declare-fun res!23146 () Bool)

(assert (=> b!26822 (=> res!23146 e!18162)))

(assert (=> b!26822 (= res!23146 (not (isPrefixOf!0 (_1!1568 lt!38424) (_2!1569 lt!38428))))))

(declare-fun b!26823 () Bool)

(assert (=> b!26823 (= e!18162 true)))

(declare-fun lt!38429 () (_ BitVec 64))

(assert (=> b!26823 (= lt!38429 (bitIndex!0 (size!733 (buf!1060 (_1!1568 lt!38424))) (currentByte!2385 (_1!1568 lt!38424)) (currentBit!2380 (_1!1568 lt!38424))))))

(declare-fun lt!38417 () (_ BitVec 64))

(assert (=> b!26823 (= lt!38417 (bitIndex!0 (size!733 (buf!1060 (_1!1568 lt!38426))) (currentByte!2385 (_1!1568 lt!38426)) (currentBit!2380 (_1!1568 lt!38426))))))

(declare-fun b!26824 () Bool)

(declare-fun res!23152 () Bool)

(assert (=> b!26824 (=> res!23152 e!18162)))

(assert (=> b!26824 (= res!23152 (not (isPrefixOf!0 (_1!1568 lt!38426) (_1!1568 lt!38424))))))

(declare-fun b!26825 () Bool)

(assert (=> b!26825 (= e!18167 e!18162)))

(declare-fun res!23140 () Bool)

(assert (=> b!26825 (=> res!23140 e!18162)))

(assert (=> b!26825 (= res!23140 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38434 () List!350)

(assert (=> b!26825 (= lt!38434 (bitStreamReadBitsIntoList!0 (_2!1569 lt!38428) (_1!1568 lt!38424) lt!38419))))

(assert (=> b!26825 (= lt!38425 (bitStreamReadBitsIntoList!0 (_2!1569 lt!38428) (_1!1568 lt!38426) (bvsub to!314 i!635)))))

(assert (=> b!26825 (validate_offset_bits!1 ((_ sign_extend 32) (size!733 (buf!1060 (_2!1569 lt!38428)))) ((_ sign_extend 32) (currentByte!2385 (_2!1569 lt!38433))) ((_ sign_extend 32) (currentBit!2380 (_2!1569 lt!38433))) lt!38419)))

(declare-fun lt!38427 () Unit!2169)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1298 array!1701 (_ BitVec 64)) Unit!2169)

(assert (=> b!26825 (= lt!38427 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1569 lt!38433) (buf!1060 (_2!1569 lt!38428)) lt!38419))))

(declare-fun reader!0 (BitStream!1298 BitStream!1298) tuple2!2962)

(assert (=> b!26825 (= lt!38424 (reader!0 (_2!1569 lt!38433) (_2!1569 lt!38428)))))

(assert (=> b!26825 (validate_offset_bits!1 ((_ sign_extend 32) (size!733 (buf!1060 (_2!1569 lt!38428)))) ((_ sign_extend 32) (currentByte!2385 thiss!1379)) ((_ sign_extend 32) (currentBit!2380 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38421 () Unit!2169)

(assert (=> b!26825 (= lt!38421 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1060 (_2!1569 lt!38428)) (bvsub to!314 i!635)))))

(assert (=> b!26825 (= lt!38426 (reader!0 thiss!1379 (_2!1569 lt!38428)))))

(declare-fun b!26826 () Bool)

(assert (=> b!26826 (= e!18166 e!18169)))

(declare-fun res!23137 () Bool)

(assert (=> b!26826 (=> res!23137 e!18169)))

(assert (=> b!26826 (= res!23137 (not (isPrefixOf!0 (_2!1569 lt!38433) (_2!1569 lt!38428))))))

(assert (=> b!26826 (isPrefixOf!0 thiss!1379 (_2!1569 lt!38428))))

(declare-fun lt!38418 () Unit!2169)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1298 BitStream!1298 BitStream!1298) Unit!2169)

(assert (=> b!26826 (= lt!38418 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1569 lt!38433) (_2!1569 lt!38428)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1298 array!1701 (_ BitVec 64) (_ BitVec 64)) tuple2!2964)

(assert (=> b!26826 (= lt!38428 (appendBitsMSBFirstLoop!0 (_2!1569 lt!38433) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26826 e!18161))

(declare-fun res!23136 () Bool)

(assert (=> b!26826 (=> (not res!23136) (not e!18161))))

(assert (=> b!26826 (= res!23136 (validate_offset_bits!1 ((_ sign_extend 32) (size!733 (buf!1060 (_2!1569 lt!38433)))) ((_ sign_extend 32) (currentByte!2385 thiss!1379)) ((_ sign_extend 32) (currentBit!2380 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38422 () Unit!2169)

(assert (=> b!26826 (= lt!38422 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1060 (_2!1569 lt!38433)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!26826 (= lt!38430 (reader!0 thiss!1379 (_2!1569 lt!38433)))))

(declare-fun b!26827 () Bool)

(declare-fun res!23142 () Bool)

(assert (=> b!26827 (=> res!23142 e!18171)))

(assert (=> b!26827 (= res!23142 (not (= (size!733 (buf!1060 thiss!1379)) (size!733 (buf!1060 (_2!1569 lt!38428))))))))

(assert (= (and start!5964 res!23153) b!26813))

(assert (= (and b!26813 res!23150) b!26818))

(assert (= (and b!26818 (not res!23145)) b!26809))

(assert (= (and b!26809 (not res!23144)) b!26826))

(assert (= (and b!26826 res!23136) b!26817))

(assert (= (and b!26826 (not res!23137)) b!26820))

(assert (= (and b!26820 (not res!23141)) b!26821))

(assert (= (and b!26821 (not res!23147)) b!26827))

(assert (= (and b!26827 (not res!23142)) b!26816))

(assert (= (and b!26816 res!23154) b!26814))

(assert (= (and b!26816 (not res!23143)) b!26810))

(assert (= (and b!26810 (not res!23149)) b!26811))

(assert (= (and b!26811 (not res!23139)) b!26825))

(assert (= (and b!26825 (not res!23140)) b!26815))

(assert (= (and b!26815 (not res!23138)) b!26808))

(assert (= (and b!26808 (not res!23148)) b!26822))

(assert (= (and b!26822 (not res!23146)) b!26824))

(assert (= (and b!26824 (not res!23152)) b!26819))

(assert (= (and b!26819 (not res!23151)) b!26823))

(assert (= start!5964 b!26812))

(declare-fun m!38433 () Bool)

(assert (=> b!26825 m!38433))

(declare-fun m!38435 () Bool)

(assert (=> b!26825 m!38435))

(declare-fun m!38437 () Bool)

(assert (=> b!26825 m!38437))

(declare-fun m!38439 () Bool)

(assert (=> b!26825 m!38439))

(declare-fun m!38441 () Bool)

(assert (=> b!26825 m!38441))

(declare-fun m!38443 () Bool)

(assert (=> b!26825 m!38443))

(declare-fun m!38445 () Bool)

(assert (=> b!26825 m!38445))

(declare-fun m!38447 () Bool)

(assert (=> b!26825 m!38447))

(declare-fun m!38449 () Bool)

(assert (=> b!26826 m!38449))

(declare-fun m!38451 () Bool)

(assert (=> b!26826 m!38451))

(declare-fun m!38453 () Bool)

(assert (=> b!26826 m!38453))

(declare-fun m!38455 () Bool)

(assert (=> b!26826 m!38455))

(declare-fun m!38457 () Bool)

(assert (=> b!26826 m!38457))

(declare-fun m!38459 () Bool)

(assert (=> b!26826 m!38459))

(declare-fun m!38461 () Bool)

(assert (=> b!26826 m!38461))

(declare-fun m!38463 () Bool)

(assert (=> b!26823 m!38463))

(declare-fun m!38465 () Bool)

(assert (=> b!26823 m!38465))

(declare-fun m!38467 () Bool)

(assert (=> b!26821 m!38467))

(declare-fun m!38469 () Bool)

(assert (=> b!26824 m!38469))

(declare-fun m!38471 () Bool)

(assert (=> b!26810 m!38471))

(declare-fun m!38473 () Bool)

(assert (=> b!26818 m!38473))

(declare-fun m!38475 () Bool)

(assert (=> b!26818 m!38475))

(declare-fun m!38477 () Bool)

(assert (=> b!26818 m!38477))

(declare-fun m!38479 () Bool)

(assert (=> b!26808 m!38479))

(declare-fun m!38481 () Bool)

(assert (=> b!26817 m!38481))

(assert (=> b!26817 m!38481))

(declare-fun m!38483 () Bool)

(assert (=> b!26817 m!38483))

(declare-fun m!38485 () Bool)

(assert (=> b!26817 m!38485))

(assert (=> b!26817 m!38485))

(declare-fun m!38487 () Bool)

(assert (=> b!26817 m!38487))

(declare-fun m!38489 () Bool)

(assert (=> b!26820 m!38489))

(declare-fun m!38491 () Bool)

(assert (=> start!5964 m!38491))

(declare-fun m!38493 () Bool)

(assert (=> start!5964 m!38493))

(declare-fun m!38495 () Bool)

(assert (=> b!26822 m!38495))

(declare-fun m!38497 () Bool)

(assert (=> b!26813 m!38497))

(declare-fun m!38499 () Bool)

(assert (=> b!26811 m!38499))

(declare-fun m!38501 () Bool)

(assert (=> b!26815 m!38501))

(declare-fun m!38503 () Bool)

(assert (=> b!26814 m!38503))

(declare-fun m!38505 () Bool)

(assert (=> b!26812 m!38505))

(declare-fun m!38507 () Bool)

(assert (=> b!26809 m!38507))

(declare-fun m!38509 () Bool)

(assert (=> b!26809 m!38509))

(declare-fun m!38511 () Bool)

(assert (=> b!26809 m!38511))

(declare-fun m!38513 () Bool)

(assert (=> b!26809 m!38513))

(assert (=> b!26809 m!38509))

(declare-fun m!38515 () Bool)

(assert (=> b!26809 m!38515))

(push 1)

(assert (not b!26811))

(assert (not b!26815))

(assert (not b!26814))

(assert (not b!26825))

(assert (not b!26817))

(assert (not b!26823))

(assert (not b!26810))

(assert (not start!5964))

(assert (not b!26826))

(assert (not b!26822))

(assert (not b!26813))

(assert (not b!26824))

(assert (not b!26808))

(assert (not b!26820))

(assert (not b!26818))

(assert (not b!26809))

(assert (not b!26821))

(assert (not b!26812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

