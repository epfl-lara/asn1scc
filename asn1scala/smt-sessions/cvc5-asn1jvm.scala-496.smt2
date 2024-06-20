; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14736 () Bool)

(assert start!14736)

(declare-fun b!75844 () Bool)

(declare-fun e!49624 () Bool)

(declare-datatypes ((array!3103 0))(
  ( (array!3104 (arr!2043 (Array (_ BitVec 32) (_ BitVec 8))) (size!1445 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2464 0))(
  ( (BitStream!2465 (buf!1826 array!3103) (currentByte!3617 (_ BitVec 32)) (currentBit!3612 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2464)

(declare-fun array_inv!1291 (array!3103) Bool)

(assert (=> b!75844 (= e!49624 (array_inv!1291 (buf!1826 thiss!1379)))))

(declare-fun b!75846 () Bool)

(declare-fun res!62709 () Bool)

(declare-fun e!49621 () Bool)

(assert (=> b!75846 (=> res!62709 e!49621)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75846 (= res!62709 (not (invariant!0 (currentBit!3612 thiss!1379) (currentByte!3617 thiss!1379) (size!1445 (buf!1826 thiss!1379)))))))

(declare-fun b!75847 () Bool)

(declare-fun e!49623 () Bool)

(assert (=> b!75847 (= e!49621 e!49623)))

(declare-fun res!62711 () Bool)

(assert (=> b!75847 (=> res!62711 e!49623)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!75847 (= res!62711 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6538 0))(
  ( (tuple2!6539 (_1!3400 array!3103) (_2!3400 BitStream!2464)) )
))
(declare-fun lt!121939 () tuple2!6538)

(declare-fun readBits!0 (BitStream!2464 (_ BitVec 64)) tuple2!6538)

(declare-datatypes ((tuple2!6540 0))(
  ( (tuple2!6541 (_1!3401 BitStream!2464) (_2!3401 BitStream!2464)) )
))
(declare-fun reader!0 (BitStream!2464 BitStream!2464) tuple2!6540)

(assert (=> b!75847 (= lt!121939 (readBits!0 (_1!3401 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75848 () Bool)

(declare-fun res!62712 () Bool)

(declare-fun e!49622 () Bool)

(assert (=> b!75848 (=> (not res!62712) (not e!49622))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75848 (= res!62712 (validate_offset_bits!1 ((_ sign_extend 32) (size!1445 (buf!1826 thiss!1379))) ((_ sign_extend 32) (currentByte!3617 thiss!1379)) ((_ sign_extend 32) (currentBit!3612 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75849 () Bool)

(assert (=> b!75849 (= e!49623 true)))

(declare-fun srcBuffer!2 () array!3103)

(declare-fun checkByteArrayBitContent!0 (BitStream!2464 array!3103 array!3103 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75849 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3400 lt!121939) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75845 () Bool)

(assert (=> b!75845 (= e!49622 (not e!49621))))

(declare-fun res!62710 () Bool)

(assert (=> b!75845 (=> res!62710 e!49621)))

(declare-fun lt!121941 () (_ BitVec 64))

(assert (=> b!75845 (= res!62710 (or (bvslt i!635 to!314) (not (= lt!121941 (bvsub (bvadd lt!121941 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2464 BitStream!2464) Bool)

(assert (=> b!75845 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4990 0))(
  ( (Unit!4991) )
))
(declare-fun lt!121940 () Unit!4990)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2464) Unit!4990)

(assert (=> b!75845 (= lt!121940 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75845 (= lt!121941 (bitIndex!0 (size!1445 (buf!1826 thiss!1379)) (currentByte!3617 thiss!1379) (currentBit!3612 thiss!1379)))))

(declare-fun res!62713 () Bool)

(assert (=> start!14736 (=> (not res!62713) (not e!49622))))

(assert (=> start!14736 (= res!62713 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1445 srcBuffer!2))))))))

(assert (=> start!14736 e!49622))

(assert (=> start!14736 true))

(assert (=> start!14736 (array_inv!1291 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2464) Bool)

(assert (=> start!14736 (and (inv!12 thiss!1379) e!49624)))

(assert (= (and start!14736 res!62713) b!75848))

(assert (= (and b!75848 res!62712) b!75845))

(assert (= (and b!75845 (not res!62710)) b!75846))

(assert (= (and b!75846 (not res!62709)) b!75847))

(assert (= (and b!75847 (not res!62711)) b!75849))

(assert (= start!14736 b!75844))

(declare-fun m!120953 () Bool)

(assert (=> b!75845 m!120953))

(declare-fun m!120955 () Bool)

(assert (=> b!75845 m!120955))

(declare-fun m!120957 () Bool)

(assert (=> b!75845 m!120957))

(declare-fun m!120959 () Bool)

(assert (=> b!75846 m!120959))

(declare-fun m!120961 () Bool)

(assert (=> b!75848 m!120961))

(declare-fun m!120963 () Bool)

(assert (=> b!75847 m!120963))

(declare-fun m!120965 () Bool)

(assert (=> b!75847 m!120965))

(declare-fun m!120967 () Bool)

(assert (=> start!14736 m!120967))

(declare-fun m!120969 () Bool)

(assert (=> start!14736 m!120969))

(declare-fun m!120971 () Bool)

(assert (=> b!75844 m!120971))

(declare-fun m!120973 () Bool)

(assert (=> b!75849 m!120973))

(push 1)

(assert (not b!75848))

(assert (not b!75847))

(assert (not b!75846))

(assert (not b!75845))

(assert (not b!75844))

(assert (not b!75849))

(assert (not start!14736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

